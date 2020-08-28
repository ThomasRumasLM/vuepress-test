const doT = require('dot');

/**
 * Permet de générer du HTML à partir d'un template te d'un jeu de donnée
 * @param  {String} tpl     Le nom de la liste dans laquelle il faut boucler
 * @param  {Object} dat     Le jeu de donnée à utiliser pour traîter le template
 * @Return  {String}   Retourne le template généré
 */
export const template = (tpl, data) => {
  // if tpl is already compiled in cache, serve it
  if (tpl in cache) {
    return cache[tpl](data);
  }

  // if cache doesn't exist, create and store it
  const tmp = doT.template(tpl);
  const obj = {};
  obj[tpl] = tmp;
  Object.assign(cache, obj);
  return tmp(data);
};

// Compile is the most expensive task, so we cache the result
const cache = {};
