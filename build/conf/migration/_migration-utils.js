#! /usr/bin/env node
const fs = require('fs');
const path = require('path');
const glob = require('glob');
const relativeDirName = path.relative(process.cwd(), __dirname );

function findPrevVersion(prmPackageJson) {
	let lastVersion = 0;

	if(!prmPackageJson.config) {
    prmPackageJson.config = {};
  } else {
    lastVersion = prmPackageJson.config.lastMigratedVersion;
  }

  return parseInt(lastVersion);
}

function findNewVersion(prmPackageJson) {
  let socleDependendency = prmPackageJson.devDependencies["integration-web-core--socle"];
	let socleVersion = 1
	if( socleDependendency.match(/[~^]\d|^[0-9]/) ) {
		socleVersion = socleDependendency.split('~')[1] || socleDependendency.split('^')[1] || socleDependendency.charAt(0);
	}
	return parseInt(socleVersion);
}

function getJson(prmFilePath) {
  let src = fs.readFileSync(prmFilePath, "utf-8");
	let fileContent = JSON.parse(src);
	return fileContent;
}

function migrationHasRulesForThisVersion(prmVersion) {
  try {
    glob.sync(`${relativeDirName}/conf/migration/${prmVersion}/`)
    return true
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
}


module.exports.findPrevVersion = findPrevVersion;
module.exports.findNewVersion = findNewVersion;
module.exports.getJson = getJson;
module.exports.migrationHasRulesForThisVersion = migrationHasRulesForThisVersion;
