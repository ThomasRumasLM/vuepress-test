import config from '../tokens/layer.json';
import { overlay } from '../templates/_layer.tpl.js';

const mozaicHiddenClass = 'kl-hidden';
const layerHiding = config.isClass.hiding;
const layerHidden = config.isClass.hidden;
const layerVisible = config.isClass.visible;
const layerShowing = config.isClass.showing;
const layerFocusable = config.isClass.focusable;

const allLayers = [];
const animationDelay = 400;

export class Layer {
  constructor(prmOptions) {

    // init options
    const defaultOptions = {
      'content': null,
      'id': `js-layer-${allLayers.length+1}`,
      'displayed': false,
      'onOpen': () => {return true;},
      'onClose': () => {return true;}
    };

    this.options = Object.assign(defaultOptions, prmOptions);
    this.html = document.children[0];
    this.body = document.body;

    if(this.options.content !== null) {
      this.layer = this.body.querySelector(this.options.content);
    }

    this.layerContent = this.layer.querySelector('.js-layer-body');
    this.layerContentLayout = this.layer.querySelector('.js-layer-body-layout');

    // add the overlay
    this.overlay = this.generateOverlayDOM();

    // get the first element of the layer to be able to loop
    this.firstFocusable = this.layer.querySelector('button.close, [href], input, select, textarea, button') || this.layer;

    // Add click event to close the layer
    this.layer.delegateEvent('click', '.js-close-layer', event => {
      event.stopPropagation();
      this.close();
    });

    // Add click event to close the overlay
    this.overlay.addEventListener('click', event => {
      if(!this.layer.matches(`.${mozaicHiddenClass}`) && this.overlay.matches(`.${layerVisible}`) ) {
        event.stopPropagation();
        this.close();
      }
    });

    // keyboard management
    this.restrictFocus();
    this.escapeLayer();

    // Store all layer in this object
    allLayers.push(this);

  }

  open() {

    // get the element of the DOM who has the focus
    this.lastActiveElement = document.activeElement;

    /* Move layer on DOM element to let user escape layer to browser with Shift + Tab */
    const placeholder = `<span class="${mozaicHiddenClass}" data-layer-placeholder="${this.options.id}"></span>`;
    this.layer.insertAdjacentHTML('beforebegin', placeholder);
    this.body.insertBefore(this.layer, this.body.children[0]);

    /* Give accessibility to the layer */
    this.layer.setAttribute('tabindex', '0');
    this.layer.setAttribute('aria-hidden', 'false');

    for(let i = 1; i < this.body.children.length; i++) {
      this.body.children[i].setAttribute('aria-hidden', 'true');
    }

    // Give focus to first focusable Element
    this.firstFocusable.focus();

    /* fix scroll */
    this.html.style.scrollBehavior = 'auto';
    this.html.classList.add('is-scroll-locked');

    // Display layer
    this.overlay.classList.remove(mozaicHiddenClass);
    this.overlay.classList.add(layerShowing);
    this.layer.classList.add(layerShowing);
    this.layer.classList.remove(layerHidden);
    this.displayed = true;

    setTimeout(() => {
      this.overlay.classList.remove(layerShowing);
      this.overlay.classList.add(layerVisible);
      this.layer.classList.remove(layerShowing);
      this.options.onOpen();
    }, animationDelay);

    // check if body is scrollable
    const contentHeight = this.layerContent.offsetHeight;
    const layoutHeight = this.layerContentLayout.scrollHeight;

    if(layoutHeight > contentHeight) {
      this.layerContent.classList.add(layerFocusable);
    }
  }

  close() {
    /* Give focus to the last body element which have focused */
    this.lastActiveElement.focus();

    // Move layer to its initial position
    const placeholder = this.body.querySelector(`[data-layer-placeholder="${this.options.id}"]`);
    placeholder.insertAdjacentElement('beforebegin', this.layer);
    placeholder.parentNode.removeChild(placeholder);


    // Reset tabindex
    this.layer.setAttribute('tabindex', '-1');
    this.layer.setAttribute('aria-hidden', 'true');
    for(let i = 1; i < this.body.children.length; i++) {
      this.body.children[i].setAttribute('aria-hidden', 'false');
    }

    /* fix scroll */
    this.html.classList.remove('is-scroll-locked');

    // Hide layer
    this.overlay.classList.remove(layerVisible);
    this.overlay.classList.remove(layerShowing);
    this.overlay.classList.add(layerHiding);
    this.layer.classList.remove(layerShowing);
    this.layer.classList.add(layerHiding);
    this.displayed = false;

    setTimeout(() => {
      this.overlay.classList.remove(layerHiding);
      this.overlay.classList.add(mozaicHiddenClass);
      this.layer.classList.add(layerHidden);
      this.layer.classList.remove(layerHiding);
      this.options.onClose();
    }, animationDelay);

  }

  restrictFocus() {
    document.addEventListener('focus', (event) => {
      if( !this.layer.matches(`.${layerHidden}`) && !this.layer.contains(event.target)) {
        event.stopPropagation();
        this.firstFocusable.focus();
      }
    }, true);
  }

  escapeLayer() {
    document.addEventListener('keydown', (event) => {
      if((event.keyCode === 27 || event.code === 'Escape' ) && this.displayed) {
        this.close();
      }
    });
  }

  generateOverlayDOM() {
    if( !document.getElementById('js-layer-overlay') ) {
      this.body.insertAdjacentHTML(
        'beforeend',
        lm.template(overlay)
      );
    }
    return document.getElementById('js-layer-overlay');
  }

}
