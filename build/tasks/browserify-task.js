#! /usr/bin/env node
const path              = require('path');
const fs                = require('fs');
const mkdirp            = require('mkdirp');
const colors            = require('colors/safe');
const glob              = require('glob');
const async             = require('async');

const browserify        = require('browserify');
const babelify          = require('babelify');
const uglifyJS          = require('uglify-js');
const uglifyES          = require('uglify-es');
const i18nextBuild      = require('../tools/i18next-build');

const currentDir        = process.cwd();
const sourcePath        = 'src/main/resources/static';
const outputPath        = 'target/classes/static';
const translationFile   = `${sourcePath}/javascript/locales/build.json`;
const options           = {
  paths: [
    path.join(currentDir, 'node_modules'),
    path.join(currentDir, 'src/main/ressources/javascript')
  ]
};

const configUglifyES = {
  mangle: {
    toplevel: true
  },
  compress: {
    unsafe: true,
    unsafe_comps: true,
    unsafe_Function: true,
    unsafe_proto: true,
    unsafe_regexp: true
  }
};

const configUglify = {
  compress: {
    unsafe: true,
    unsafe_comps: true,
    unsafe_Function: true,
    unsafe_proto: true,
    unsafe_regexp: true
  }
};

function bundleFile(currFile, destFilePath, callback, modern) {
  // Launch the process and write the output to the destination filepath.
  const bundler = browserify(currFile, options);
  bundler.transform(babelify, {
    global: true,
    ignore: [/\/node_modules\/(?!(integration-web-core--socle|@lmfr-int-core)\/)/],
    presets: modern ? [['@babel/preset-env', {
      'targets': {
        'browsers': 'last 2 Chrome versions or last 2 ChromeAndroid versions or last 2 Firefox versions or last 2 iOS versions or last 2 Edge versions'
      }
    }]] : ['@babel/preset-env']
  });

  bundler.bundle((error, buffer) => {

    if(!error) {
      // Create the directory tree.
      mkdirp(path.dirname(destFilePath), (error) => {
        if(error) {
          console.log(error);
          callback(error);
        }

        //if we detect the translation i18next's file 'build.json'
        if(fs.existsSync(path.join(`${__dirname}`, `../../../../${translationFile}`))) {
          const json = JSON.parse(fs.readFileSync(path.join(`${__dirname}`, `../../../../${translationFile}`), 'utf8'));
          //Generate file for each lang detected
          for(const lang in json) {
            const destinationFilePath = destFilePath.replace('.js', `.${lang}.js`);
            const contentFile = {};
            contentFile[`${lang}`] = buffer.toString();
            console.log('\x1b[35m', `\nTranslation file detected, going translation for ${destinationFilePath.substring(destinationFilePath.lastIndexOf('/') + 1)} with language ${lang.toUpperCase()}`);
            let translationResult = i18nextBuild.generateFilesLanguage(contentFile[`${lang}`], json, lang);
            //If we need to uglify the code
            if(!process.env.noUglify) {
              const uglifyResult = modern ? uglifyES.minify(translationResult, configUglifyES) : uglifyJS.minify(translationResult, configUglify);
              if(uglifyResult.error) {
                console.log(uglifyResult.error);
                callback(error);
              } else {
                translationResult = uglifyResult.code;
              }
            }
            fs.writeFileSync(destinationFilePath, Buffer.from(translationResult));
            console.log('\x1b[37m', `\n${destinationFilePath} créé.`);
          }
          callback();
        } else {
          //If we need to uglify the code
          if(!process.env.noUglify) {
            const uglifyResult = modern ? uglifyES.minify(buffer.toString(), configUglifyES) : uglifyJS.minify(buffer.toString(), configUglify);
            if(uglifyResult.error) {
              console.log(uglifyResult.error);
              callback(error);
            } else {
              buffer = Buffer.from(uglifyResult.code);
            }
          }
          fs.writeFile(destFilePath, buffer, 'utf8', (error) => {
            if(error) {
              console.log(error);
              callback(error);
            }

            console.log(`${destFilePath  } créé.`);
            callback();
          });
        }
      });
    } else {
      console.log(error);
      callback(error);
    }
  });
}

const browserifyTask = (task, callback, modern = false) => {

  if(task !== null && task.filePath !== null) {

    const destFilePath = path.join(currentDir, modern ? task.filePath.replace(sourcePath, outputPath).replace('/javascript/','/js/').replace('.src.js', '.modern.js') : task.filePath.replace(sourcePath, outputPath).replace('/javascript/','/js/').replace('.src.js', '.js'));
    const currFile = path.resolve(task.filePath);
    bundleFile(currFile, destFilePath, callback, modern);
  } else {

    console.log(colors.cyan('\n\nSTART : Browserify build of JS files'));
    console.time('BrowserifyTask');

    const JS_SRC = glob.sync(`./${sourcePath}/**/*.src.js`);
    if(JS_SRC.length > 0) {

      async.each(JS_SRC, (filePath, eachCallback) => {
        browserifyTask({filePath: filePath}, () => {return true;});
        browserifyTask({filePath: filePath}, eachCallback, true);

      }, (err) => {

        if(err) {
          console.error(colors.red(`Browserify build of JS files failed : ${  err}`));
          console.timeEnd('BrowserifyTask');
        } else {
          console.log(colors.cyan('FINISH : Browserify build of JS files ') +  colors.green('succeed'));
          console.timeEnd('BrowserifyTask');
        }

        callback(err);
      });
    } else {
      callback();
    }
  }
};

module.exports.processTask = browserifyTask;
