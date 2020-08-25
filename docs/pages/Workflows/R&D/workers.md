# Les webworkers

Les sites webs de nous jours utilisent de plus en plus le Javascript pour l'exécution de nombreuses fonctionnalités
côté client. Même si le javascript est asynchrone, l'ensemble du code est exécuté dans un seul et unique thread, ce qui peut
par exemple sur du traitement de données, du calcul... prendre du temps de scripting et donc empêcher le navigateur de rendre la page web en terme UI.

Par le passé, nous utilisions des `setIntervals`, des `setTimeout`, de l'évenementiel... pour simuler de la concurrence entre l'exécution de nos séquences de code...

Mais grâce à l'HTML5, nous avons maintenant une solution viable pour le faire. 

## Le threading en Javascript 

Avec l'apparition des web workers, nous avons maintenant une solution nous permettant de faire de la concurrence mais surtout exécuter du code sans bloqué le rendu de la page dans le navigateur. 

Il faut savoir qu'il existe deux types de worker, ceux dédiés et ceux partagés. Ici nous parlerons que des workers dédiés.

## Débuter 

Les web workers s'éxécutant dans des threads isolé, le code a besoin de se trouver dans un fichier source différent de votre script principal. 
Voyons maintenant comment déclarer un worker dans notre script principal : 

```javascript
const worker = new Worker('./scripts/worker.js');
worker.postMessage('Hello World');
```

La première ligne nous permet de demander au navigateur de récupérer notre worker qui sera exécuté en tâche de fond. 
La seconde insctruction de demander au worker de lancer son exécution en lui envoyant un `message`. 

## La communication avec un worker

La communication avec les workers se fait sous la forme évenementiel en échangeant des messages avec ces derniers. 

Le fichier principal : 
```javascript
worker.addEventListener('message', event => {
    console.log('Worker said: ', event.data);
  }, false);
```

Le worker : 
```javascript
self.addEventListener('message', (event) => {
    debugger;
    self.postMessage(event.data);
    self.close(); //Kill worker, he will doesn't work anymore even if we send it again a message
}, false);
```

Quand la méthode `postMessage` sera appelée dans notre script principal, notre worker va écouter l'évènement et commencer à lancer son exécution. 
Pour répondre à notre script principal, notre worker va lui aussi émettre un message par le biais de la méthode `postMessage`. 

Les messages transmis entre le script principale et les travailleurs sont copiés et non partagés. 
Par exemple, dans l'exemple suivant, la propriété 'msg' du message JSON est accessible aux deux emplacements. 
Il semble que l'objet soit transmis directement au worker, même s'il s'exécute dans un espace dédié distinct. 
En réalité, ce qui se passe, c'est que l'objet est sérialisé au moment où il est remis au worker, et par la suite, 
désérialisé à l'autre extrémité. 
le script et le worker ne partagent pas la même instance, donc le résultat final est qu'un doublon est créé à chaque passage. La plupart des navigateurs implémentent cette fonctionnalité en encodant / décodant automatiquement la valeur JSON à chaque extrémité.

## Transférer des objets. 

Certains navigateurs autorisent de pouvoir échanger des objets plus complexe : 
`File, Blob, ArrayBuffer, JSON objects`

Cependant, passant ce genre de message, une copie et tout de même faite, et donc si on passe un fichier d'un poids conséquent, le temps de la copie entre le worker et le script sera à prendre en compte. 

Pour utiliser des objets lors de l'envoi par le biais de la méthode `postMessage` : 
```javascript
worker.postMessage(arrayBuffer, [arrayBuffer]);
```

Le premier argument est le type de data et le second la liste d'objets qui sera transférée. Le premier argument ne doit pas forcément être un `arrayBuffer`, par exemple pour un JSON : 
```javascript
worker.postMessage({data: toto, moreData: titiBuffer}, [toto.buffer, titiBuffer]);
```

## Le scope 

Qui dit exécution dans un thread à part, dis scope, en effet un worker possède son propre scode d'exécution et de ce fait, il n'a pas accès à l'ensemble des ressources que votre script principal peut avoir. 

Vous trouverez ici l'ensemble des fonctionnalités et API accessible par le biais d'un worker[https://developer.mozilla.org/en-US/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers]. 

Un worker n'a pas accès à : 

* Le DOM
* L'objet `window`
* L'objet `document`
* L'objet `parent`

Le DOM n'étant pas accessible du aux principes de multi-threading, en effet une ressource partagé ne peut pas être modifié par deux instances de code au même moment, pour cela dans d'autres languages de programmation, nous faisons appel à un sémaphore, chose que nous ne pouvons faire ici en Javascript pour le DOM. 

## Charger des scripts externes 

Les workers peuvent être utilisés pour le chargement de scripts externe avec une URL absolue. Cependant votre navigateur peut indiquer une erreur de sécurité du à des problèmes de cross origin. Pour ce faire, vous pouvez passer votre location principal afin de construire l'URL absolue manuellement dans votre worker. 

## Les sous-workers 

De par sa conception multi-threading, il faut savoir que vous pouvez dans un worker, créer un nouveau worker à l'intérieur de ce dernier... Cependant faites attention à respecter ces conditions : 

* Les sous-workers doivent être hébergé sur la même origin que le script principal. 
* Les URI des sous-workers sont résolues de façon relative par rapport à la localisation du worker parent.

## Gestion des erreurs 

Nous avons vu ensemble que les workers fonctionnent par le biais de l'évenementiel. De ce fait pour savoir si un worker est en erreur nous pouvons dans notre script principal écouté un évenement d'erreur : 

```javascript
worker.addEventListener('error', error => {
    console.log(error);
})
```

## Cas d'usages 

Les workers de par leur conception sont à utiliser lorsque le multi-threading vous semble nécessaire, comme par exemple : 

* Prefetcher de la donnée à mettre en cache 
* Formatage de texte, manipulation de data
* Analyse de video ou d'audio 
* Ecriture en tâche de fond de donnée entrante ou sortante (indexedDB)
* Parcourir une réponse JSON conséquente 
