#! /usr/bin/env node

const shell = require('shelljs'); // Used to exec git command
const fs = require('fs'); // Used to read/write files locally
const http = require('https'); // Used to get files from github
const colors = require('colors/safe'); // Used to color log output
const crypto = require('crypto'); // Used to hash socle version
const readlineSync = require('readline-sync'); // Used to ask user to confirm

const secret = require('./conf/getGithubToken.js');

// ---------------- VARS --- /
const githubToken = secret.getGithubToken();
const githubApiUrl = 'api.github.com/repos/adeo';
let socleVersion = {};
let branch;

// ---------------- UTILS --- /
let getURL = (url, fn) => {

  let hostLimit = url.indexOf('/')
  let opt = {
    hostname: url.substring(0,hostLimit),
    path: url.substring(hostLimit),
    headers: {
      "Authorization": `token ${githubToken}`,
      "User-Agent": `LMFR Automatic upgrade task`
    }
  }

  let req = http.request(opt, res => {
    let response = ''; 
    res.setEncoding('utf8');
    res.on('data', (chunk) => {
      response = response + chunk;
    });
    res.on('end', () => {
      let content = JSON.parse(response).content;
      if( !content ) {
        console.error(`Impossible de récupérer le fichier ${url}`);
        console.error(`Soit le fichier n'existe pas, soit les droits au repo ne sont pas suffisant`);
        process.exit(0);
      }
      content = Buffer.from(content, 'base64').toString('ascii');
      // console.log('RESPONSE: '+ content );
      fn(content);
    });
  });

  req.on('error', (e) => {
    console.error(`problem with request: ${e.message}`);
  });
  req.end();
}
let checkStatus = () => {
  let status = shell.exec(`git status | grep -e "working directory clean" -e "la copie de travail est propre"`, {silent:true}).stdout;
  if (status.length === 0) {
    console.log(colors.bgRed("\n Cannot upgrade dependencies: You have unstaged changes. \n") );
    process.exit(1);
  }
}

// ---------------- PROCESSING FUNCTIONS --- /
let getSocleVersion = (resolve, reject) => {

  setTimeout( () => { reject("Impossible de récupérer les informations du socle"); }, 5000 );
  let RepoUrl  = `${githubApiUrl}/integration-web-core--socle/contents/package.json`;
  getURL(RepoUrl, response => {
    socleVersion = JSON.parse(response).version;
    let hash = crypto.createHash('md4').update(JSON.stringify(socleVersion)).digest("hex");
    branch = `feature_upgrade-socle-${hash}`;
    resolve(socleVersion);
  });

}
let newBranch = (resolve, reject) => {

  checkStatus();

  shell.exec(`git checkout master && git pull --rebase`, {silent: true});
  let currentBranch = shell.exec(`git branch | grep '* master'`, {silent: true}).stdout;
  if (currentBranch === 0) {
    console.log(colors.bgRed("\n Cannot checkout master. \n") );
    process.exit(1);
  }

  checkStatus();
  shell.exec(`git checkout -b ${branch}`, {silent: true});

  return branch;
}
let updatePackage = (resolve, reject) => {

  let package = fs.readFileSync("package.json", "utf-8");
  let newPackage = JSON.parse(package);

  let currentSocleVersion;
  let socleDependendency = newPackage.devDependencies["integration-web-core--socle"]
  if(socleDependendency) {
    if( socleDependendency.match(/#v(\d+)\.(\d+)\.(\d+)/) ) {
      currentSocleVersion = socleDependendency.split('#v')[1];
    }
  }

  if( socleVersion != currentSocleVersion && currentSocleVersion ) {
    console.log("\n  Dependencies to",colors.bgYellow.black(` <integration-web-core--socle> `),"will upgrade from", colors.bgYellow(` ${currentSocleVersion} `), "to", colors.bgGreen(` ${socleVersion} `) );
    if (readlineSync.keyInYN('    Do you want to upgrade <integration-web-core--socle> ?')) {
      newPackage.devDependencies["integration-web-core--socle"] = socleDependendency.replace(/#v([0-9\.]*)/, `#v${socleVersion}`);
    }
  }
  // if new and old package are same, abort
  if( package === newPackage ) {
    console.log(colors.bgRed("\n No change to package.json. Aborting. "))
    abortNewBranch();
  }

  fs.writeFileSync("package.json", JSON.stringify(newPackage, null, 2));

  return;
}
let verifyBuildLocaly = (resolve, reject) => {

  shell.exec(`npm i`, {silent: true});

  let buildLog = shell.exec(`npm run build`, {silent: true}).stdout;
  let buildSuccess = buildLog.includes('Build succeed');

  if( buildSuccess ) {
    console.log("\n  "+colors.bgGreen(" Build Succeed "));  
    return;
  } else {
    console.log(buildLog);  
    console.log("\n  "+colors.bgRed(" Build failed. Please read changelogs and check your application "));  
    console.log('    https://github.com/adeo/integration-web-core--socle/tags'); 
    console.log('\n');
    process.exit(0);
  }

  return;
}
let commitNewPackage = (resolve, reject) => {

  shell.exec(`git status`, {silent: true});
  shell.exec(`git add package.json`, {silent: true});
  shell.exec(`git add package-lock.json`, {silent: true});
  shell.exec(`git commit -m "chore(module): Automatic socles upgrade"`, {silent: true});

  if (readlineSync.keyInYN(`    Do you want to push new branch : ${branch} ?`)) {
    shell.exec(`git push --set-upstream origin ${branch}`, {silent: true});
    console.log("      "+colors.bgGreen(` Wait for your branch `),branch,colors.bgGreen(` to build `) );
    console.log("      "+colors.bgGreen(` Then set it in your environment for testing \n`) );
  } else {
    console.log("\n      "+colors.bgGreen(` Once ready, push new branch with following command `) );
    console.log(`\n        git push --set-upstream origin ${branch}\n`);
    console.log("      "+colors.bgGreen(` Then wait for your branch `),branch,colors.bgGreen(` to build `) );
    console.log("      "+colors.bgGreen(` Then set it in your environment for testing \n`) );
    process.exit(0);
  }



  return;
}
let abortNewBranch = (resolve, reject) => {
  shell.exec(`git checkout master`, {silent: true});
  shell.exec(`git branch -D ${branch}`, {silent: true});
  console.log(colors.bgRed(" Upgrade aborted. \n") );
  process.exit(0); 
}

// ---------------- LET'S GO --- /
new Promise(function(resolve, reject) {
  console.log(colors.bgYellow.black(" Start upgrading socles dependencies "));
  getSocleVersion(resolve, reject);
})
  .catch(error => { 
    console.log(error); 
    process.exit(1); 
  })
  .then(socleVersion => {
    return newBranch();
  })
  .then(branch => {
    return updatePackage();
  })
  .then(() => {
    console.log(colors.bgYellow.black("\n Start local build "));
    return verifyBuildLocaly();
  })
  .then(socle => {
    return commitNewPackage();
  })
  .then(() => {
    process.exit(0); 
  })