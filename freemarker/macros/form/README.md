# Macros de formulaire

<br/>

> Retrouvez ici les principes de base pour l'utilisation des macros dans la mise en place de formulaire

## Structure de fichiers

Les fichiers de macro sont organisés de la façon suivante : 

```bash
└── macros
    └── form
        └── tooling
            └── config.ftl
            └── controls.ftl
            └── functions.ftl
        └── base.ftl
        └── fields.ftl
```
## Macros mise à disposition

Le fichier `/fields.ftl` met à disposition les macros suivantes : 
* input
* input avec bouton à droite
* liste de checkbox
* liste de boutons radio
* textarea
* select
* upload
* captcha

> Notez que <strong>ces macros génèrent des blocs HTML complets</strong> la plupart du temps avec les élements suivants : <br/>
* Label
* Suggestion
* Champ de formulaire

## Configuration et mise en place

Chaque macro a besoin d'un objet de config qui vous permettra de définir les diverses propriétés de votre bloc.

### Objet de configuration commun pour toutes les macros :

```json
    <#assign myConfig = {
		"name":"",  // required
		"label": "", // required
		"required" : true, 
		"suggest" : "", 
		"placeholder" : "",
        "disabled" : true,
        "cerberus" : "",
        "formInline" : false, // set true if you want a 2 columns' form (this automatically add col-container-inner in the wrapper)
        "formInlineBreakpoint" : {m, l, xl xxl}, // use to remove the margin for the field over the breakpoint
		"CSSClass" : {
			"wrapper" : "",
			"label" : "",
			"input" : "",
            "leftColumn" : "", //use if formInline = true
            "rightColumn" : "", //use if formInline = true
            "errorMessage" : "" //use if formInline = true
		},
		"validation" : {
			"pattern" : "",
			"mismatch" : "",
			"missing" : "",
			"min" : "yyyy-mm-dd",
			"max" : "yyyy-mm-dd",
            "maxlength" : number,
            "minlength" : number
		}
	} >
```

> <strong>Chaque macro dispose d'options supplémentaires spécifiques</strong> présentes ci-dessous

##### Input : options disponibles

```json
    "type" : "", // required
    "inputmode" : "", // Changer le clavier par défaut en mobile
    "icons": {
        "left" : "",
        "right" : ""
    },
    "datalist" : "" // Not required, need to have a datalist on your HTML with this value on its id. 
    "validation" : {
        "criterions" : {
            "8 caractères minimum" : "pattern",
            "Une majuscule" : "pattern"
        }
    }
```

##### Input avec bouton : options disponibles

```json
    "type" : "", // required
    "icons": {
        "left" : "",
        "right" : ""
    },
    "CSSClass" : {
        "button" : ""
    },
    "button" : {
        "url" : "",
        "wording" : ""
    },
    "validation" : {
        "criterions" : {
            "8 caractères minimum" : "pattern",
            "Une majuscule" : "pattern"
        }
    }
```

##### Input avec counter : options disponibles
```json
    "cerberusBtnMinus" : "",
    "cerberusBtnPlus" : "",
    "counter" : {
        "step" : 1
    },
    "validation" : {
        "pattern" : "[0-9]+([\\.,][0-9]{1,2})?",
        "mismatch" : "Veuillez renseigner un nombre valide compris entre 0 et 10",
        "missing" : "Veuillez renseigner un nombre valide compris entre 0 et 10",
        "min" : "0",
        "max" : "10"
    }
```

##### Input text avec counter : options disponibles
```json
    "cerberusBtnMinus" : "",
    "cerberusBtnPlus" : "",
    "counter" : {
        "step" : 1
    },
    "validation" : {
        "pattern" : "[0-9]+([\\.,][0-9]{1,2})?",
        "mismatch" : "Veuillez renseigner un nombre valide compris entre 0 et 10",
        "missing" : "Veuillez renseigner un nombre valide compris entre 0 et 10",
        "datamin" : "0",
        "datamax" : "10"
    }
```

##### Liste de checkbox : options disponibles

```json
    "values" : [{
        "label" : "inputLabel",
        "value" : "inputValue",
        "checked" : boolean, //non obligatoire
        "CSSClass": string, // non obligatoire
        "suffix" : { // non obligatoire
            "label" : string, // si suffix est definis il faut au moin le label
            "cssClass" : string, non obligatoire
            "data" : { // non obligatoire mais si il est definis il faut au moin un attribut
                "attribute" : "value"
            }
        }
    }]
```

##### Liste de boutons radio : options disponibles

```json
    "values" : [{
        "label" : "inputLabel",
        "value" : "inputValue",
        "checked" : boolean, //non obligatoire
        "variants": { // non obligatoire, option pour rendre le radio classic en button custom
            "type": string, // pour activer le button custom, indiquez "buttons"
            "size": string, // optionnel, permet d'activer le button custom en taille small, indiquez "small"
            "width": string // class de colonne de grille
        },
        "CSSClass": string, // non obligatoire
        "suffix" : { // non obligatoire
            "label" : string, // si suffix est definis il faut au moin le label
            "cssClass" : string, non obligatoire
            "data" : { // non obligatoire mais si il est definis il faut au moin un attribut
                "attribute" : "value"
            }
        }
    }]
```

##### Checkbox list : options disponibles pour afficher un visuel
```json
    "config" : [{
        "values" : [
            {
                "value" : string,
                "label" : string, //non obligatoire
                "checked" : boolean, //non obligatoire
                "image": string //non obligatoire, permet d'ajouter une image dans la radiolist de type buttons
            },
    }]
```


##### Select : options disponibles

```json
    "values" : {
        "inputValue" : "inputLabel",
        "inputValue" : "inputLabel"
    },
    "selectedKey" : string //non obligatoire
```

##### Textarea : options disponibles

```json
    "validation" : {
        "minlength" : number,
        "maxlength" : number
    }
```

##### Upload : options disponibles

```json
    "multiple" : boolean ,
    "validation" : {
        "accept" : "", // image/png, image/jpg, image/jpeg, etc ...
        "size" : "", // en k-octets uniquement
    }
```


##### Captcha : options disponibles

```json
    "siteKey":"${siteKey}" // Un clé est déjà présente, mais cette valeur peut-être écrasée par siteKey
```

### Mise en place

Pour instancier une macro, il suffit d'instancier la macro souhaitée et lui faire passer l'objet de config en paramètre.

```json
    <#import "../../macros/common/form/fields.ftl" as field>

    <#assign config = {
        "name":"firstName", 
        "label": "Votre prénom",
        "required": true,
        "placeholder" : "Michel",
        "type" : "text"
    } >
    <@field.input config />
```
> Vous pouvez également importer un fichier `.ftl` qui contient tous vos objets de config (notamment quand vous avez plusieurs fois la même config à appliquer dans plusieurs composants de votre appli)

<!-- Exemple avec la macro input : 

```json
    <#assign inputText1 = {
        "name":"firstName", // required
        "label": "Votre prénom", // required
        "type" : "text", // required
        "required": true,
        "placeholder" : "Michel"
    } >
    <@field.input inputText1 />
``` -->

<!-- ### Que génère les macros

Les macros disponibles dans `fields.ftl` génère : 

```html
    <div class="km-field">
        <label class="km-field__label " for="test1--997">
                Votre email
                <span class="km-field__mention">- Obligatoire</span>
        </label>
        <span class="km-field__suggest">Voici une suggestion</span>
        <input type="email" id="test1--997" name="test1" required="" class="ka-input km-field__input" placeholder="michel.dupont@mail.com" aria-label="" data-missing="" data-mismatch="" pattern="">
    </div>
``` -->

## Et le style dans tout ça ?

Les fichiers de style sont rangés en respectant le découpage Atomic Design System actuel.

Disponible [ici](http://gitlab-xnet.fr.corp.leroymerlin.com/fr-lm-internet-refonte/lmfr-int-socle-scss)

Pour un formulaire très complet avec beaucoup de champs, nous avons mis à disposition un fichier **bundle**. [ici](http://gitlab-xnet.fr.corp.leroymerlin.com/fr-lm-internet-refonte/lmfr-int-socle-scss/blob/master/assets/sass/_common/_bundles/_form.bundle.scss)

## Le contrôle de surface en Javascript

_TODO_

## Pour aller plus loin

Il se peut que vous n'ayez pas besoin d'utiliser la molécule complète d'un champ de formulaire. Par exemple, vous avez besoin d'utiliser uniquement un champ sans label.

### Bonne nouvelle, nous avons la solution !!

Sans changer la manière d'écrire vos objets de config, vous pouvez utiliser toutes les macros disponibles dans le fichier `/base.ftl`.

Grâce à l'import des macros `field`, vous avez accès au macro de base qui permettent de construire les molécules.


```json 
    <@field.base.input config />
```

Vous avez ainsi accès aux macros suivantes : 
* label
* suggest
* input
* checkbox
* radio
* select
* textarea
* upload
* criterions

### Macro @base.checkbox / @base.radio

Afin de pouvoir utiliser les macros `@base.checkbox` et `@base.radio`, un param supplémentaire est nécessaire à sa bonne intégration dans un formulaire.

```json
    <#assign thisCounter = 1 >
    <@field.base.radio thisCounter config />

    
    <#assign thisCounter = 1 >
    <@field.base.checkbox thisCounter config />
```

Globalement, la variable `thisCounter` vous permet simplement de dire que la valeur à récuperer dans votre objet `config` est la première mais elle permet aussi d'incrémenter de la bonne manière les ID des champs etc ...

> <strong>ATTENTION</strong>, il est déconseillé d'utiliser ces macros pour reconstruire des molécules complètes car cela présentes les risques d'un écart avec la charte graphique

## Switch / Toggle

## How to use

1) Call the macro fields:

```html
<#import "PATH/macros/common/form/fields.ftl" as f>
```

2) Assign options :

```html
<#assign optionToggle = {
    "name": "",
    "type": "checkbox", 
    "value" : "",
    "label" : "",
    "ariaLabel" : "",
    "data" : {
        "input" : {
            "category" : "example",
            "anything" : "you want"
        }
    },
    "CSSClass" : {
        "label" : "",
        "input" : ""
    }
}>
```

The `type` can only be `checkbox` for the moment.

Use `reversed:true` to reversed the label and toggle

3) Use the macro to display the toggle

```html
<@f.switch optionToggle />
```

4) Import the scss

```SCSS
@import 'node_modules/integration-web-core--socle/css/assets/sass/_common/06-molecules/_switch.molecules';
```

## Visual checkbox

## How to use

1) Call the macro fields:

```html
<#import "PATH/macros/common/form/fields.ftl" as f>
```

2) Assign options :

```html
<#assign optionFilterImg = {
    "name": "${filterCode}", //optionnal
    "type": "checkbox", //optionnal
    "value" : "${filter.value}", //mandatory
    "checked": filter.applied, //optionnal
    "label" : "${filter.value} <span>(${total})</span>", //optionnal
    "ariaLabel" : "${filter.value?xhtml}", //optionnal
    "data" : { //optionnal
        "input" : {
            "category" : "${filterLabel?xhtml}", //optionnal
            "type" : "${filter.type}" //optionnal
        }
    },
    "CSSClass" : { //optionnal
        "label" : "l-visual-filter__label" //optionnal
    },
    "reversed" : true, //optionnal
    "img" : "${mediaUrl}" //mandatory
}>
```

The `type` is `checkbox`

The `img` is the url of the media.

Use `reversed:true` to reversed the label and the image

3) Use the macro to display the visual checkbox

```html
<@f.checkboxImage optionFilterImg />
```

4) Import the scss

```SCSS
@import 'node_modules/integration-web-core--socle/css/assets/sass/_common/06-molecules/_visual-filter.molecules';
```
