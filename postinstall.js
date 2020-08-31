#! /usr/bin/env node
const fs = require('fs-extra');
const glob = require('glob');
const path = require('path');
const shell = require('shelljs');
const {exec} = require('child_process');

const turbineToken = process.env.npm_config_turbinetoken || process.env.turbinetoken;

const lmfrSiteProdUrl = 'https://www.leroymerlin.fr/lmfr-site';

const svg = require('./build/icon-kit.js');

// If you're installing this repo directly, install documentation and stop
if (
  !process.cwd().endsWith('node_modules/integration-web-core--socle') &&
  !process.cwd().endsWith('node_modules\\integration-web-core--socle')
) {
  // Installation des scripts de pre-commit
  console.log('copy hooks on .git folder');
  shell.exec('cp hooks/pre-commit .git/hooks/.');
  shell.exec('chmod +x .git/hooks/pre-commit');

  // Récupération des icones mozaic
  const iconFromMozaic = glob.sync('node_modules/@mozaic-ds/icons/svg/*.svg');
  svg.cleanAll(iconFromMozaic);

  if (turbineToken) {
    getFileFromLmfrSite();
  }

  console.log(' - Socle installation : stop');
  console.log('   > The script is not running from a node_modules folder');
  return;
}

//Installation de ESLint
console.log('// Eslint copy configuration files');
fs.copySync(
  path.resolve(__dirname, './.eslintrc.json'),
  '../../.eslintrc.json'
);

console.log('   > done ✔');

exec(
  'node_modules/.bin/eslint --help',
  { cwd: '../..' },
  (err, stdout, stderr) => {
    if (err) {
      // console.log(`exec err: ${err}`);
      installESLint();
      process.exit(0);
    }
  }
);

function installESLint() {
  console.log(' - Eslint installation');
  exec(
    'npm install --save-dev eslint',
    { cwd: '../..' },
    (err) => {
      if (err) {
        console.log(`exec err: ${err}`);
        process.exit(1);
      }
      console.log('   > done ✔');
    }
  );
}

function getLatestTag() {
  const response = shell.exec(
    `curl --location --request GET 'https://turbine.prod.leroymerlin.fr/api/versions/deployments/frlm-web-website-prod/lmfr-site/deployed' \
     --header 'Content-Type: application/json' \
     --header 'Authorization: Bearer ${turbineToken}' \
     --data-raw ''`,
    { silent: true }
  );
  const content = JSON.parse(response);
  return content.result[0].tags[0].name;
}

function getFileFromLmfrSite() {
  try {
    const lmfrSiteFiles = [
      ['static/js/common.js', 'documentation/.vuepress/public/javascript/common.js'],
      ['static/css/common.css', 'documentation/.vuepress/public/sass/common.css']
    ];

    // Get latest tag
    const latestTag = getLatestTag();
    console.log('/// LATEST TAG :', latestTag);

    //Show file and set it to a new one
    for (let i = 0; i < lmfrSiteFiles.length; i++) {
      shell.exec(
        `rm -rf ${lmfrSiteFiles[i][1]}` &&
          `curl --compressed -o ${lmfrSiteFiles[i][1]} ${lmfrSiteProdUrl}/${latestTag}/${lmfrSiteFiles[i][0]}`
      );
    }
    // shell.exec(`rm -rf ${path.join(__dirname, "./lmfr-site")}`);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
}
