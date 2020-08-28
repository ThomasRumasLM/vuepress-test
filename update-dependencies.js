const fs = require('fs');
const { join } = require('path');
const modules = ['build', 'css', 'js', 'freemarker'];


const mainPackage = readPackage('package.json');

modules.forEach(module => {
  const content = readPackage(`${module}/package.json`);
  content.dependencies = {...mainPackage.dependencies, ...content.dependencies};
  fs.writeFileSync(`${module}/package.json`, JSON.stringify(content, null, 2));
});

function readPackage(prmPath) {
  const content = fs.readFileSync(join(__dirname, prmPath));
  return JSON.parse(content);
}
