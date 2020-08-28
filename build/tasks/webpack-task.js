#! /usr/bin/env node
const webpack = require('webpack');
const path = require('path');
const fs = require('fs');
const colors = require('colors/safe');
const glob = require('glob');
const async = require('async');
const TerserPlugin = require('terser-webpack-plugin');

const currentDir = process.cwd();
const sourcePath = 'src/main/resources/static';
const outputPath = 'target/classes/static';
const translationFile = `${sourcePath}/javascript/locales/build.json`;


function bundleFile(currFile, destFilePath, callback, modern) {
  const babelModernPresets = [
    ['@babel/preset-env', {
      'targets': {
        'browsers': 'last 2 Chrome versions or last 2 ChromeAndroid versions or last 2 Firefox versions or last 2 iOS versions or last 2 Edge versions'
      }
    }]
  ];
  const babelLegacyPresets = ['@babel/preset-env'];

  const lastSlash = destFilePath.lastIndexOf('/');

  const webpackOptions = {
    mode: process.env.noUglify ? 'development' : 'production',
    optimization: {
      usedExports: true,
      minimizer: [
        new TerserPlugin()
      ]
    },
    entry: currFile,
    output: {
      path: destFilePath.substr(0, lastSlash),
      filename: destFilePath.substr(lastSlash + 1)
    },
    module: {
      rules: [
        {
          test: /\.js$/,
          use: [
            {
              loader: 'babel-loader',
              options: {
                presets: modern ? babelModernPresets : babelLegacyPresets
              }
            }
          ]
        }
      ]
    }
  };

  if (fs.existsSync(path.join(`${__dirname}`, `../../../../${translationFile}`))) {
    const json = JSON.parse(fs.readFileSync(path.join(`${__dirname}`, `../../../../${translationFile}`), 'utf8'));
    const langs = Object.keys(json).length;
    let counter = 0;
    for (const lang in json) {
      webpackOptions.output.filename = destFilePath.substr(lastSlash + 1).replace('.js', `.${lang}.js`);
      webpackOptions.module.rules[0].use.push(
        {
          loader: path.resolve(__filename, '../../tools/', 'i18next-loader.js'),
          options: {
            lang: lang,
            translationFile: translationFile
          }
        }
      );
      webpackOptions.module.rules[0].use.reverse();
      const compiler = webpack(webpackOptions);

      compiler.run((err, stats) => {
        let error = false;
        if (err) {
          console.error(err.stack || err);
          if (err.details) {
            console.error(err.details);
          }
          error = true;
          callback(err);
          return;
        }

        const info = stats.toJson();
        if (stats.hasErrors()) {
          console.error(info.errors);
          error = true;
          callback(err);
        }
        if (stats.hasWarnings()) {
          console.warn(info.warnings);
          error = true;
          callback(err);
        }

        if (!error) {
          console.log('\x1b[37m', `\n${destFilePath.replace('.js', `.${lang}.js`)} créé.`);
          counter++;
          if (counter === langs) {
            setTimeout(() => {
              callback();
            }, 500);
          }
        }
      });
    }
  } else {
    const compiler = webpack(webpackOptions);
    compiler.run((err, stats) => {
      let error = false;
      if (err) {
        console.error(err.stack || err);
        if (err.details) {
          console.error(err.details);
        }
        error = true;
        callback(err);
        return;
      }

      const info = stats.toJson();
      if (stats.hasErrors()) {
        console.error(info.errors);
        error = true;
        callback(err);
      }
      if (stats.hasWarnings()) {
        console.warn(info.warnings);
        error = true;
        callback(err);
      }

      if (!error) {
        console.log('\x1b[37m', `\n${destFilePath} créé.`);
        setTimeout(() => {
          callback();
        }, 100);
      }
    });
  }
}

const browserifyTask = (task, callback, modern = false) => {

  if (task !== null && task.filePath !== null) {

    const destFilePath = path.join(currentDir, modern ? task.filePath.replace(sourcePath, outputPath).replace('/javascript/', '/js/').replace('.src.js', '.modern.js') : task.filePath.replace(sourcePath, outputPath).replace('/javascript/', '/js/').replace('.src.js', '.js'));
    const currFile = path.resolve(task.filePath);
    bundleFile(currFile, destFilePath, callback, modern);
  } else {

    console.log(colors.cyan('\n\nSTART : Webpack build of JS files'));
    console.time('WebpackTask');

    const JS_SRC = glob.sync(`./${sourcePath}/**/*.src.js`);
    if (JS_SRC.length > 0) {

      async.each(JS_SRC, (filePath, eachCallback) => {
        browserifyTask({ filePath: filePath }, () => { return true; });
        browserifyTask({ filePath: filePath }, eachCallback, true);

      }, (err) => {

        if (err) {
          console.error(colors.red(`Webpack build of JS files failed : ${err}`));
          console.timeEnd('WebpackTask');
        } else {
          console.log(colors.cyan('FINISH : Webpack build of JS files ') + colors.green('succeed'));
          console.timeEnd('WebpackTask');
        }

        callback(err);
      });
    } else {
      callback();
    }
  }
};

module.exports.processTask = browserifyTask;
