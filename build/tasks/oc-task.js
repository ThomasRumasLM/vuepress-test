const shell = require('shelljs');
const conf = require('../conf/build-config.json');
const colors = require('colors/safe');
const fs = require('fs');

const PACKAGE_NAME = process.env.npm_package_name;
var OPENSHIFT_PLATFORM;
var OPENSHIFT_PROJECT;
var OPENSHIFT_USER;
var MODULE_POD = '';
var ENABLE_SYNCING = false;

const remotePaths = (path) => {
  return path
    .replace(/.*target\/classes\/static\//, '/tmp/integrateur/static/')
    .replace(/.*target\/classes\/templates\//, '/tmp/integrateur/templates/')
    .replace(/.*target\/classes\/site-templates\//, '/tmp/integrateur/site-templates/');
}

const dirname = (path) => {
  return path.replace(/\/[^\/]+$/, '/');
}

const checkParam = (param) => {
  return param != null && param.length > 0
}

const oclog = (msg, color = 'cyan') => {
  console.log(colors[color]("oc-task: ") + msg);
}
const initialize = () => {


  oclog(`initializing syncing for ${PACKAGE_NAME}`);

  // getting informations
  oclog("getting conf...");
  OPENSHIFT_PLATFORM = process.env.OPENSHIFT_PLATFORM;
  OPENSHIFT_PROJECT = process.env.OPENSHIFT_PROJECT;
  OPENSHIFT_USER = process.env.OPENSHIFT_USER;
  oclog(`platform=${OPENSHIFT_PLATFORM}, project=${OPENSHIFT_PROJECT}, user=${OPENSHIFT_USER}`);

  if (!checkParam(OPENSHIFT_PLATFORM) || !checkParam(OPENSHIFT_USER) || !checkParam(OPENSHIFT_PROJECT)) {
    oclog("missing conf, disabling sync!!!, please check your .bashrc file")
    return;
  }

  oclog('Checking oc command...')
  if (shell.exec('oc help > /dev/null 2>&1').code !== 0) {
    oclog("oc command line is not installed, disabling sync!!!");
    return;
  }

  oclog('Checking login...');
  if (shell.exec('oc whoami ').code !== 0) {
    oclog("You need to login to Openshift!!!", "red");
    oclog("To login, use the command:", "red");
    console.log(colors.bgYellow(` oc login -u ${OPENSHIFT_USER} ${OPENSHIFT_PLATFORM} -n ${OPENSHIFT_PROJECT} `));
    oclog("Not logged, disabling sync!!!", "magenta");
    return;
  }

  console.log(`${colors.yellow("Openshift sync :")} opening project ${OPENSHIFT_PROJECT}`)
  shell.exec(`oc project ${OPENSHIFT_PROJECT}`);
  const pjtExecution = shell.exec('oc project -q', { silent: true });
  if (pjtExecution.code !== 0) {
    oclog(`Unable to find your current project, disabling sync!!!`)
    return;
  }
  const openedProject = pjtExecution.stdout.trim();
  if (openedProject != OPENSHIFT_PROJECT) {
    oclog('cannot open project (missing user rights or project not ready), disabling sync!!!');
    return;
  }
  console.log(`${colors.yellow("Openshift sync :")} ${openedProject} opened`);

  oclog("getting remote POD identifier...")
  const modExecution = shell.exec(`oc get po -l app=${PACKAGE_NAME} -o custom-columns=NAME:.metadata.name --no-headers --field-selector status.phase=Running`, { silent: true });
  if (modExecution.code !== 0) {
    oclog('failed to find a running pod for your project, disabling sync!!!', "red")
    return;
  }
  MODULE_POD = modExecution.stdout.trim();
  console.log(`${colors.yellow("Openshift sync :")} pod=${MODULE_POD}`)
  console.log(`${colors.green("--------------------------------------------------------------------------------")}`)
  console.log(`${colors.green("- Quick access to pod's logs : ")} oc logs -f ${MODULE_POD}`)
  console.log(`${colors.green("--------------------------------------------------------------------------------")}`)

  if (MODULE_POD.trim().length == 0) {
    oclog('No module found! Possible causes:', "red")
    oclog('- Your package.json name is probably wrong, it must match the module name (example: not navigation but lmfr-navigation-module). Fix your package.json.')
    oclog('- Your service has no pod on openshift. Check the deployment.')
    return;
  }

  if (!fs.existsSync('target/classes/static') || !fs.existsSync('target/classes/templates')) {
    oclog(" /target/ folder is missing, empty or incomplete : run a first build")
    if (shell.exec(`npm run build`).code !== 0) {
      oclog('Initial build failed', "red");
      return;
    }
  }

  oclog("creating remote /tmp/integrateur/static")
  if (shell.exec(`oc rsh ${MODULE_POD} mkdir -p /tmp/integrateur/static`).code !== 0) {
    oclog('failed to create "/tmp/integrateur/static" directory, disabling sync!!!', "red")
    return;
  }

  if (PACKAGE_NAME !== "lmfr-site") {
    oclog("creating remote /tmp/integrateur/templates")
    if (shell.exec(`oc rsh ${MODULE_POD} mkdir -p /tmp/integrateur/templates`).code !== 0) {
      oclog('failed, disabling sync!!!', "red")
      return;
    }
  } else {
    oclog("creating remote /tmp/integrateur/site-templates")
    if (shell.exec(`oc rsh ${MODULE_POD} mkdir -p /tmp/integrateur/site-templates`).code !== 0) {
      oclog('failed to create "/tmp/integrateur/site-templates",  disabling sync!!!', "red")
      return;
    }
  }

  syncFrontRessources();
  ENABLE_SYNCING = true;
}

function syncFrontRessources() {
  if (PACKAGE_NAME !== "lmfr-site") {
    oclog("syncing /tmp/integrateur/templates")
    if (shell.exec(`oc rsync --strategy=tar target/classes/templates/ ${MODULE_POD}:/tmp/integrateur/templates`).code !== 0) {
      oclog('failed, disabling sync!!!', "red")
      return;
    }
  } else {
    oclog("syncing /tmp/integrateur/site-templates")
    if (shell.exec(`oc rsync --strategy=tar target/classes/site-templates/ ${MODULE_POD}:/tmp/integrateur/site-templates`).code !== 0) {
      oclog('failed to sync "/tmp/integrateur/site-templates", disabling sync!!!', "red")
      return;
    }
  }

  oclog("syncing /tmp/integrateur/static")
  if (shell.exec(`oc rsync --strategy=tar target/classes/static/ ${MODULE_POD}:/tmp/integrateur/static`, { silent: true }).code !== 0) {
    oclog('failed to sync statics, disabling sync!!!', "red")
    return;
  }
  oclog("ready!")
}

initialize();
module.exports.processTask = syncFrontRessources;
