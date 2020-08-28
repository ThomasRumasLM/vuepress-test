#! /usr/bin/env node

const path = require('path');
const watcherTask = require('./tasks/watcher-task.js');
const conf = require('./conf/build-config.json');
const currentDir = process.cwd();

process.env.noUglify = true;

// SOURCE PATH WATCH
watcherTask.watch(conf.srcPaths.map((e) => path.join(currentDir, e)));
