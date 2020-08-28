#! /usr/bin/env node
const fs = require('fs');
const path = require('path');
const colors            = require('colors/safe');
const glob              = require('glob');
const currentDir = process.cwd();

// -------------------- FUNCTIONS 
// 
let results = [];

// Find template path in a controller
let findTPLfromControllers = (controllers) => {
	let rgxTPL1 = /@RequestMapping\(value = "(.*)"\)/gi; 
	let rgxTPL2 = /TEMPLATE = "(.*)\/(.*)"/gi; 
	
	for (let i = 0; i < controllers.length; i++) {
		let controller = fs.readFileSync(controllers[i], 'utf8');
		// REGEX 1
		let tplMatch = controller.match(rgxTPL1);
		if(tplMatch) {
			// console.log( ">>> "+controllers[i]+" : \n ", tplMatch );
			for (let i = 0; i < tplMatch.length; i++) {
				// console.log( tplMatch[i].replace(rgxTPL, "$1") )
				let templatePath = tplMatch[i].replace(rgxTPL1, "$1");
				let templateName = templatePath.split('/');
				templateName = templateName[templateName.length-1];
				// console.log(`/src/main/resources/templates${templatePath}/${templateName}.ftl`)
				parseTPL(`/src/main/resources/templates${templatePath}/${templateName}.ftl` );
			}
		}
		// REGEX 2
		tplMatch = controller.match(rgxTPL2);
		if(tplMatch) {
			// console.log( ">>> "+controllers[i]+" : \n ", tplMatch );
			for (let i = 0; i < tplMatch.length; i++) {
				// console.log( tplMatch[i].replace(rgxTPL, "$1") )
				let templatePath = tplMatch[i].replace(rgxTPL2, "$1");
				let templateName = tplMatch[i].replace(rgxTPL2, "$2");
				// console.log(`/src/main/resources/templates${templatePath}/${templateName}.ftl`)
				parseTPL(`/src/main/resources/templates${templatePath}/${templateName}.ftl` );
			}
		}
	}
	//console.log( "> ", results )
	return results;
}

// Read a template to find all the include inside.
let parseTPL = ( file ) => {
	if( !fs.existsSync(`${currentDir}${file}`) ) {
		UNFINDED_TEMPLATES.push(file);
		return;
	}
	let tpl = fs.readFileSync( `${currentDir}${file}`, 'utf8');
	if( results.indexOf(file) <= 0 ) {
		// console.log( file );
		results.push( file );
	} else {
		return;
	}
	let rgx = /#(include|import)(.*)([\"\'])(.*)\.ftl([\"\'])/gi;
	let tplMatch = tpl.match(rgx);
	if( tplMatch ) {
	  // console.log(tplMatch)
	  for (var i = 0; i < tplMatch.length; i++) {
		let foundTPL = `${file.replace(/(\/)([A-Za-z0-9\-_\.]+\.(ftl)$)/, '/')}${tplMatch[i].replace(rgx, "$4.ftl")}`;
	  	foundTPL = path.normalize(foundTPL);
	  	parseTPL( foundTPL );
	  }
	}
}

// Clean up ../ from path 

// -------------------- PROCESS DATA 
//

const UNFINDED_TEMPLATES = [];
const UNUSED_TEMPLATES = [];

const processTask = (task, callback) => {

	console.log(colors.cyan('\n\nSTART : template sanity-check '));
	console.time('sanityCheckTask');

	const ALL_TEMPLATES = glob.sync(`${currentDir}/src/**/*.ftl`);
	ALL_TEMPLATES.forEach( (x, i) => { ALL_TEMPLATES[i] = x.replace( currentDir, '' ); } );

	let controllerFolders = currentDir+"/src/main/java/fr/leroymerlin/navigation/components/";

	const CONTROLLERS = glob.sync(`${currentDir}/src/main/java/**/components/**/*.java`);
	const USED_TEMPLATES = findTPLfromControllers( CONTROLLERS );

	for (var i = 0; i < ALL_TEMPLATES.length; i++) {
	  if( USED_TEMPLATES.indexOf( ALL_TEMPLATES[i] ) < 0 ) { UNUSED_TEMPLATES.push( ALL_TEMPLATES[i] ) }
	}

	let logs = `
	 ${ALL_TEMPLATES.length} fichier(s) de template sont présents dans l'application
	 ${USED_TEMPLATES.length} fichier(s) de template sont effectivement utilisés
	`;
	if(UNUSED_TEMPLATES.length > 0){
		logs += `
	 ${UNUSED_TEMPLATES.length} fichier(s) de template semblent inutiles :
${UNUSED_TEMPLATES.join('\n')}
	`
	} 

	if(UNFINDED_TEMPLATES.length > 0){
		logs += `
	 ${UNFINDED_TEMPLATES.length} fichier(s) de template appelés n'existent pas :
${UNFINDED_TEMPLATES.join('\n')}
	`
	} 

	if(UNUSED_TEMPLATES.length === 0 && UNFINDED_TEMPLATES.length === 0){
		logs += `
	   _____ ____  _   _  _____ _____         _______ _    _ _            _______ _____ ____  _   _  _____   _ 
	  / ____/ __ \\| \\ | |/ ____|  __ \\     /\\|__   __| |  | | |        /\\|__   __|_   _/ __ \\| \\ | |/ ____| | |
	 | |   | |  | |  \\| | |  __| |__) |   /  \\  | |  | |  | | |       /  \\  | |    | || |  | |  \\| | (___   | |
	 | |   | |  | | . \` | | |_ |  _  /   / /\\ \\ | |  | |  | | |      / /\\ \\ | |    | || |  | | . \` |\\___ \\  | |
	 | |___| |__| | |\\  | |__| | | \\ \\  / ____ \\| |  | |__| | |____ / ____ \\| |   _| || |__| | |\\  |____) | |_|
	  \\_____\\____/|_| \\_|\\_____|_|  \\_\\/_/    \\_\\_|   \\____/|______/_/    \\_\\_|  |_____\\____/|_| \\_|_____/  (_)
	                                                                                                           
	 
	`
	}

	console.log( logs );
	console.log(colors.cyan('Template sanity-check ') +  colors.green('succeed'));

	callback();
	console.timeEnd('sanityCheckTask');

}

module.exports.processTask = processTask;