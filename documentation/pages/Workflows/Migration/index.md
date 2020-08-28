---
title: 'Migration'
order: 4
---

# Migration

> _Cette page est exceptionnellement rédigée en français, dans l'optique d'éviter tous problèmes de compréhension durant la migration_

_**/!\ Opération à répéter pour chaque module**_

# Migration
* Tirer une branche de **master** et la **nommer** `feat_migration-foundation-mozaic`
> `git checkout -b feat_migration-foundation-mozaic`
* Modifier le `package.json` :
    * **Ajouter** la ligne `"migrate": "migrate"` dans les scripts
    * **Supprimer** les 4 dépendances `build`, `freemarker`, `scss`, et `js`
    * Les **remplacer** par la dépendance au monorepo : `"integration-web-core--socle": "git+ssh://github.com:adeo/integration-web-core--socle.git#v1.0.0"`
    * Mettre à jour l'URL dans `repository` avec l'URL **Github** du repository

<br>_Exemple de `package.json` :_

```json
...

"scripts": {
    "watch-build": "watch-build",
    "build": "build",
    "new-component": "new-component",
    "delete-component": "delete-component",
    "path-migration": "path-migration",
    "upgrade-socle": "upgrade-socle",
    "migrate": "migrate"
},

...

"devDependencies": {
    "eslint": "^5.16.0",
    "integration-web-core--socle": "git+ssh://github.com:adeo/integration-web-core--socle.git#v1.0.0"
},
"repository": {
    "type": "git",
    "url": "git@github.com:adeo/integration-web-NOMDELEQUIPE--NOMDUMODULE.git"
},

...
```
* **Supprimer** le fichier `package-lock.json`
> `rm package-lock.json`
* **Supprimer** le dossier `node_modules`
> `rm -rf node_modules`
* **Supprimer** le dossier `icon-kit`
> `rm -rf src/main/resources/static/icon-kit`
* Vérifier que la version de **Node** est au minimum en `10` (`nvm use 10` (minimum) ou `nvm install 10` (minimum))
> Ajouter l'alias nvm pour démarrer sur cette version par défaut `nvm alias default 10` 
* Installer les dépendances
> `npm install`
* Lancer le **script de migration**
> `npm run migrate`
* Faire un `git diff` pour voir et vérifier les modifications
* Builder l'application
> `npm run build`

# Recette
Une fois que tout est bon sur l'environnement de **dev** :
* **Vérifier** sur l'environnement de **dev** que tout s'est bien passé

### Dans Turbine :
* Editez la **Source repository** dans la configuration du module
    * Bouton `Edit`
    * En bas de page dans `Useful links`, mettre à jour `Source repository` avec l'URL **Github** du repository
    * **Save**
* Ajouter le module sur la [**QA Core** dans **Turbine**](https://turbine.prod.leroymerlin.fr/environments/frlm-team-inte-core-qa/view/DEPLOYMENTS)
    * Bouton `Edit`
    * Ajouter le **Component** et valider avec `Apply Environment Provisioning`
    * Déployer la **branch** contenant la migration sur la **QA Core**
* Recetter le périmètre sur la **QA Core**
> https://leroymerlin-42ngt2-qa.apps.op.acp.adeo.com/

# Déploiement en PREP

* Merger la branche `feat_migration-foundation-mozaic` sur **Master** et `push`
* Une fois le **build de Master** terminé dans la **CI Gitlab**, lancer une **release minor**
> `maven-trigger-release-minor`
* Après la **fin du build** de la release, déployer en **PREP** dans [**Turbine**](https://turbine.prod.leroymerlin.fr/environments/frlm-web-website-prep/view/DEPLOYMENTS)
* Recetter sur la [**PREP**](https://prep-www.corp.leroymerlin.fr/)

:::: tabs

::: tab Issue
<'Workflows/Migration/issue.md'>
:::

::::