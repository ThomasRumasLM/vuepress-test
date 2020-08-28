import {Constants as CONSTANTS} from './constants.class';

class PopinFilters {
  constructor() {
    this.config = {
      'content': `.${CONSTANTS.POPIN_FILTERS.CONTAINER}`,
      'fullscreen': true
    };
    this.popinInstance = new lm.Popin(this.config);
    this.open();
    this.scroll();
  }

  /**
   * open the popin in mobile mode
   */
  open() {
    document.querySelector(`.${CONSTANTS.POPIN_FILTERS.OPEN_BUTTON}`).addEventListener('click', () => {
      this.popinInstance.open();
    });

  }

  /**
   * add shadow in header of popin in scrolling
   */
  scroll(){

    this.popinInstance.popinContent.addEventListener('scroll', (evt) => {
      const _position = evt.target.scrollTop;
      if (_position > 0 && !evt.target.classList.contains(`${CONSTANTS.POPIN_FILTERS.CSS_FIXED}`)) {
        this.popinInstance.popinHeader.classList.add(`${CONSTANTS.POPIN_FILTERS.CSS_FIXED}`);
      } else {
        this.popinInstance.popinHeader.classList.remove(`${CONSTANTS.POPIN_FILTERS.CSS_FIXED}`);
      }
    });
  }
}

export default PopinFilters;
