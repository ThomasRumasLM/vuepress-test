#! /usr/bin/env node
const readlineSync = require('readline-sync');
const colors       = require('colors/safe');
const shell       = require('shelljs');

const getGithubToken = () => {
	let githubToken = process.env.npm_config_githubToken;
	if( !process.env.npm_config_githubToken ) {
		console.log(`${colors.bgYellow.black(" Aucun token github trouvé dans la configuration locale ")}`);
		console.log(`- Pour des raisons de sécurité, les tokens d'API à github ne peuvent plus être hébergé dans les applications`)
		console.log(`- Il est donc conseillé pour chaque developpeur d'ajouter son token à sa configuration locale`)
		console.log(`- Pour créer un Personal Access Token, rendez-vous à cette adresse : ${colors.yellow("https://github.com/settings/tokens/new")}`)
		console.log(`-- Octroyez les droits repo, write, read`);
		console.log(`-- Activez le SSO`);
		console.log(`--- Et entrez votre token ici, il sera automatiquement ajouté dans votre fichier .npmrc`)
		githubToken = readlineSync.question('\nMon Personal Access Token : ');
		if( !isTokenValid(githubToken) ) {
			console.log(colors.bgRed(` ERREUR `) + colors.red(` Le token est invalide : `) + githubToken);
			process.exit(0);
			return false;
		}

		shell.exec(` npm config set githubToken ${githubToken}`);
		console.log(`\nLe token github ${colors.yellow(githubToken)} a été enregistré !`);
		console.log(`Pour réinitialiser ce token, éditez votre fichier .npmrc ou utilisez la commande suivante :`);
		console.log(`${colors.yellow("npm config delete githubToken")}\n`);
	}

	isTokenValid(githubToken);
	return githubToken;
}

const isTokenValid = githubToken => {
	let response = shell.exec(`curl -H "Authorization: token ${githubToken}" https://api.github.com/user`, {silent:true}).stdout;
	response = JSON.parse(response);
	if( !response.login ) {
		console.log(colors.bgRed(` ERREUR `) + colors.red(` Le token github est invalide : `) + githubToken);
		console.log(`Pour réinitialiser ce token, éditez votre fichier .npmrc ou utilisez la commande suivante :`);
		console.log(`${colors.yellow("npm config delete githubToken")}\n`);
		console.log(`Relancez ensuite la commande`);
		process.exit(0);
		return false;
	}
	return true;
}
module.exports.getGithubToken = getGithubToken;