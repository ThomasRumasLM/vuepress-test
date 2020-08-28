export const activeModules = [];
export const kobiEvents = {
  'cartUpdate': {
    'async': true,
    'description': 'Event pour l\'ajout panier, data attendue :  listProducts représentant un array d\'objet, chaque objet représentant un produit',
    'data': [ 'listProducts' ]
  },
  'context': {
    'async': false,
    'description': 'Changement du magasin de contextualization',
    'data': [ 'idMag' ]
  },
  'componentTcVarsReady': {
    'async': false,
    'description': 'Fired lorsque les données CommandersAct du composant sont prêtes pour envoi',
    'data': [ 'tcvars' ]
  },
  'componentJsonldReady': {
    'async': true,
    'description': 'Fired lorsque les données Jsonld du composant sont prêtes pour envoi',
    'data': [ 'jsonld' ]
  },
  'userInfoAvailable': {
    'async': true,
    'description': 'Fired lorsque les données clients de l\'internaute sont disponible (retour API ou cache)',
    'data': [ 'userInfo' ]
  },
  'selectedFilters': {
    'async': true,
    'description': 'Fired lorsque l\'utilisateur sélectionne un filtres dans les pages famille produits',
    'data': [ 'filters' ]
  },
  'personalData': {
    'async': true,
    'description': 'Fired lorsque l\'utilisateur clic sur la lien form de contact dans la page CGU',
    'data': [ 'button' ]
  },
  'productSoldOnWeb': {
    'async': true,
    'description': 'Fired if product is sold online and can be added to cart. Send ONLY if it\'s available online.',
    'data': [ 'product' ]
  },
  'refreshTcVars': {
    'async': true,
    'description': 'To fire only when [data-tcvars] values have changed in ajax (such as filter, pagination, ...) in order to rebuild and send the new tcVars'
  }
};

export class Composant {
  constructor(id, noHTML = false) {
    // On teste si l'attirbut noHTML est passé en paramètre à true, si c'estle cas, c'est un composant non visuel (Commandersact...)
    if(!noHTML) {
      // On récupère toutes les sections qui ont cet ID
      const modulesKobi = document.querySelectorAll(`[id^=component-${id}], header[id^=${id}], footer[id^=${id}]`);

      // On Boucle dans chaque élément trouvé
      // --> Il est possible d'avoir plusieurs composants identiques ( produits-complementaire-1, produits-complementaire-2, ... )
      for (let i = 0; i < modulesKobi.length; i++) {

        // On vérifie si cet élément en particulier a déjà été instancié
        let alreadyExist = false;
        for (let j = activeModules.length - 1; j >= 0; j--) {
          if( activeModules[j].id === modulesKobi[i].id ) {
            alreadyExist = true;
          }
        }

        // Si cette section n'est pas encore init, on le fait
        if( !alreadyExist ) {
          this.target = modulesKobi[i];
          this.id = modulesKobi[i].id;
          break;
        }
      }

      // Si on a pas trouvé de composant HTML correspondant
      if ( !this.target ) {
        console.warn(`Le module <${id}> n'existe pas dans la page ou a déjà été instancié.`);
      }

      // On documente la liste des modules instanciés
      // activeModules.push(this);
      activeModules.push({ 'id': this.id, 'target': this.target });

      if (performance.mark !== undefined) {
        performance.mark(`Component ${id} ready`);
      }
      // eslint-disable-next-line
      console.log(`Le module <${id}> a été instancié.`);
    }

    // On ajoute à l'instance les fonctions d'events
    for( const event in kobiEvents ) {
      addLMEvent.call(this, event);
    }

    // Les éléments spécifiques à un site peuvent être injecté dans le constructeur via cette méthode
    // `Composant.prototype.customExtend = function(){...}`
    if( this.customExtend ) {
      this.customExtend.call(this);
    }




  }
}

const addLMEvent = function(eventName) {

  const {async} = kobiEvents[eventName];
  const dataValidation = kobiEvents[eventName].data;

  this[eventName] = (data) => {

    // Validation des paramètres obligatoire
    for (let i = 0; i < dataValidation.length; i++) {
      if ( typeof data[dataValidation[i]] === 'undefined' ) {
        console.error(`Le param <${dataValidation[i]}> est manquant`);
        return;
      }
    }

    // Création de l'événement
    data.emitterId = this.id;
    const event = new CustomEvent(
      eventName,
      { detail: data }
    );

    // Gestion sync/async
    if(async) {
      setTimeout( () => {
        document.dispatchEvent(event);
      }, 1);
    } else {
      document.dispatchEvent(event);
    }
  };

  // la fonction est une CONST
  Object.defineProperty(this, eventName, {writable:false});
};
