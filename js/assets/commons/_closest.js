/**
 * Remonte dans le DOM à la recherche d'un parent qui correspont au sélécteur passé en paramètre.
 * @param  {Object<Element>} elem     Elément à partir duquel chercher
 * @param  {String} selector     Sélecteur du parent à chercher
 * @return {Object<Element>}           Retourne le premier parent correspondant, ou false
 */
export const getClosest = (elem, selector) => {
  // Get closest match
  for ( ; elem && elem !== document; elem = elem.parentNode ) {

    if( elem.matches(selector) ) {
      return elem;
    }
  }
  return false;
};