# Build pour les ressources statiques du site leroymerlin.fr

Ce projet contient toutes les tâches permettant de builder les assets front d'un module Kobi. 
Il est appelé en tant que dépendance aux sites et modules Kobi grâce au `package.json`. Il n'est donc pas nécessaire de cloner directement ce repository pour profiter de ses commandes.

Dernière version : __v1.0.5__ 


## Pré-requis

```
$ npm -v
6.13.0

$ node -v
v10.15.3
```

## Arborescence


Commande disponible :

* __npm run upgrade-socle__ 						= Mets à jour les socles à la nouvelle version en tirant une nouvelle branche  
* __npm run watch-build__ 						= Lance le watcher pour synchro avec openshift  
* __npm run build__ 								= lance un build en local  
* __npm run new-component "nomDuComposant"__ 	= Lance le générateur de composant  
* __npm run delete-component "nomDuComposant"__ 	= Supprime les fichiers d'un composant  


## Versions du build

Pour utiliser une version particulière du build, vous pouvez changer le tag utilisé dans le `package.json` **de votre projet** et refaire un `npm install`.

```
  "devDependencies": {
    "int-build": "git+http://gitlab-xnet.fr.corp.leroymerlin.com/fr-lm-internet-refonte/int-build.git#v1.0.4"
  }
```

## Notions du build

Ce que l'on appelle le "build", c'est la mécanique qui permet de mettre à disposition les assets dont nous avons besoin : l'icofont, les CSS, les JS.

En plus, le build permet de lancer le générateur de composant.

Nous allons rapidement voir ce que fait chacune des tâches : 

### 1. watch-build

Cette tâche écoute les évènements d'ajout et d'édition des fichiers de type \*.src.scss, \*.src.js et \*.txt. En fonction du type de fichier, il exécute la tâche correspondante : _sassTask_ (scss), _browserifyTask_ (js), _descriptorTask_ (txt).  

Une fois les assets compilées, elles sont envoyées dans le dossier 'target' via rsync grâce à la tâche _rsyncTask_.
Puis, ce dossier est envoyé dans le pod Openshift via la tâche `oc-task`.

Le paramètre optionnel --ugly permet de compiler les javascript avec uglify pour reproduire en live le traitement de Jenkins

### 2. build

Le build compile tous les assets et les place dans le dossier 'target'.

### 3. new-component

Cette tâche permet d'ajouter un component dans le module courant. 

### 4. delete-component

Cette tâche permet de supprimer un component dans le module courant. 

### 5. autotag

Cette tâche permet de tagguer le socle en cours.
Le paramètre optionnel -m "<message>" permet d'ajouter un descriptif court de la raison du tag'
Le paramètre optionnel --hotfix permet de définir directement que le tag est un hotfix `v3.2.X`
Le paramètre optionnel --minor permet de définir directement que le tag est une version mineure `v3.X.0`
Le paramètre optionnel --major permet de définir directement que le tag est une version majeure `vX.0.0`
