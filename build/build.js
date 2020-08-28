#! /usr/bin/env node
const sassTask        = require('./tasks/sass-task.js');
const browserifyTask  = require('./tasks/webpack-task.js');
const descriptorTask  = require('./tasks/descriptor-task.js');
const sanityCheck 	  = require('./tasks/sanity-check-task.js');
const rsyncTask       = require('./tasks/rsync-task.js');
const mkdirp          = require('mkdirp');
const async           = require('async');
const colors          = require('colors/safe');
const path            = require('path');

const BASE_DIR = process.cwd();

// Create dist folder if it does not exist.
mkdirp.sync(path.join(BASE_DIR, './target/classes'));


// Execute all tasks in serie.
const treatments = [ sassTask, browserifyTask, descriptorTask, sanityCheck ];

// Démarer le build
const build = () => {
  console.time('Total Build Time');
  // generateIcofont();
  rsync();

};
// builder l'icofont puis passer au rsync
// let generateIcofont = () => {
// 	icofontTask.processTask(null, rsync);
// }

// faire le rsync puis lancer les taches asynchrones
const rsync = () => {
  rsyncTask.processTask(null, otherTasks);
};

// Lancer chaque tache asynchrone en même temps
const otherTasks = () => {
  async.eachSeries(treatments, (task, eachCallback) => {
    task.processTask(null, eachCallback);
  }, (err) => {
    if(err) {
      console.error(colors.red(`Build failure : ${  err}`));
      process.exit(1);
    } else {
      console.log(colors.bgGreen.bold('\n\n                 \n  Build succeed  \n                 \n\n'));
    }
    console.timeEnd('Total Build Time');
  });
};

// Let's go !
build();
