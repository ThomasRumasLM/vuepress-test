#! /usr/bin/env node
const fs = require('fs');
const path = require('path');
const shell = require('shelljs');
const secret = require('./conf/getGithubToken.js');
const githubToken = secret.getGithubToken();

let moduleFolder = null;
let moduleName = null;
let generatorApiUrl = 'https://api.github.com/repos/adeo/kobi--initializr-module-template/';
let controllerPath = '/src/main/java/fr/leroymerlin/';
let ressourcePath = '/src/main/resources/static/';
let templatePath = '/src/main/resources/templates/components/';


function normalizeName(name) {
  // Delete Number from name
  if( name.match(/(\d)/g) ) {
    // console.log(`============================================================================`);
    console.log(` Le nom du Composant ne doit pas contenir de nombre. Ils ont été supprimés.`);
    console.log(`===========================================================================\n`);
    name = name.replace(/(\d)/g, '');
  }

  // Delete space and separator from name
  if( name.indexOf(' ') >= 0 || name.indexOf('-') >= 0 || name.indexOf('_') >= 0 ) {
    // console.log(`============================================================================`);
    console.log(` Le nom du Composant ne doit pas contenir d'espace ou tirets. Ils ont été convertis en CamelCase.`);
    console.log(`=================================================================================================\n`);
    name = name.replace(/([ '\-\_])(\w)/g, (str) => { return str.toUpperCase();  });
    name = name.replace(/([ '\-\_])/g, '' );
  }
  return name;
}

function checkIfItAlreadyExist(name) {
  moduleFolder = fs.readdirSync(`${process.cwd()}${controllerPath}`)[0];
  return fs.existsSync(`${process.cwd()}${controllerPath}${moduleFolder}/components/${name}`)
}

function replaceSource(data) {
  data = data.replace(/<%= componentDirectory %>/g, componentNameLower);
  data = data.replace(/<%= componentName %>/g, componentNameCap);
  data = data.replace(/<%= componentName@camel %>/g, componentName);
  data = data.replace(/mycomponent/g, componentNameLower);
  data = data.replace(/myapp/g, moduleName);
  data = data.replace(/<%= appPackage %>/g, `fr.leroymerlin.${moduleName}`);
  return data;
}

function capitalize(str) {
  return str.replace(/./, str => str.toUpperCase());
}

function getFile(file) {
  let response = shell.exec(`curl -v -H "Authorization: token ${githubToken}" '${generatorApiUrl}contents/_finalAppName_-module/${file}'`, {silent:true}).stdout;
  let content = JSON.parse(response).content;
  if( !content ) {
    console.error(`Impossible de récupérer le fichier ${file}`);
    console.error(`Soit le fichier n'existe pas, soit les droits au repo ne sont pas suffisant`);
    process.exit(0);
  }
  return new Buffer(content, 'base64').toString('ascii');
}

// -------------------- PROCESSING
//

if( !process.argv[2] ) {
  throw Error(`Le nom du Composant est manquant ! Exemple: npm run new-component monComposant`);
}
let componentName = normalizeName(process.argv[2]);
let componentNameLower = componentName.toLowerCase();
let componentNameCap = capitalize(componentName);


if( checkIfItAlreadyExist(componentName.toLowerCase()) ) {
  throw Error(`Le Composant <${componentName}> existe déjà !`);
}
moduleName = moduleFolder;

console.log(` > Création du composant ${componentName} !`);
console.log(`---------------------------------------------------------------\n`);

fs.mkdirSync(`${process.cwd()}${controllerPath}${moduleFolder}/components/${componentNameLower}`);
fs.mkdirSync(`${process.cwd()}${ressourcePath}javascript/${componentNameLower}`);
fs.mkdirSync(`${process.cwd()}${ressourcePath}javascript/${componentNameLower}/includes`);
fs.mkdirSync(`${process.cwd()}${ressourcePath}sass/${componentNameLower}`);
fs.mkdirSync(`${process.cwd()}${templatePath}${componentNameLower}`);
fs.mkdirSync(`${process.cwd()}${templatePath}${componentNameLower}/includes`);

// Création du controller
let controllerComponent = getFile(encodeURI("src/main/java/_appPackage%package_/components/_componentName%camel_/_componentName_Controller.java"));
fs.writeFileSync(`${process.cwd()}${controllerPath}${moduleFolder}/components/${componentNameLower}/${componentNameCap}Controller.java`, replaceSource(controllerComponent))

// Création du fragment
let fragmentComponent = getFile(encodeURI("src/main/java/_appPackage%package_/components/_componentName%camel_/_componentName_Fragment.java"));
fs.writeFileSync(`${process.cwd()}${controllerPath}${moduleFolder}/components/${componentNameLower}/${componentNameCap}Fragment.java`, replaceSource(fragmentComponent))

// Création du template
let tplComponent = getFile(encodeURI("src/main/resources/templates/components/_componentName%camel_/_componentName%camel_.ftlh"));
fs.writeFileSync(`${process.cwd()}${templatePath}${componentNameLower}/${componentNameLower}.ftl`, replaceSource(tplComponent))

// Création du css
let cssComponent = getFile("src/main/resources/static/sass/_finalAppName_.src.scss");
fs.writeFileSync(`${process.cwd()}${ressourcePath}sass/${componentNameLower}/${componentNameLower}.src.scss`, replaceSource(cssComponent))

// Création du descripteur css
let cssDescriptorComponent = getFile("src/main/resources/static/sass/_finalAppName_.css.txt");
fs.writeFileSync(`${process.cwd()}${ressourcePath}sass/${componentNameLower}/${componentNameLower}.css.txt`, replaceSource(cssDescriptorComponent))

// Création du js
let jsComponent = getFile("src/main/resources/static/javascript/_finalAppName_.src.js");
fs.writeFileSync(`${process.cwd()}${ressourcePath}javascript/${componentNameLower}/${componentNameLower}.src.js`, replaceSource(jsComponent))

// Création du descripteur js
let jsDescriptorComponent = getFile("src/main/resources/static/javascript/_finalAppName_.js.txt");
fs.writeFileSync(`${process.cwd()}${ressourcePath}javascript/${componentNameLower}/${componentNameLower}.js.txt`, replaceSource(jsDescriptorComponent))

console.log(' > SUCCESS !\n')
