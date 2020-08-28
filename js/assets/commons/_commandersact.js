/**
 * Fonction d'envoi d'évènement à CommandersAct
 * @param {Object<Element>} target  élément qui a initié l'évènement (par exemple un bouton)
 * @param {String} eventType        type de l'évènement : permet le mapping côté CommandersAct
 * @param {String} stringJson       JSON sous forme de string contenant l'ensemble des clés valeurs
 */
export const hitEventCommandersAct = (target, eventType, stringJson = '{}') => {
  const arrayEvents =  JSON.parse(stringJson);

  if (typeof tc_events_global === 'function') {
    // eslint-disable-next-line
    window.addEventListener('beforeunload', () => {
      setTimeout(() => {return true;}, 100);
    }, false);

    //eslint-disable-next-line
    return tc_events_global(target, eventType, arrayEvents);
  }
};

/**
 * Fonction d'envoi des données tc_vars du composant au composant global lmfr-commandersact-module
 * @param {Object<Element} this     Objet composant
 */
export const appendToTcVarsGlobal = (component) => {
  if( component.target.dataset.tcvars ) {
    component.componentTcVarsReady({
      tcvars: JSON.parse(component.target.dataset.tcvars.replace(new RegExp('\'', 'g'), '"'))
    });
  }
};

/**
 * Fonction d'ajout au data-tcvars d'un composant avant aggrégation en javascript (utile notamment pour les actions asynchrones qui permettraient de renseigner le data-tcvars)
 *
 * La fonction est utilisable sur le composant directement, ex: this.appendToTcVarsComponent(myObject)
 * Il faut donc importer cette fonction dans votre composant : `import {appendToTcVarsComponent} from path;`
 * Et déclarer `this.appendToTcVarsComponent = appendToTcVarsComponent;` dans le constructeur de votre composant.
 *
 * @param {Object} objectToAppend     Objet contenant l'ensemble des clés / valeurs à ajouter au data-tcvars
 */
export const appendToTcVarsComponent = function(objectToAppend) {

  if(typeof objectToAppend !== 'object') {
    return;
  }

  let updatedTcVars = [];
  if(this.target.dataset.tcvars) {
    updatedTcVars = JSON.parse((this.target.dataset.tcvars).replace(new RegExp('\'', 'g'), '"'));
  }
  updatedTcVars.push(objectToAppend);
  this.target.dataset.tcvars = JSON.stringify(updatedTcVars);
};
