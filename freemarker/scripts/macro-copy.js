const fs = require('fs-extra');
const path = require('path')
const glob = require('glob');
const mkdirp = require('mkdirp');
const shell = require('shelljs');

const moduleDirectoryPath = path.resolve(__dirname).split('/node_modules')[0];

module.exports = function copyMacroFiles(pathOrigin = path.join(process.cwd(), 'macros')) {
  // If you're installing this repo as a dependencies in a kobi app, copy some files in

  // copy des macros communes
  console.log(' - Copie des macros communes');
  let pathDest = path.join(moduleDirectoryPath, 'src/main/resources/templates/macros/common');
  let macroFolders = glob.sync(pathOrigin + '/**/');

  shell.exec(`rm -rf ${pathDest}`);
  console.log(
    ' -- Création de l\'arborescence des dossier macro dans les sources de l\'application'
  );
  macroFolders.forEach(folder => {
    let destination = folder.replace(pathOrigin, pathDest);
    console.log(' --- Création du dossier : ' + destination);
    mkdirp.sync(destination);
  });

  let macroFiles = glob.sync(pathOrigin + '/**/*.ftl');

  console.log(' -- Copie des fichiers macro dans le target');
  macroFiles.forEach(file => {
    let destination = file.replace(pathOrigin, pathDest);
    console.log(' --- Copie du fichier : ' + destination);
    fs.copySync(file, destination);
  });

  // copy de l'icon-kit
  console.log('\n\n - Copie des svg de l\'icon-kit');

  pathOrigin = path.join(process.cwd(), 'icon-kit');
  pathDest = path.join(moduleDirectoryPath, 'src/main/resources/static/icon-kit');

  let iconFolders = glob.sync(pathOrigin + '/**/');

  console.log(
    ' -- Création de l\'arborescence des dossiers icon-kit dans les sources de l\'application'
  );
  iconFolders.forEach(folder => {
    let destination = folder.replace(pathOrigin, pathDest);
    console.log(' --- Création du dossier : ' + destination);
    mkdirp.sync(destination);
  });

  let iconFiles = glob.sync(pathOrigin + '/**/*.svg');

  console.log(' -- Copie des fichiers svg dans les sources de l\'application');
  iconFiles.forEach(file => {
    let destination = file.replace(pathOrigin, pathDest);
    console.log(' --- Copie du fichier : ' + destination);
    fs.copySync(file, destination);
  });

  // Mise à jour de la partie commune du gitignore
  let newFileContent;
  let separator =
    '## ------ Insert specific gitignore for your application below this line ------ ##';

  let commonGitignoreFile = fs.readFileSync(
    './gitignore/.gitignore_common',
    'utf-8'
  );
  let localGitignoreFile = '';
  if (fs.existsSync(path.join(moduleDirectoryPath, '.gitignore'))) {
    localGitignoreFile = fs.readFileSync(path.join(moduleDirectoryPath, '.gitignore'), 'utf-8');
  }

  if (localGitignoreFile.indexOf(separator) < 0) {
    newFileContent = commonGitignoreFile;
  } else {
    let localIgnore = localGitignoreFile.split(separator)[1];
    newFileContent = commonGitignoreFile + localIgnore;
  }
  
  fs.writeFileSync(path.join(moduleDirectoryPath, '.gitignore'), newFileContent);
  console.log('Mise à jour de la partie commune du gitignore : OK');
};
