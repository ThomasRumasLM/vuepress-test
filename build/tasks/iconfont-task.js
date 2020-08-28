#! /usr/bin/env node

const webfontsGenerator = require('webfonts-generator');
const currentDir        = process.cwd();
const svgFolder         = currentDir + '/node_modules/lmfr-int-socle-scss/assets/svg/';
const fs                = require('fs');
const destFont          = currentDir + '/src/main/resources/static/fonts/icofont/';
const destSass          = currentDir + '/node_modules/lmfr-int-socle-scss/assets/sass/_common/_fonts/_icofont.scss';
const cssFontsPath      = '../fonts/icofont/';
const glob              = require('glob');
const colors            = require('colors/safe');

const processTask = (task, callback) => {

  console.log(colors.cyan('\n\nSTART : icofonts build'));
  console.time('icofontTask');
  var SVG_SRC = glob.sync(`${svgFolder}/**/*.svg`);
  webfontsGenerator({
    files: SVG_SRC,
    dest: destFont,
    cssDest: destSass,
    cssFontsUrl: cssFontsPath,
  }, function(error) {
    if (error) {
      console.log('Build of icofonts failed ! : ', error);
      console.timeEnd('icofontTask');
    } else {
      console.log(colors.cyan('FINISH : Build of icofonts ') +  colors.green('succeed'));
      console.timeEnd('icofontTask');
      callback();
    }
  })


}

module.exports.processTask = processTask;
