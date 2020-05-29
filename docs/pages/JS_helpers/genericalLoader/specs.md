---
title: 'Specs'
order: 2
---


## How  

**Constructor**  
```javascript
	/**
     *
     * @param {String} prmLoader your loader, default will be loader URL of lmfr-site
     * @param {String} prmType can be img url or svg, default img
     */
    constructor(prmLoader = _loaderPath, prmType = _loaderType) {
        this.loader = prmLoader;
        this.type = prmType;
    }
```
### Parameters detail
**prmLoader (String)**  
_(optional)_  
The loader you want to use
Default "The lmfr-site loader available on lmfr-site ressources"

**prmType (String)**  
_(optional)_  
The loader's type you want, by default it will be an img, but you can use SVG too, for this provide SVG generated content directly to prmLoader parameter.

--- 
**append**
```javascript
	/**
     *
     * @param {Node} prmNode the Node where you want to append your loader
     */
    append(prmNode) {
        let htmlGeneration = '';
        switch (this.type) {
        case 'img':
            htmlGeneration = `<img alt="Chargement" class="js-generical-loader" src="${this.loader}"/>`;
            break;
        case 'svg':
            htmlGeneration = `<div class="js-generical-loader">${this.loader}</div>`;
            break;
        default:
            htmlGeneration = `<img alt="Chargement" class="js-generical-loader" src="${this.loader}"/>`;
            break;
        }
        prmNode.insertAdjacentHTML('beforeend', htmlGeneration);
    }
```
### Parameters detail
**prmNode (Node)**  
The DOM Node where you want to append the loader

--- 
**remove**
```javascript
	/**
     *
     * @param {Node} prmNode the Node where you want to remove your loader
     */
    remove(prmNode) {
        prmNode.removeChild(prmNode.querySelector('.js-generical-loader'));
    }
```
### Parameters detail
**prmNode (Node)**  
The DOM Node where you want to remove your loader
