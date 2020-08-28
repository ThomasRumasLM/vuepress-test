const copyMacroFiles = require('./scripts/macro-copy');

console.log("// Début postInstall Freemarker //\n");

if (process.cwd().includes('node_modules')) {
  copyMacroFiles('./macros');
}
