import {asyncImportScript} from '../modules/_asyncImportScript';

export class Polyfill {
  constructor(name, path) {
    lm.polyfillsLoading.push({'name': name, 'loaded': false});
    const scriptBlock = asyncImportScript(path, false);

    polyfillLoad_Event(name, scriptBlock);

  }
}

const polyfillLoad_Event = (polyName, scriptBlock) => {
  scriptBlock.addEventListener('load', () => {
    let polyfill;
    lm.polyfillsLoading.forEach(el=>{
      if(el.name===polyName) {
        polyfill = el;
      }
    });
    polyfill.loaded = true;
    document.dispatchEvent(new CustomEvent(polyName)); // lm.DOMReady listen this
    // console.log(`${polyName} has loaded`);
  });
};
