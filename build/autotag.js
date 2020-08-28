#! /usr/bin/env node
const fs           = require('fs');
const colors       = require('colors/safe');
const readlineSync = require('readline-sync');
const shell        = require('shelljs');
// ---------------- VARS --- /
let svgPostBuildTag = ( process.env.npm_config_svgPostBuildTag === "true" );
let indent = "";
let UPGRADETYPE;
let version;
let tagLabel = "";
let currentRepo = process.cwd().substring(process.cwd().lastIndexOf('/')+1)

// ---------------- UTILS --- /
let checkStatus = () => {
  let status = shell.exec(`git status | grep -e "working directory clean" -e "working tree clean" -e "la copie de travail est propre"`, {silent:true}).stdout;
  if (status.length === 0) {
    console.log(`${indent}`+colors.bgRed("\n Cannot continue : You have unstaged changes. \n") );
    abort();
  }
}
let checkTag = tag => {
  let newTag = shell.exec(`git tag | grep ${tag}`, {silent:true}).stdout;
  if (newTag.length > 0) {
    console.log(`\n${indent}`+colors.bgRed("Tag found in local, please compare your local tags and your package.json") );
    console.log(`${indent}You can use these command :` );
    console.log(`${indent}`+colors.bgYellow.black(" git tag ")+` -> list all your local tags`);
    console.log(`${indent}`+colors.bgYellow.black(" cat package.json | grep version ")+` -> log the current version in your package.json`);
    console.log(`${indent}`+colors.bgYellow.black(` git tag -d v2.2.2 `)+` -> remove your local tag`);
    console.log(`${indent}`+colors.bgYellow.black(" git fetch -tf ")+` -> fetch all the remote tag`);
    console.log(`\n${indent}`+` To avoid any problem with your future tag, you should :`);
    console.log(`${indent}`+` - Not have your future tag localy`);
    console.log(`${indent}`+` - Have an inferior version in your package.json`);
    console.log(`${indent}`+` - Be synced with remote tags`);
    abort();
  }
}
let abort = () => {
  console.log(colors.bgRed("\n Aborting. "));
  shell.exec(`git reset HEAD && git checkout package.json`, {silent: true});
  process.exit(0);
}
// ---------------- PROCESSING FUNCTIONS --- /
let checkInitialState = (resolve, reject) => {
  checkStatus();
  shell.exec(`git fetch -tf`, {silent: true});
  shell.exec(`git checkout master && git pull --rebase`, {silent: true});
  let currentBranch = shell.exec(`git branch | grep '* master'`, {silent: true}).stdout;
  if (currentBranch === 0) {
    console.log(`${indent}`+colors.bgRed("\n Cannot checkout master. \n") );
    abort();
  }
  checkStatus();
  resolve();
}
let getTagMessage = () => {
  if(process.env.npm_config_message != "%s") {
    tagLabel = `${process.env.npm_config_message}`;
    tagLabel = tagLabel.replace(/["`'\(\)]*/g, '');
  } else {
    let customTagMessage = 'feat(icons): update icon-set';
    if( !svgPostBuildTag ) {
      customTagMessage = readlineSync.question('\nAdd a tag message : ');
    }
    tagLabel = `${customTagMessage}`;
  }
}
let getUpgradeType = () => {
  if( process.env.npm_config_patch ) { UPGRADETYPE = "patch"; }
  if( process.env.npm_config_minor ) { UPGRADETYPE = "minor"; }
  if( process.env.npm_config_major ) { UPGRADETYPE = "major"; }
  if( typeof UPGRADETYPE == "undefined" ) {
    let options = ['patch', 'minor', 'major'];
    let index = 1;
    if( !svgPostBuildTag ) {
      index = readlineSync.keyInSelect(options, colors.black.bgYellow(' Which upgrade type do you want to apply ? '));
    }
    if(index === -1) {  
      console.log('\n\n'+`${indent}`+colors.bgRed.bold('No upgrade type defined \n'));
      abort();
    }
    UPGRADETYPE = options[index];
  } else {
    console.log(`\n  You'll create a `, colors.bgYellow.black(` ${UPGRADETYPE} `) ,` tag ?`)
    if( !svgPostBuildTag ) {
      if (!readlineSync.keyInYN(`    Continue ?`)) {
       abort();
      }
    } 
  }}
let updatePackage = () => {
  let packageFile = fs.readFileSync('package.json', 'utf8');
  let packageJSON = JSON.parse(packageFile);
  version = packageJSON.version

  let newVersion = function(){
      let a = version.split('.');
      switch(UPGRADETYPE) {
        case "patch":
          a[2] = parseInt(a[2])+1;
          break;
        case "minor":
          a[1] = parseInt(a[1])+1;
          a[2] = 0;
          break;
        case "major":
          a[0] = parseInt(a[0])+1;
          a[1] = 0;
          a[2] = 0;
          break;
    }
    return a.join('.');
  }();

  checkTag(`v${newVersion}`);
  console.log("\n"+colors.bgYellow.black(` <${currentRepo}> `),"will upgrade from", colors.bgYellow.black(` ${version} `), "to", colors.bgGreen.black(` ${newVersion} `) )
  if( !svgPostBuildTag ) {   
    if (!readlineSync.keyInYN("  Continue ?")) {
      abort();
    }
  }

  return {packageFile, newVersion};
}
let writePackage = data => {
  let newPackage = data.packageFile.replace(/\"version\": \"(\d*)\.(\d*)\.(\d*)\"/g, `"version": "${data.newVersion}"`);
  fs.writeFileSync("package.json", newPackage);
  return data.newVersion;
}

let pushToGit = newVersion => {

  let newCommitMessage = `chore(version): update from ${version} to ${newVersion}`;
  let newTagMessage = `Update from ${version} to ${newVersion} : ${tagLabel}`;

  console.log(colors.bgYellow.black(`\n New Commit message : `) + ` ${newCommitMessage}` );
  if( !svgPostBuildTag ) {
    if (!readlineSync.keyInYN("  Continue ?")) {
      abort();
    }
  }

  console.log(colors.bgYellow.black(`\n New Tag message : `) + ` ${newTagMessage}` );
  if( !svgPostBuildTag ) {
    if (!readlineSync.keyInYN("  Continue ?")) {
      abort();
    }
  }

  shell.exec(`git add package.json`);
  shell.exec(`git commit -m "${newCommitMessage}"`);

  shell.exec(`git tag -a v${newVersion} -m "${newTagMessage}"`);
  

  shell.exec(`git push && git push --tags`);
}
// ---------------- LET'S GO --- /
new Promise(function(resolve, reject) {
    // console.log(`\n`);
    console.log(`${indent}`+colors.bgYellow.black(" Start new tag generation "));
    indent += "  ";
    checkInitialState(resolve, reject);
})
  .catch(error => { 
    console.log(error); 
    process.exit(1); 
  })
  .then( () => {
    return getUpgradeType();
  })
  .then( () => {
    return getTagMessage();
  })
  .then( () => {
    return updatePackage();
  })
  .then( data => {
    return writePackage(data);
  })
  .then( version => {
    return pushToGit(version);
  })




