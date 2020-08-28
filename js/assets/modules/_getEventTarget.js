/**
 * Dans le cas ou le target d'un event correspond à un enfant de l'élément ciblé lors du addEventListener, on revient à l'élément ciblé initialement
 * @param  {Element} target   event.target généré par l'événément
 * @param  {String} selector  le sélecteur du noeuds ciblé lors du addEventListener
 * @return {Element}          l'élement du DOM ciblé lors du addEventListener
 */
export const getEventTarget = (target, selector) => {
  let eventDOMElement;
  // En cas de clic sur un enfant de l'élément, on revient à l'Element qui porte l'event
  if( !target.matches('selector') ) {
    eventDOMElement = lm.getClosest(target, selector);
  }
  return eventDOMElement;
};
