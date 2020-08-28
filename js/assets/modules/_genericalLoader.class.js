const _loaderPath = '/app/lmfr-site/static/images/common/loader.svg';
const _loaderType = 'img';

export default class GenericalLoader {
  /**
   *
   * @param {String} prmLoader your loader, default will be loader URL of lmfr-site
   * @param {String} prmType can be img url or svg, default img
   */
  constructor(prmLoader = _loaderPath, prmType = _loaderType) {
    const isIE11 = !!window.MSInputMethodContext && !!document.documentMode;
    if (isIE11 && prmLoader.indexOf(_loaderPath) !== -1) {
      this.loader = '/app/lmfr-site/static/images/common/loader.gif';
    } else {
      this.loader = prmLoader;
    }
    this.type = prmType;
  }

  /**
   *
   * @param {Node} prmNode the Node where you want to append your loader
   */
  append(prmNode) {
    let htmlGeneration = '';
    switch (this.type) {
    case 'img':
      htmlGeneration = `<img alt="Chargement" class="js-generical-loader" src="${this.loader}"/>`;
      break;
    case 'svg':
      htmlGeneration = `<div class="js-generical-loader">${this.loader}</div>`;
      break;
    default:
      htmlGeneration = `<img alt="Chargement" class="js-generical-loader" src="${this.loader}"/>`;
      break;
    }
    prmNode.insertAdjacentHTML('beforeend', htmlGeneration);
  }

  /**
   *
   * @param {Node} prmNode the Node where you want to remove your loader
   */
  remove(prmNode) {
    prmNode.removeChild(prmNode.querySelector('.js-generical-loader'));
  }
}
