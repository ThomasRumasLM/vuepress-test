#! /usr/bin/env node
const fs     = require('fs-extra');
const path     = require('path');
const glob   = require('glob');

console.log("// Génération de la planche d'icone //\n");

fs.writeFileSync( "index.html", `
<!DOCTYPE html> <html lang="fr"> <head> <meta charset="UTF-8"> <title>Tableau icones disponible</title> </head> <body> <style> body {font-family: sans-serif; text-align: center; } div {width: 80%; margin: 0 auto; } table {border-collapse: collapse; border-spacing: 0; margin: 0 auto; } td, th {border: 1px #555 solid; padding: 5px 20px; height: 48px; text-align: center; } tr:nth-child(2n+1) {background: #faf9f9; } th {background: #666; color: #fff; text-align: left; } tr:nth-child(1) td {border: 0; } tr:nth-child(1) th {text-align: center; padding: 20px; } svg.-hidden {display: none; } tr td:nth-child(2) svg {width: 16px; height: 16px; } tr td:nth-child(3) svg {width: 24px; height: 24px; } tr td:nth-child(4) svg {width: 32px; height: 32px; } tr td:nth-child(5) svg {width: 48px; height: 48px; } tr td:nth-child(6) svg {width: 64px; height: 64px; } </style> <div> <h1>Tableau récapitulatif des icônes disponibles</h1> <table> <tr> <td></td> <th>16px</th> <th>24px</th> <th>32px</th> <th>48px</th> <th>64px</th> </tr> @@ICONS </table> </div> </body> </html>
` )

let iconFiles = glob.sync("./icon-kit/*.svg");

let lastItem = "";
let lastItemSize = 0;
let iconListHTML = "";


iconFiles.forEach(file => {
    let iconID = file;
    iconID = path.basename(iconID);
    let iconName = iconID;
    iconID = iconID.slice( 0 , iconID.length-9);
    iconName = iconName.slice( 0 , iconName.length-4);
    let iconSize = iconName;
    iconSize = iconSize.slice( iconName.length-4 , iconName.length-3 );
    if( iconSize == 6 ) { iconSize = 5 }

    if( iconID != lastItem ) {
        lastItem = iconID;

        if( 0 < lastItemSize && lastItemSize < 5 ) {
            for (var i = 5 - lastItemSize; i > 0; i--) {
                iconListHTML += `<td></td>`;
            }
        }

        iconListHTML += `</tr><tr><th>${iconID}</th>`;
        lastItemSize = 0;
    }

    if( iconSize - lastItemSize > 1 ) {
        for (var i = (iconSize - lastItemSize) - 1; i > 0; i--) {
            iconListHTML += `<td></td>`;
        }
    }
    lastItemSize = iconSize;

    let svg = fs.readFileSync(file, 'utf-8');
    iconListHTML += `<td>${svg}<svg><use href="#${iconName}"></use><svg></td>`;
});

if( lastItemSize < 6 ) {
    for (var i = 5 - lastItemSize; i > 0; i--) {
        iconListHTML += `<td></td>`;
    }
}

fs.readFile("index.html", 'utf-8',(err, data) => {
  fs.writeFileSync( "index.html", data.replace("@@ICONS", iconListHTML) )
});

console.log(` - Fichier ${process.cwd()}/index.html créé \n`);
console.log("// Fin de la génération de la planche d'icone //\n");
