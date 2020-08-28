// Fonction de gestion du DomReady, passé ou futur
export const DOMReady = start => {
  if( lm.polyfillsLoading && !AllPolyfillReady() ) {

    lm.polyfillsLoading.forEach(polyfill => {
      if(!polyfill.loaded) {
        document.addEventListener(polyfill.name, () => {
          if( AllPolyfillReady() ) {
            DOMContentLoaded(start);
          }
        }, false);
      }
    });

  } else {
    DOMContentLoaded(start);
  }
};
const AllPolyfillReady = () => {
  return  lm.polyfillsLoading.every(el => el.loaded);
};
const DOMContentLoaded = start => {
  if (/comp|inter|loaded/.test(document.readyState)){
    // In case DOMContentLoaded was already fired, the document readyState will be one of "complete" or "interactive" or (nonstandard) "loaded".
    // The regexp above looks for all three states. A more readable regexp would be /complete|interactive|loaded/
    start();
  }else{
    // In case DOMContentLoaded was not yet fired, use it to run the "start" function when document is read for it.
    document.addEventListener('DOMContentLoaded', start, false);
  }
};
