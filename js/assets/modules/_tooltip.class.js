import config from '../tokens/tooltip.json';

const tooltipHidden = config.isClass.hidden;
const tooltipVisible = config.isClass.visible;

/**
* @param option.element: String
* @param option.onOpen: function
* @param option.onClose: function
*/

export class Tooltip {
  constructor(option = {}) {

    // Retrocompatibility with tooltip v1
    if( typeof option === 'string' ) {
      option = {
        element: arguments[0],
        onOpen: arguments[1],
        onClose: arguments[2]
      };
    }



    this.tooltip = document.querySelector(`${option.element}`);
    this.button = this.tooltip.querySelector('.js-tooltip__button');
    this.wrapper = this.tooltip.querySelector('.js-tooltip__wrapper');
    this.pointer = this.tooltip.querySelector('.js-tooltip__pointer');
    this.closeButton = this.tooltip.querySelector('.js-tooltip__close-button');
    this.onOpen = option.onOpen || function () { return true; };
    this.onClose = option.onClose || function () { return true; };
    this.lastActiveElement = null;
    this.displayed = false;

    /** get the first element of the popin to be able to loop */
    this.firstFocusable = this.wrapper.querySelector('button.js-tooltip__close-button') || this.wrapper;

    if(this.tooltip.matches(config.isClass.hover)) {
      this.tooltip.addEventListener('click', () => {
        this.open();
      });
    } else {
      this.button.addEventListener('click', () => {
        this.open();
      });
    }

    this.closeButton.addEventListener('click', event => {
      event.stopPropagation();
      this.close();
    });

    /** keyboard management */
    this.restrictFocus();
    this.escapeTooltip();

  }

  open() {

    /** get the element of the DOM who has the focus */
    this.lastActiveElement = document.activeElement;

    /** Give accessibility to the popin */
    this.wrapper.setAttribute('tabindex', '0');
    this.wrapper.setAttribute('aria-hidden', 'false');

    /** Give focus to first focusable Element */
    this.firstFocusable.focus();

    this.displayed = true;
    this.wrapper.classList.remove(tooltipHidden);
    this.pointer.classList.remove(tooltipHidden);
    this.wrapper.classList.add(tooltipVisible);
    this.pointer.classList.add(tooltipVisible);
    this.onOpen();
  }

  close() {

    /** Give focus to the last body element which have focused */
    this.lastActiveElement.focus();

    /** Reset tabindex */
    this.wrapper.setAttribute('tabindex', '-1');
    this.wrapper.setAttribute('aria-hidden', 'true');

    this.displayed = false;
    this.wrapper.classList.add(tooltipHidden);
    this.pointer.classList.add(tooltipHidden);
    this.wrapper.classList.remove(tooltipVisible);
    this.pointer.classList.remove(tooltipVisible);
    this.onClose();
  }

  restrictFocus() {
    document.body.addEventListener('focus', event => {
      if (this.wrapper.matches(config.isClass.visible) && !this.wrapper.contains(event.target) && event.target.getAttribute('data-name') !== null) {
        event.stopPropagation();
        this.firstFocusable.focus();
      }
    }, true);
  }

  escapeTooltip() {
    document.addEventListener('keydown', event => {
      if ((event.keyCode === 27 || event.code === 'Escape') && this.displayed) {
        this.close();
      }
    });
    document.addEventListener('click', event => {
      if( !this.tooltip.contains( event.target ) && this.wrapper.matches(config.isClass.visible) ) {
        this.close();
      }
    });
  }
}
