#! /usr/bin/env node
const fs     = require('fs-extra');
const path     = require('path');
const config = require('./conf/svg-config.json');

let allIcons = '';
let criticalIcons = '';
let criticalIconsList = [];
let index  = 0;


//clean all svg && create critical svg
const cleanAll = iconList => {

    if( !fs.existsSync(config.dist) ) {
        fs.mkdirSync(config.dist);
    }

    iconList.forEach(svgPath => {

        let svgFile = fs.readFileSync(svgPath, 'utf8');
        let svgFileName = path.basename(svgPath, '.svg');
        let dimension = getDimension(svgPath);

        if(hasMask(svgFile)) {
            console.log(`Les SVG contenant des masques ne sont pas supportés : ${svgFileName}`)
            return;
        }

        let cleanedSvg = cleansvg(svgFile, dimension, svgPath);
        let symbolSVG = makeSymbol(cleanedSvg, svgPath);

        // console.log(svgFileName.replace('_' + dimension + 'px',''), '--', config.criticalIcons)
        if (config.criticalIcons.indexOf(svgFileName.replace('_' + dimension + 'px','')) >= 0) {
            console.log(`${svgFileName} added to ${config.criticalIconsTarget}`);
            criticalIconsList.push(svgFileName);
            criticalIcons += symbolSVG;
        } else {
            console.log(`Creating ${svgFileName}.svg`);
            fs.writeFile(`${config.dist}/${svgFileName}.svg`, concatSymbol(symbolSVG), (err) => {
                if (err) throw err;
                else {
                    console.log(config.dist + '/' + svgFileName);
                }
            });
        }
        allIcons += symbolSVG;

    });

    fs.writeFile(`${config.dist}/${config.allIconsTarget}`, concatSymbol(allIcons));
    fs.writeFile(`${config.dist}/${config.criticalIconsTarget}`, concatSymbol(criticalIcons));
    let macroIcons = fs.readFileSync('./freemarker/macros/icons.ftl', 'utf-8');
    fs.writeFileSync("./freemarker/macros/icons.ftl", macroIcons.replace('<#assign usedIconList = []>', `<#assign usedIconList = [${criticalIconsList.join(',')}]>`))
}

const getDimension = svgName => svgName.replace(/(.*)_([0-9]{2})px.svg/g, "$2");
const hasMask = svgFile => svgFile.indexOf('<mask') >= 0 ;

/*
clean le contenu des svg et formatage

- formate le svg (svg class="kl-hidden"><symbol>....</symbol></svg>)

- suppression des commentaires
- minifier
- suppression du title
- supression de la balise def et des style
- supression du rect prenant la taille du viewport
- supression des id dands les balises
 */

const cleansvg = (svgFile, dimension, svgPath) => {


    result = svgFile;
    result = result.replace('<?xml version="1.0" encoding="UTF-8"?>','');

    //suppression des commentaires
        result = result.replace(/<!--(.*)-->/g,'');
        result = result.replace(/<title>(.*)<\/title>/g,'');
        result = result.replace(/<desc>Created with Sketch.<\/desc>/g,'');

    //supression des atrribut fill=""
        result = result.replace(/fill="[a-zA-Z0 -9:;\.\s\(\)\-\,]*"/gi,'');

    //supression des style (a faire avant la supression de <defs>
        // result = result.replace(/<style>(.*)<\/style>/g,'');
        //result = result.replace(/<defs>(.*)<\/defs>/g,'');

    //supression de la defs vide qui comporter le style css
        // result = result.replace(/<defs><\/defs>/g,'');


    //supression des class css
     // result = result.replace(/class="[a-zA-Z0-9:;\.\s\(\)\-\,]*"/gi,'');


    //supression du rect qui a la même dimension que le viewport
        // var myRegEx = new RegExp('<rect' + '(.*)' + 'width="' + dimension + '"' + '(.*)' + 'height="' + dimension + '"' + '' +  '\/>', 'g');
        // result = result.replace(myRegEx,'');

    // var myRegEx = new RegExp('<rect' + '(.*)' + 'width="' + dimension + '"' + '(.*)' + 'height="' + dimension + '"' + '' +  '\></rect>', 'g');
        // result = result.replace(myRegEx,'');
    return result;
}
const makeSymbol = (svgFile, svgPath) => {
    svgFile = svgFile.replace('<svg','<symbol id="'+ path.basename(svgPath, '.svg') + '"');
    svgFile = svgFile.replace('</svg>','</symbol>');
    svgFile = svgFile.replace('xmlns="http://www.w3.org/2000/svg"','');
    return svgFile;
}

const concatSymbol = svgFile => `<svg class="kl-hidden" xmlns="http://www.w3.org/2000/svg">${svgFile}</svg>`;

module.exports.cleanAll = cleanAll;
module.exports.cleansvg = cleansvg;

