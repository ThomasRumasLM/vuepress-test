/**
 * Based on https://www.smashingmagazine.com/2014/09/making-modal-windows-better-for-everyone/ recommandation
 *
 * How to create a popin instance
 *
 * If popin exist on DOM
 * this.SearchPopin = new popin({
        "content": '.js-myPopin', // string -> query selector
        "blocked": false, // Boolean default: false
        "desktopSize": "m", // s, m, l
        "fullscreen": false, // boolean
        "onOpen": function() {
            console.log('open');
        },
        "onClose": function() {
            console.log('close');
        }
    });

  * If popin doesn't exist on DOM
  this.testGenerationPopin = new popin({
        {
            "content": {
                cssClass: "",
                title: "",
                subTitle: "",
                headerHTML: "" // overide title/subtitle
                contentHTML: "",
                footerHTML: ""
            }, // object -> popin generation
            "blocked": false, // Boolean default: false
            "desktopSize": "m", // s, m, l
            "fullscreen": false, // boolean
            "onOpen": () => {},
            "onClose": () => {}
        }

    });
*/

import { overlay, PopinTemplate } from '../templates/_popin.tpl.js';

const allPopins = [];
const animationDelay = 400;

export class Popin {
  constructor(prmOptions) {

    // init options
    const defaultOptions = {
      'content': null,
      'blocked': false,
      'id': `js-popin-${allPopins.length+1}`,
      'desktopSize': 'm',
      'fullscreen': false,
      'displayed': false,
      'onOpen': () => {return true;},
      'onClose': () => {return true;}
    };
    if( prmOptions.mobileFullscreen ) {
      prmOptions.fullscreen = prmOptions.mobileFullscreen;
      delete prmOptions.mobileFullscreen;
    }
    this.options = Object.assign(defaultOptions, prmOptions);
    this.body = document.querySelector('body');
    this.html = document.querySelector('html');

    // get the popin or create it    //
    if(this.options.content !== null) {
      if( typeof this.options.content === 'object' ) {
        this.popin = this.generatePopinDOM();
      } else if( typeof this.options.content === 'string') {
        this.popin = document.querySelector(this.options.content);
      }
    }


    this.popinContainer = this.popin.querySelector('.js-popin-inner');
    this.popinHeader = this.popin.querySelector('.js-popin-header');
    this.popinContent = this.popin.querySelector('.js-popin-body');
    this.popinFooter = this.popin.querySelector('.js-popin-footer');

    this.popinContainerStyle = getComputedStyle(this.popinContainer);
    this.popinHeaderStyle = getComputedStyle(this.popinHeader);
    if(this.popinFooter) {
      this.popinFooterStyle = getComputedStyle(this.popinFooter);
    }

    // add the overlay
    this.overlay = this.generateOverlayDOM();

    // get the first element of the popin to be able to loop
    this.firstFocusable = this.popin.querySelector('button.close, [href], input, select, textarea, button') || this.popin;

    // Add click event to close the popin
    this.popin.delegateEvent('click', '.js-close-popin', event => {
      event.stopPropagation();
      this.close();
    });
    this.overlay.addEventListener('click', event => {
      if( !this.options.blocked && !this.popin.matches('.kl-hidden') && this.overlay.matches('.is-visible') ) {
        event.stopPropagation();
        this.close();
      }
    });

    // keyboard management
    this.restrictFocus();
    this.escapePopin();

    // Store all popin in this object
    allPopins.push(this);
  }

  open() {

    // console.time('popinOpen');
    // console.log(`>> Opening ${this.options.id} popin`);

    // Only one poin at a time
    this.closeOtherPopins();

    // get the element of the DOM who has the focus
    this.lastActiveElement = document.activeElement;

    /* Move popin on DOM element to let user escape popin to browser with Shift + Tab */
    const placeholder = `<span class="kl-hidden" data-popin-placeholder="${this.options.id}"></span>`;
    this.popin.insertAdjacentHTML('beforebegin', placeholder);
    this.body.insertBefore(this.popin, this.body.children[0]);

    /* Give accessibility to the popin */
    this.popin.setAttribute('tabindex', '0');
    this.popin.setAttribute('aria-hidden', 'false');

    for(let i = 1; i < this.body.children.length; i++) {
      this.body.children[i].setAttribute('aria-hidden', 'true');
    }

    // Give focus to first focusable Element
    this.firstFocusable.focus();

    /* Fix scroll jumping */
    // if(!this.html.matches('.is-scroll-locked')) {
    //     this.html.dataset.revertScroll = window.scrollY;
    //     this.html.style.transform = `translateY(-${this.scroll}px)`;
    //     this.popin.style.marginTop = `${this.scroll}px`;
    //     this.overlay.style.marginTop = `${this.scroll}px`;
    // }

    /* iOS fixe scroll */
    this.html.style.scrollBehavior = 'auto';
    this.html.classList.add('is-scroll-locked');

    // Display popin
    this.displayed = true;
    this.overlay.classList.remove('kl-hidden');
    this.overlay.classList.add('is-showing');
    this.popin.classList.add('is-showing');
    this.popin.classList.remove('kl-hidden');

    // console.timeEnd('popinOpen');

    setTimeout(() => {
      this.setMaxContentHeight();
      this.overlay.classList.remove('is-showing');
      this.overlay.classList.add('is-visible');
      this.popin.classList.remove('is-showing');
      this.options.onOpen();
    }, animationDelay);
  }

  close(options = {'chainedPopin': false}) {

    // console.time('popinClose');
    // console.log(`<< Closing ${this.options.id} popin : ${options.chainedPopin}`);

    if( !options.chainedPopin ) {

      /* Give focus to the last body element which have focused */
      this.lastActiveElement.focus();


      /* iOS fixe scroll */
      this.html.classList.remove('is-scroll-locked');

      /* Fix scroll jumping */
      // let revertScrollValue = this.scroll;
      // delete this.html.dataset.revertScroll;
      // this.html.style.transform = null;
      // window.scrollTo(0, revertScrollValue);
      // this.html.style.scrollBehavior = null;
      // this.popin.style.marginTop = null;
      // this.overlay.style.marginTop = null;

      // Move popin to its initial position
      const placeholder = this.body.querySelector(`[data-popin-placeholder="${this.options.id}"]`);
      placeholder.insertAdjacentElement('beforebegin', this.popin);
      placeholder.parentNode.removeChild(placeholder);


      // Reset tabindex
      this.popin.setAttribute('tabindex', '-1');
      this.popin.setAttribute('aria-hidden', 'true');
      for(let i = 1; i < this.body.children.length; i++) {
        this.body.children[i].setAttribute('aria-hidden', 'false');
      }

      this.overlay.classList.add('is-hiding');
      this.overlay.classList.remove('is-visible');
      setTimeout(() => {
        this.overlay.classList.add('kl-hidden');
        this.overlay.classList.remove('is-hiding');
      }, animationDelay);
    }

    this.displayed = false;
    this.popin.classList.add('is-hiding');

    // console.timeEnd('popinClose');
    setTimeout(() => {
      this.popin.classList.remove('is-hiding');
      this.popin.classList.add('kl-hidden');
      this.options.onClose();
    }, animationDelay);
  }

  closeOtherPopins() {
    lm.forEach( allPopins, el => {
      if(el.displayed) {
        el.close({'chainedPopin': true});
      }
    });
  }

  restrictFocus() {
    document.addEventListener('focus', (event) => {
      if( !this.popin.matches('.kl-hidden') && !this.popin.contains(event.target)) {
        event.stopPropagation();
        this.firstFocusable.focus();
      }
    }, true);
  }

  escapePopin() {
    document.addEventListener('keydown', (event) => {
      if((event.keyCode === 27 || event.code === 'Escape' ) && this.displayed) {
        this.close();
      }
    });
  }

  generatePopinDOM() {
    this.body.insertAdjacentHTML(
      'beforeend',
      lm.template(PopinTemplate, this.options)
    );
    return document.querySelector(`div[data-name="${this.options.id}"]`);
  }

  generateOverlayDOM() {
    if( !document.getElementById('js-popin-overlay') ) {
      this.body.insertAdjacentHTML(
        'beforeend',
        lm.template(overlay)
      );
    }
    return document.getElementById('js-popin-overlay');
  }

  setMaxContentHeight() {

    let maxHeight = this.popinContainer.offsetHeight;
    maxHeight = maxHeight - this.popinHeader.offsetHeight;
    maxHeight = maxHeight - parseInt( this.popinContainerStyle.paddingTop );
    maxHeight = maxHeight - parseInt( this.popinContainerStyle.paddingBottom );
    maxHeight = maxHeight - parseInt( this.popinHeaderStyle.marginBottom );
    if(this.popinFooter) {
      maxHeight = maxHeight - this.popinFooter.offsetHeight;
      maxHeight = maxHeight - parseInt( this.popinFooterStyle.marginTop );
    }
    this.popinContent.style.maxHeight = `${maxHeight}px`;
  }

  get scroll() {
    return this.html.dataset.revertScroll || 0;
  }
}
