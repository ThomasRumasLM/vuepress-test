# Microservices et ES6 script côté client

Depuis la venue du moteur V8 de Google Chrome, l'utilisation de module ES6 est de plus en plus courante dans le navigateur côté client : `<script type="module">`. Ces derniers ont l'avantage de pouvoir centraliser des ressources communes (librairies) entre différents scripts d'une même page web. 

Notre étude sera portée sur le potentiel gain en webperformance que cette solution peut apportée. Pour cela, nous allons définir le cas de test ainsi que la solution actuellement utilisée. 

## La solution actuelle 

Actuellement, le build de production des modules afin de délivrer une source Javascript se compose ainsi : 

* Webpack et son outil de tree shaking
* Transpilation avec l'aide de Babel sur les deux dernières versions de chaque navigateur 
* Minification par Terser

L'utilisation de cette configuration nous permet déjà d'obtenir des sources javascript dans le navigateur plus que satisfaisante en terme de poids, d'exécution... 

Nous voulions cependant tester si l'utilisation des modules natifs ES6 au sein du navigateur nous permettrait d'obtenir de meilleurs résultats. 

## Le cas de test 

Afin de comparer les solutions, voici le scénario de test que nous avons choisi d'effectuer : 

* Machine utilisée : Mac Pro 3.1 avec 2x 2.8Ghz Intel Quad Core, 20Go de RAM DDR2 à 800MHz, Mac OS X Mojave 10.15.1. 
* Serveur web : Apache 2.4.41 avec aucune optimisation 
* Navigateur : Google Chrome Version 83.0.4103.61 
* Une ressource JS commune, la pagination[https://github.com/adeo/integration-web-core--socle/blob/master/js/assets/modules/_pagination.class.js]
* Une page HTML5 contenant que le code nécessaire à l'instanciation de deux paginations 
* L'instanciation de deux paginations dans la page web. 

### Création et instanciation des deux modules de paginations avec Webpack : 

Pour ce faire nous avons simplement crée deux fichiers javascript contenant ce bout de code : 

```js
import {Pagination} from './pagination';

document.addEventListener('DOMContentLoaded', () => {
    new Pagination('js-pagination');
});
```

La configuration webpack utilisée, ce que nous avons actuellement : 

```js
const path = require('path');
const TerserPlugin = require('terser-webpack-plugin');

const config = {
    mode: 'production',
    entry: "./scripts/main.js",
    output: {
        path: path.resolve(__dirname),
        filename: "./main.js"
    },
    optimization: {
        usedExports: true,
        minimizer: [
            new TerserPlugin()
        ]
    },
    module: {
        rules: [{
            test: /\.js$/,
            exclude: /node_modules/,
            loader: "babel-loader",
            options: {
                presets: [
                    ["@babel/preset-env", {
                        "targets": {
                            "browsers": "last 2 Chrome versions or last 2 ChromeAndroid versions or last 2 Firefox versions or last 2 iOS versions or last 2 Edge versions"
                        }
                    }]
                ]
            }
        }]
    }
}

module.exports = config;
```

#### Résultats : 

En terme de performance, voici les statistiques qui sont ressortis en moyenne après 3 lancements : 

* Deux appels vers des ressources Javascript faisant toutes les deux un poids de 3.4Ko soit 6.8Ko au total
* Un temps de chargement de 16ms 
* Un temps de scripting de 114ms
* Un temps de rendering de 38ms 
* Un temps de painting de 1ms 
* Un temps d'exécution système de 51ms. 

Comme nous pouvons le constater, le temps d'instanciation et plus que correct et nous donne un total de 220ms pour l'instanciation de deux modules de pagination. 

Comparons maintenant avec l'utilisation de module ES6 côté client. 

### Création de module ES6 

Maintenant que nous avons eu les statistiques d'une utilisation de sources JS avec Webpack... voyons ce que l'on pourrait gagner. Pour ce faire nous partirons de deux mêmes fichiers sources qui vont instancier la pagination. 

```js
import {Pagination} from './pagination';

document.addEventListener('DOMContentLoaded', () => {
    new Pagination('js-pagination');
});
```

Au niveau de la configuration de build, nous partirons que sur de la minification par le bias de Terser. 

#### Résultats : 

En terme de performance, voici les statistiques qui sont ressortis en moyenne après 3 lancements : 

* Deux appels vers des ressources Javascript faisant toutes les deux un poids de 415 octets soit 830 octets au total
* Un appel vers la librairie Javascript faisant un poids de 2.7Ko
* Un temps de chargement de 15ms 
* Un temps de scripting de 81ms
* Un temps de rendering de 68ms 
* Un temps de painting de 2ms 
* Un temps d'exécution système de 66ms. 

Les résultats fournis nous ont un peu déçu, en effet par le fait de centraliser une ressource commune à 2 modules, nous espérions obtenir un gain significatif par rapport à la solution de build de sources javascript à l'aide de Webpack et babel. En effet ici nous obtenons une moyenne d'exécution de 232ms, soit 12ms de plus que l'autre solution. 

Peut-être que sur un test de X modules où X étant supérieur à 2 voire 3, nous aurions eu de meilleurs résultats, cependant, en production sur l'ensemble des pages webs utilisant des microservices, la moyenne de ressource commune étant exécuté dans X modules est inférieur à deux. 

De ce fait, nous avons décider de ne pas basculer sur l'usage de modules ES6 côté client pour l'ensemble de nous ressources statiques, outre le gain de performance que nous espérions, l'utilisation de ces derniers aurait amené de la compléxité dans la gestion et la centralisation de nos ressources javascript communes. 

* Obligation de centraliser les ressoures sur un point de montage commun à l'ensemble des microservices
* Perte de la liberté de versionning actuel avec l'utilisation des ressources javascripts comme étant des dépendances aux dévelopmement des modules qui leurs permet d'avoir leur propre ligne de vie. 
* Refactorisation du système de build pour conserver webpack uniquement pour une compatibilité dite "legacy" pour les anciens navigateurs n'intérprétant pas l'ES6. 


## Conclusion 

Dans le cadre de l'utilisation de microservices pour la constitution de nos pages webs, la bascule vers des modules ES6 chargé et transpilé par le navigateur côté client n'est pas une solution que nous devons envisager. 

En effet outre le non gain de performance, sa mise en place et sa centralisation implique un nouveau point de contention pour la bonne mise en production de l'ensemble des microservices concevant le site web, ce qui va à l'encontre du choix architectural. 

