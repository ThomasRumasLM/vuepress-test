#! /usr/bin/env node

const shell = require('shelljs'); // Used to exec git command
const colors = require('colors/safe'); // Used to color log output
const fs     = require('fs'); // Used to read/write files locally
const path   = require('path'); // Used handle file and directory path
const glob   = require('glob'); // Used to search files

const utils = require('./conf/migration/_migration-utils.js');
const package = utils.getJson("package.json", {debug: true});


let indent = "";
let migrationRulesList = [];
let fromVersion = utils.findPrevVersion(package);
let destVersion = utils.findNewVersion(package);

//No migration needed
if(fromVersion === destVersion) {
  console.log('No migration needed, exit program');
  process.exit(0);
}

console.log(`${indent}${colors.black.bgCyan(` --- Migrate App from socle version ${fromVersion} to ${destVersion} --- `)}\n`);

//On veut exécuter les correspondances depuis la migration précédente à la dernière disponible
for (var i = fromVersion + 1; i <= destVersion; i++) {
  if(utils.migrationHasRulesForThisVersion(i)) {
    migrationRulesList = [].concat(migrationRulesList,
    glob.sync(`${__dirname}/conf/migration/v${i}/*.json`));
  }
}
indent += "  ";
console.log(`${indent}${colors.black.bgCyan(` --- Found these migration file --- `)}\n`);
migrationRulesList.forEach(e => {
	console.log(` ${colors.green(`   - ${path.basename(e)}`) } `);
});

console.log(`\n${indent}${colors.black.bgCyan(` --- Start app migration --- `)}\n`);

indent += "  ";

migrationRulesList.forEach(migrationRules => {
	console.log(`${indent}${colors.black.bgCyan(` --- Processing ${path.basename(migrationRules)} --- `)}`);


	let rules = utils.getJson(migrationRules);
	let fileToCheck = glob.sync( rules.files, {"ignore": rules.ignore} )
	rules.transform.forEach(transform => {
		let isWarning = (transform.type === "warning");
		let warningFound = [];
		let regx = new RegExp(transform.oldSyntax, 'g');

		fileToCheck.forEach(filePath => {
			let file = fs.readFileSync(filePath, "utf-8");
			let newfile = file;

			switch( transform.type ) {
				case 'regex':
					newfile = newfile.replace(regx, transform.newSyntax);
					if(file != newfile) {
						fs.writeFileSync(filePath, newfile);
					}
				break;
				case 'replacement':
					let escapedSyntax = transform.oldSyntax;
					escapedSyntax = escapedSyntax.replace(/\$/g, `\\$`);
					escapedSyntax = escapedSyntax.replace(/\(/g, `\\(`);
					escapedSyntax = escapedSyntax.replace(/\)/g, `\\)`);
					escapedSyntax = escapedSyntax.replace(/\*/g, `\\*`);
					escapedSyntax = escapedSyntax.replace(/\{/g, `\\{`);
					escapedSyntax = escapedSyntax.replace(/\}/g, `\\}`);
					regx = new RegExp(escapedSyntax, 'g');
					newfile = newfile.replace(regx, transform.newSyntax);
					if(file != newfile) {
						fs.writeFileSync(filePath, newfile);
					}
				break;

				case 'warning':
					regx = new RegExp(transform.oldSyntax, 'g')
					if( file.match(regx, transform.newSyntax) ) {
						warningFound.push(path.basename(filePath))
					}
				break;
			}
		});

		if( warningFound.length > 0 && isWarning ) {
			console.warn(indent+colors.bgRed(` /!\\ ${transform.message} /!\\ `));
			console.log(colors.red(`${indent+' - '+warningFound.join('\n '+indent+'- ')} `));
		}
	});

	console.log(`${indent}Processing ${colors.green(path.basename(migrationRules))} : Success !\n`)

});

package.config.lastMigratedVersion = `${destVersion}`;
fs.writeFileSync("package.json", JSON.stringify(package, null, 2));
shell.exec(`git status`);
console.log(`\nPour voir les modifications apportées : ${colors.black.bgYellow(' git diff ')} `);
