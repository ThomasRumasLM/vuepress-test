---
title: 'Kobi'
order: 10
---

You will find here, all the information needed on front-side to work with Kobi. 

### Working with modern browsers 

Since version 2.0.0, we are able to compile a modern version for Javascript deliver on client-side. To make it working with your Java's module, you need to declare a new descriptor for yours JS static resources. 

#### Step 1 

Modify the historical descriptor to add this information :  

```
# which device impacted by this file (desktop | mobile | all)
components: fr.leroymerlin.truckrental.TruckRental
devices: mobile, iphone, android

# a script file can be executed with async and defer mode
async: false
defer: true

#modern browsers
browsers: legacy
```

Now your JS will working for only older browsers. 

#### Step 2 

Create a new descriptor with this syntax `*.modern.js.txt`and insert to it : 

```
# which device impacted by this file (desktop | mobile | all)
components: fr.leroymerlin.truckrental.TruckRental
devices: mobile, iphone, android

# a script file can be executed with async and defer mode
async: false
defer: true

#modern browsers
browsers: modern
```

Now on modern browsers, an ES6 version from your code will be delivered. 

### Working with translation 

Since 2.0.0 version, we are able to compile and deliver translate module with i18next library. 

#### Step 1

At first you need to create a JSON file with all the translation key needed for each language. On project, on `javascript` folder, add a `locales` folder with a `build.json` file.

```json
{
    "fr": {
        "translation": {
           "hourPicker" : {
               "choose" : "Choisissez une heure"
           },
           "datePicker" : {
                "chooseBack" : "Choisissez une date de retour"
           },
           "errorMessage" : {
               "store" : {
                   "available" : "Désolé, votre magasin n'est pas disponible à cette date pour l'obtention d'un véhicule",
                   "restitution" : "Désolé, votre magasin n'est pas disponible à cette date pour la restitution d'un véhicule"
               },
               "problem" : "Nous avons rencontré un problème lors de votre demande",
               "tryLater" : "Veuillez réessayer plus tard"
           },
           "noResult" : {
                "noAvailableDate" : "Aucun véhicule n'est disponible dans le magasin avec les dates sélectionnées.",
                "twoPossibilities" : "Nous vous proposons 2 possibilités ci-dessous.",
                "onePossibility" : "Nous vous proposons 1 possibilité ci-dessous."

           },
           "findVehicules" : {
                "store" : "Nous avons trouvé des véhicules disponibles à",
                "date" : "Nous avons trouvé des véhicules disponibles le"
           },
           "removeAt" : {
                "material" : "à retirer à la cour des matériaux",
                "store" : "à retirer en magasin"
           },
           "fuel" : {
                "included" : "Carburant inclus",
                "notIncluded" : "Carburant non inclus"
           },
           "kilometer" : {
                "illimited" : "Kilométrage illimité",
                "included" : "km inclus",
                "traveled" : "km parcouru",
                "beyond" : "au-delà"
           },
           "selectStore" : "Sélectionner ce magasin",
           "selectDate" : "Sélectionner cette date",
           "book" : "Réserver",
           "back" : "Retour",
           "start" : "Début :",
           "end" : "Fin :"
        }
    }
}
```

#### Step 2 

Now we have created our translation file with needed keys, we will see how to use it on your source code : 

```js
/* Simple translation */ 
i18next.t('hourPicker.choose')

/* Inside an other string */ 
`my string is really ${${i18next.t('back')}}`
```

#### Step 3 

Update your descriptor declaration and/or create one for each language, `*.js.txt` become for example `*.fr.js.txt`: 

```
# which device impacted by this file (desktop | mobile | all)
components: fr.leroymerlin.truckrental.TruckRental
devices: mobile, iphone, android

# a script file can be executed with async and defer mode
async: false
defer: true

#lang 
lang: fr-FR
```

And that's all, you don't need to create a source file for each language, we're doing it directly when you're building your application. 