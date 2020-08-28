// Polyfill pour Element.matches
if (!Element.prototype.matches) {
  Element.prototype.matches = 
      Element.prototype.msMatchesSelector || 
      Element.prototype.oMatchesSelector || 
      Element.prototype.webkitMatchesSelector;
}
