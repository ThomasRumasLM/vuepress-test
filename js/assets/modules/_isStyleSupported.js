/**
 * Cette fonction permet de savoir si un ensemble propriété / valeur css est compatbile avec le navigateur
 * @param  {String} prop      La propriété css, ex: "position"
 * @param  {String} value     La valeur de la propriété css, ex: "sticky"
 * @return {Boolean}          Retourne true si le couple prop / valeur est compatible avec le navigateur sinon retourne false
 */

export const isStyleSupported = (prop, value) => {
  // If no value is supplied, use "inherit"
  // eslint-disable-next-line
  value = arguments.length === 2 ? value : 'inherit';
  // Try the native standard method first
  if ('CSS' in window && 'supports' in window.CSS) {
    return window.CSS.supports(prop, value);
  }
  // Check Opera's native method
  if('supportsCSS' in window){
    return window.supportsCSS(prop, value);
  }
  // Convert to camel-case for DOM interactions
  const camel = prop.replace(/-([a-z]|[0-9])/ig, function(all, letter) {
    return (`${letter  }`).toUpperCase();
  });
    // Create test element
  const el = document.createElement('div');
  // Assign the property and value to invoke
  // the CSS interpreter
  el.style.cssText = `${prop  }:${  value}`;
  // Ensure both the property and value are
  // supported and return
  return el.style[camel] !== '';
};
