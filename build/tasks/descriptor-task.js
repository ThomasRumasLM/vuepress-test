#! /usr/bin/env node
const path              = require('path');
const fs                = require('fs-extra');
const mkdirp            = require('mkdirp');
const colors            = require('colors/safe');
const glob              = require('glob');
const async             = require('async');

const currentDir        = process.cwd();
const sourcePathJs        = './src/main/resources/static/javascript';
const sourcePathCss       = './src/main/resources/static/sass';
const outputPathJs        = '/target/classes/static/js';
const outputPathCss       = '/target/classes/static/css';
const options           = {
  paths: [
    path.join(currentDir, 'node_modules')
  ]
};

const descriptorTask = (task, callback = () => {}) => {

  if(task != null && task.filePath != null) {

    let destFilePath = '';
    if(task.filePath.indexOf('js.txt') > -1){
      destFilePath = path.join(currentDir, outputPathJs, task.filePath.replace(sourcePathJs, ''));
      console.log(` Copy ${task.filePath} to ${task.filePath.replace(sourcePathJs, outputPathJs)}`);
    } else {
      destFilePath = path.join(currentDir, outputPathCss, task.filePath.replace(sourcePathCss, ''));
      console.log(` Copy ${task.filePath} to ${task.filePath.replace(sourcePathCss, outputPathCss)}`);
    }

    const currFile = path.resolve(task.filePath);
    fs.copyFileSync(currFile, destFilePath);

  } else {

    console.log(colors.cyan('\n\nSTART : Descriptor build files'));
    console.time('descriptorTask');

    let JS_SRC = glob.sync('./src/main/resources/static/**/*.js.txt');
    let CSS_SRC = glob.sync('./src/main/resources/static/**/*.css.txt');
    let SRC = JS_SRC.concat(CSS_SRC);

    if(SRC.length > 0) {

      SRC.forEach( file => {
        descriptorTask({ 'filePath': file });
      });
    }
    console.log(colors.cyan('descriptor build files ') +  colors.green('succeed'));
    console.timeEnd('descriptorTask');
    callback();
  }
};

module.exports.processTask = descriptorTask;
