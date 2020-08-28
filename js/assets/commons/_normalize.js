/**
 * Remplace les accents et espace dans une chaine de caractère
 * @param  {Array} str     La chaîne à normaliser
 * @Return  {String}  Retourne la chaîne normalisée
 */
export const normalize = (str = '', opt = {}) => {

  let formatedStr = str;
  const defaultOptions = {
    'spaces': false,
    'punctuation': false,
    'accents': false,
    'lowercase': true
  };
  opt = Object.assign(defaultOptions, opt);

  if( !opt.punctuation ) {
    formatedStr = formatedStr.replace(/([!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~])/g, '_');
  }
  if( !opt.spaces ) {
    formatedStr = formatedStr.replace(/\s/g, '_');
  }
  if( !opt.accents ) {
    const translate_re = /[àáâãäçèéêëìíîïñòóôõöùúûüýÿÀÁÂÃÄÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝ]/g;
    const translate = 'aaaaaceeeeiiiinooooouuuuyyAAAAACEEEEIIIINOOOOOUUUUY';
    formatedStr = formatedStr.replace(translate_re, function(match){
      return translate.substr(translate_re.source.indexOf(match)-1, 1);
    });
  }
  if( opt.lowercase ) {
    formatedStr = formatedStr.toLowerCase();
  }

  formatedStr = formatedStr.replace(/(_)+/g, '_');
  formatedStr = formatedStr.replace(/(_)+$/, '');
  formatedStr = formatedStr.replace(/^(_)+/, '');

  return formatedStr;
};
