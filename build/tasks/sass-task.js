process.env.MOZAIC_ENV = 'production';

const scssSyntax = require('postcss-scss');
const path = require('path');
const fs = require('fs');
const mkdirp = require('mkdirp');
const postcss = require('postcss');
const glob = require('glob');
const colors = require('colors/safe');
const async = require('async');

const currentDir = process.cwd();
const sourcePath = 'src/main/resources/static/sass';
const outputPath = 'target/classes/static/css';

const builderScss = postcss(mergeArray(require('@mozaic-ds/css-dev-tools/postcssPluginConfig'), require('../tools/postcss-build'), 'postcssPlugin'));
const sassTask = (task, callback) => {

  if (task != null && task.filePath != null) {
    const originFile = path.join(currentDir, task.filePath.replace(currentDir, ''));
    const destFilePath =
      path.join(
        currentDir, outputPath,
        task.filePath.replace(currentDir, '')
          .replace('.src.scss', '.css')
          .replace(sourcePath, '')
      );

    fs.readFile(originFile, 'utf8', (error, file) => {

      if (error) {
        console.log(
          `\n`,
          colors.bgRed(` SCSS Compilation error \n\n`),
          colors.bgRed(` => Error :  `), `${error.message}\n`,
          colors.bgRed(` => In file: `), `${originFile}\n`,

          colors.bgRed(` => Line:    `), `${error.line}\n`,
          colors.bgRed(` => Column:  `), `${error.column}\n\n`,

          colors.red(` => Full error message : `), `${error.formatted}\n`,
          colors.red(`_____________`)
        )
        callback(error);

      } else {

        mkdirp(path.dirname(destFilePath), (error) => {

          if (error) {
            console.log(colors.red(`Directory error with file: ${error}`));
            callback(error);
          }

          builderScss.process(file, { from: originFile, to: destFilePath, syntax: scssSyntax })

            .then(result => {
              /*For webperformance and font preloading */
              result.css = result.css.replace(/..\/fonts/gm, '/static/fonts');
              fs.writeFile(destFilePath, result, 'utf8', (error) => {
                if (error) {
                  console.log(colors.red(`File ${destFilePath} error: ${error}`));
                  callback(error);
                }
                console.log(colors.green(`File ${destFilePath} created.`));
                callback();
              });
            })

            .catch(error => {
              console.log(
                `\n`,
                colors.bgRed(` SCSS Compilation error \n\n`),
                colors.bgRed(` => Error :  `), `${error.message}\n`,
                colors.bgRed(` => In file: `), `${originFile}\n`,

                colors.bgRed(` => Line:    `), `${error.line}\n`,
                colors.bgRed(` => Column:  `), `${error.column}\n\n`,

                colors.red(` => Full error message : `), `${error.formatted}\n`,
                colors.red(`_____________`)
              )
              process.exit(1);
            })
        });
      }
    });
  } else {
    console.log(colors.cyan("\n\nSTART : Building all sass files"));
    console.time('sassTask');

    var SASS_SRC = glob.sync(`./${sourcePath}/**/*.src.scss`);
    console.log(colors.cyan('SASS_SRC====' + SASS_SRC));
    async.each(SASS_SRC, (filePath, eachCallback) => {

      sassTask({
        filePath: filePath
      }, eachCallback);
    }, (err) => {

      if (err) {
        console.error(colors.red('Build of sass files failed : ' + err));
      } else {
        console.log(colors.cyan('FINISH : Build of sass files ') + colors.green('succeed'));
      }
      console.timeEnd('sassTask');
      callback(err);
    });
  }
};
module.exports.processTask = sassTask;

function mergeArray(a, b, prop) {
  const reduced = a.filter(aitem => !b.find(bitem => aitem[prop] === bitem[prop]));
  return reduced.concat(b);
}
