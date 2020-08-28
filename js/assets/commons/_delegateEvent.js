import {getEventTarget} from '../modules/_getEventTarget.js';

/**
 * Permet de faire de la délégation d'événement en vanilla tout en gardant le event.target sur l'élément ciblé par le sélecteur
 * @param  {String} eventName     Le nom de l'événement écouté Ex: 'click'
 * @param  {String} selector Le sélécteur que doit matcher l'élément ciblé pour lever l'événement  
 */
Element.prototype.delegateEvent = function(eventName, selector, fn){
  this.addEventListener(eventName, e => {
    const eventDOMElement = getEventTarget(e.target, selector);
    if( !eventDOMElement ) { return; }

    Object.defineProperty(e, 'target', {value:eventDOMElement});
    fn(e);
  });
};