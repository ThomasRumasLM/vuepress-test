const browserslist = require('browserslist');
const autoprefixer = require('autoprefixer');
const nodeSass = require('postcss-node-sass');
const nano = require('cssnano');
const path = require('path');

const browserslistConfig = browserslist.findConfig(process.mainModule.paths[0] + "/.browserslistrc").defaults;
const LMFRPostCSSPlugins = [
  autoprefixer({ overrideBrowserslist: browserslistConfig }),
  nodeSass({
    includePaths: [
      path.join(process.cwd(), 'node_modules')
    ],
    sourceMap: false
  }),
  nano({
    preset: ['default', {
      calc: false,
    }]
  })
];

const customPostCssPlugins = [];

module.exports = customPostCssPlugins;
