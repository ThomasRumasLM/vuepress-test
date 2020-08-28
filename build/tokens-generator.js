const fs = require('fs');
const path = require('path');
const jsonSass = require('json-sass-vars');
const tokensDirectory = path.join(__dirname, '../tokens');
const tokensScssDirectory = path.join(__dirname, '../css/assets/sass/_tokens');
const tokensFreemarkerDirectory = path.join(__dirname, '../freemarker/macros/tokens');
const tokensJavascriptDirectory = path.join(__dirname, '../js/assets/tokens');

deleteFolderRecursive(tokensScssDirectory);
deleteFolderRecursive(tokensFreemarkerDirectory);
deleteFolderRecursive(tokensJavascriptDirectory);

fs.mkdirSync(tokensScssDirectory);
fs.mkdirSync(tokensFreemarkerDirectory);
fs.mkdirSync(tokensJavascriptDirectory);

console.info(`Token generation starded, pls wait...\n\n`);

fs.readdir(tokensDirectory, (err, files) => {
  if(err) {
    console.error(`Unable to scan directory ${err}`);
    return;
  }
  files.forEach((file) => {
    console.info(`Generate token for ${file}`);
    generateScssTokens(file);
    generateFreemarkerTokens(file);
    generateJavascriptTokens(file);
  });
});

function generateFreemarkerTokens(prmFile) {
  fs.readFile(`${tokensDirectory}/${prmFile}`, (err, contents) => {
    if(err) {
      console.error(`Unable to read file ${prmFile} error ${err}`);
      return;
    }
    const string = contents.toString();
    const freemarkerObject = `<#assign json = ${string}/>
    `;
    fs.writeFile(`${tokensFreemarkerDirectory}/${prmFile.split('.json')[0]}.ftl`, Buffer.from(freemarkerObject), (err) => {
      if(err) {
        console.error(`Error when creating freemarker file ${prmFile} ${err}`);
      }
    });
  });
}

function generateScssTokens(prmFile) {
  fs.createReadStream(`${tokensDirectory}/${prmFile}`)
    .pipe(jsonSass({
      prefix: `$${prmFile.split('.json')[0]}: `,
    }))
    .pipe(fs.createWriteStream(`${tokensScssDirectory}/${prmFile.split('.json')[0]}.scss`));
}

function generateJavascriptTokens(prmFile) {
  fs.copyFile(`${tokensDirectory}/${prmFile}`, `${tokensJavascriptDirectory}/${prmFile}`, (err) => {
    if(err) {
      console.error(`Can't copy files ${err}`);
    }
  });
}

function deleteFolderRecursive(prmPath) {
  if (fs.existsSync(prmPath)) {
    fs.readdirSync(prmPath).forEach((file) => {
      const curPath = path.join(prmPath, file);
      if (fs.lstatSync(curPath).isDirectory()) { // recurse
        deleteFolderRecursive(curPath);
      } else { // delete file
        fs.unlinkSync(curPath);
      }
    });
    fs.rmdirSync(prmPath);
  }
}
