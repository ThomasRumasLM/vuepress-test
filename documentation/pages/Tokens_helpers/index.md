---
title: 'Tokens helpers'
order: 4
---

# Tokens helpers

## Get started

First get the [repository](https://github.com/adeo/integration-web-core--socle) and clone it. 

### How to work with tokens 

To be more efficient and transparent if a useful information of a component need to be change, we can do it easily in appropriate token therefore change all the occurences in source code. So for now, we want you to use it, and this is how to do it : 

#### Create your token files 

In the token directory at root of repository, create a `myToken.json` file with all the data needed to generate your component. 

After that, you can run this npm command `npm run token` to generate each token file for each language : 

* SCSS
* Freemarker 
* Javascript 

##### Token in SCSS 

Directly in `css/assets/sass/_common/01-setting-tools/_all-settings.scss` import your token file like this : 

`@import '../../_tokens/accordion.scss';`

Now you're ready to work with your token inside any SCSS file from the socle. 


##### Token in Freemarker 

Inside your macro file, import the token file like this : 

`<#import "./tokens/buttons.ftl" as jsonButtons>`

Now you can access like a classical hash in freemarker to your data. 

##### Token in javascript

Top of your file, import the token file : 

`import config from '../tokens/tooltip.json';`

Now you can access like a classical JSON Object inside your source code. 