#! /usr/bin/env node

const colors = require('colors/safe');
const chokidar = require('chokidar');
const ocTask = require('./oc-task.js');
const shell = require('shelljs');

module.exports.watch = (watchedPaths) => {

  console.log(colors.blue('Starting watcher'));

  chokidar.watch(watchedPaths, {
    ignoreInitial: true,
    ignored: /[\/\\]\./
  }).on('add', () => {
    launchBuild();
  }).on('addDir', () => {
    launchBuild();
  }).on('change', () => {
    launchBuild();
  }).on('unlink', () => {
    launchBuild();
  }).on('unlinkDir', () => {
    launchBuild();
  });

  console.log(colors.green('Watcher started'));
};

function launchBuild() {
  shell.exec('npm run build');
  ocTask.processTask();
  console.log(colors.green(`Build and syncing it's done, waiting...`));
}
