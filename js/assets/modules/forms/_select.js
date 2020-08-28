const SPACE  = 32;
const ESCAPE = 27;
const TAB	 = 9;

export class Select {
  /**
   * Init needed events for select HTML elements from formular
   * @param {Node} prmSelect
   */
  constructor(prmSelect) {
    this.select = prmSelect;
    _selectArrowBehavior.call(this);
    _selectFocusBehavior.call(this);
  }
}

/**
 * Function to change the arrow to up or down on select HTML element when specific events are triggered
 */
function _selectArrowBehavior() {
  lm.forEach(['click', 'keydown'], eventType => {
    this.select.addEventListener(eventType, event => {
      if((event.keyCode && event.keyCode === SPACE) || event.type !== 'keydown'){
        this.select.classList.contains('is-open') ? this.select.classList.remove('is-open') : this.select.classList.add('is-open');
      }
    });
  });

  lm.forEach(['change', 'blur', 'keydown'], eventType => {
    this.select.addEventListener(eventType, event => {
      if((event.keyCode && (event.keyCode === ESCAPE || event.keyCode === TAB)) || event.type !== 'keydown'){
        this.select.classList.remove('is-open');
      }
    });
  });
}

/**
 * Function to triggered focus on select HTML element
 */
function _selectFocusBehavior() {
  const selectWrapper = this.select.parentNode;
  if(selectWrapper.classList.contains('js-select-wrapper')) {
    this.select.addEventListener('focus', () => {
      selectWrapper.classList.add('is-focus');
    });

    this.select.addEventListener('focusout', () => {
      selectWrapper.classList.remove('is-focus');
    });
  }
}
