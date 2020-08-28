/* eslint-disable no-console */
const fs = require('fs-extra');
const fm = require('front-matter');
const basePath = 'documentation/pages/';

const sortedArbo = [];

function getTitle(path){
  const data = fs.readFileSync(path).toString('utf8');
  const content = fm(data);
  const {title} = content.attributes;
  return title;
}

function getOrder(path){
  const data = fs.readFileSync(path).toString('utf8');
  const content = fm(data);
  const {order} = content.attributes;
  return order;
}

function orderArray(array, result){
  array.forEach(function(key) {
    result[getOrder(`${key}index.md`) - 1] = key;
  });
}

const getDirectories = source =>
  fs.readdirSync(source, { withFileTypes: true })
    .filter(dirent => dirent.isDirectory())
    .map(dirent => `${source}${dirent.name}/`);

const arbo = getDirectories(basePath);

function containsDirectories(path){
  return getDirectories(path).length > 0;
}

function buildStep(array){
  array.forEach(function(item, index) {
    if(containsDirectories(item)) {
      const array = getDirectories(item);
      this[index] = {
        title: getTitle(`${item}index.md`),
        path: item,
        children: array
      };
    } else {

      this[index] = item;
    }
  }, array);
}

orderArray(arbo, sortedArbo);
buildStep(sortedArbo);

sortedArbo.forEach(function(item, index) {
  if(typeof item === 'object') {
    if(containsDirectories(item.path)) {
      buildStep(item.children);
    }
  } else {
    this[index] = item;
  }
}, sortedArbo);

const menuStg = `module.exports = ${JSON.stringify(sortedArbo).replace(/documentation/g, '').replace(/"/g, '\'')}`;

fs.writeFileSync('documentation/.vuepress/sidebarMenu.js',menuStg);
