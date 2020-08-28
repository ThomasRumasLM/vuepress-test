'use strict';
const loaderUtils = require('loader-utils');
const i18next = require('i18next');
const fs = require('fs');

module.exports = function (source) {
  const options = loaderUtils.getOptions(this);

  const regex = /i18next\.t(\(\'([A-Za-z0-9\-\_\.]*)\'\)){1}/gm;
  const matches = getMatches(source, regex, 2);

  i18next.init({
    lng: options.lang,
    debug: false,
    resources: JSON.parse(fs.readFileSync(options.translationFile, 'utf8'))
  }, (err) => {
    if (err) throw err;
    for (let i = 0; i < matches.length; i++) {
      source = source.replace(`i18next.t('${matches[i]}')`, () => {
        let translation = i18next.t(matches[i]);
        translation = translation.replace(/'/g, "\\'");
        console.log('\x1b[34m', `Translation key found i18next.t('${matches[i]}'), translated to :`);
        console.log('\x1b[32m', translation);
        return `'${translation}'`;
      });
    }
  });
  return source;
}

function getMatches(string, regex, index) {
  index || (index = 1); // default to the first capturing group
  var matches = [];
  var match;
  while (match = regex.exec(string)) {
    matches.push(match[index]);
  }
  return matches;
}
