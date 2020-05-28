---
title: 'Issue'
order: 2
---

> _Cette page est exceptionnellement rédigée en français, dans l'optique d'éviter tous problèmes de compréhension durant la migration_

Après avoir executé le script de migration, si des alertes sont remontées dans la console, consulter les fichiers pour identifier ce qui aurait dû être modifié.

Au moment de la recette, 3 types de bugs ou regressions peuvent a priori arriver :
* Un bug/régression relatif à un élément de **LM Core**
* Un bug lié à **Mozaic**
* Un bug/régression lié au périmètre spécifique du **module**

### Périmètre LM Core

* **Ouvrir** une [issue sur le repository du monorepo](https://github.com/adeo/integration-web-core--socle/issues), en utilisant le template ``Bug report`` pour **décrire** le problème, le périmètre, comment le reproduire, et si vous savez comment le résoudre.
> `New issue` puis utiliser le template `Bug report`
* **Ajouter le label** `Bug` sur l'issue
* **Assigner** l'issue au **runner de l'équipe Core**

### Périmètre Mozaic

* **Consulter** un membre de l'équipe Core pour s'assurer que le bug vient bien de **Mozaic**
* **Ouvrir** une [issue sur le repository du Mozaic](https://github.com/adeo/mozaic-design-system/issues/new/choose) en choisissant le bon template
* **Décrire** le problème, le périmètre, comment le reproduire

### Périmètre du module

* Résoudre le problème dans le **module**, selon le **workflow habituel** de gestion des bugs
