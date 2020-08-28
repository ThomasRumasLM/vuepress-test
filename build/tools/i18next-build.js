'use strict';
const i18next = require('i18next');

module.exports.generateFilesLanguage = (prmJsFile, prmJsonFile, prmLang) => {
  let regex = /i18next\.t(\(\'([A-Za-z0-9\-\_\.]*)\'\)){1}/gm;
  const matches = getMatches(prmJsFile, regex, 2);

  i18next.init({
    lng: prmLang,
    debug: false,
    resources: prmJsonFile
  }, (err, t) => {
    if(err) throw err;
    for(let i = 0; i < matches.length; i++) {
      prmJsFile = prmJsFile.replace(`i18next.t('${matches[i]}')`, () => {
        let translation = i18next.t(matches[i]);
        translation = translation.replace(/'/g,"\\'");
        console.log('\x1b[34m', `Translation key found i18next.t('${matches[i]}'), translated to :`);
        console.log('\x1b[32m', translation);
        return `'${translation}'`;
      });
    }
  });
  return prmJsFile;
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
