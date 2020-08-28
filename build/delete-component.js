#! /usr/bin/env node
const fs = require('fs-extra');
const path = require('path');

let moduleFolder = null;
let controllerPath = '/src/main/java/fr/leroymerlin/';
let ressourcePath = '/src/main/resources/static/';
let templatePath = '/src/main/resources/templates/components/';


// -------------------- FUNCTIONS 
// 
let normalizeName = name => {
    // Delete Number from name
    if( name.match(/(\d)/g) ) {
        // console.log(`============================================================================`);
        console.log(` Le nom du Composant ne doit pas contenir de nombre. Ils ont été supprimés.`);
        console.log(`===========================================================================\n`);
        name = name.replace(/(\d)/g, '');
    }

    // Delete space and separator from name
    if( name.indexOf(' ') >= 0 ) {
        // console.log(`============================================================================`);
        console.log(` Le nom du Composant ne doit pas contenir d'espace ou tirets. Ils ont été convertis en CamelCase.`);
        console.log(`=================================================================================================\n`);
        name = name.replace(/([ '\-\_])(\w)/g, (str) => { return str.toUpperCase();  });
        name = name.replace(/([ '\-\_])/g, '' );
    } 
    return name;
}
let checkIfItAlreadyExist = name => {
  moduleFolder = fs.readdirSync(`${process.cwd()}${controllerPath}`)[0];
  return fs.existsSync(`${process.cwd()}${controllerPath}${moduleFolder}/components/${name}`)
}
let capitalize = str => str.replace(/./, str => str.toUpperCase());

// -------------------- PROCESSING
// 
if( !process.argv[2] ) {
  throw Error(`Le nom du Composant est manquant ! Exemple: npm run delete-component monComposant`);
}
let componentName = normalizeName(process.argv[2]);
let componentNameLower = componentName.toLowerCase();

if( !checkIfItAlreadyExist(componentName.toLowerCase()) ) {
  throw Error(`Le Composant <${componentName}> n'existe pas !`);
}

console.log(` > Suppression du composant ${componentName} !`);
console.log(`---------------------------------------------------------------\n`);

fs.removeSync(`${process.cwd()}${controllerPath}${moduleFolder}/components/${componentNameLower}`);
fs.removeSync(`${process.cwd()}${ressourcePath}javascript/${componentNameLower}`);
fs.removeSync(`${process.cwd()}${ressourcePath}sass/${componentNameLower}`);
fs.removeSync(`${process.cwd()}${templatePath}${componentNameLower}`);

console.log(' > SUCCESS !\n')