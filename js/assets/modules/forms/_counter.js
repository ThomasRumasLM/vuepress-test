export class Counter {
  /**
   * Init needed events for counter HTML elements from formular
   * @param {Node} prmCounter
   */
  constructor(prmCounter) {
    this.counter = prmCounter;
    this.min = parseFloat(this.counter.getAttribute('min') || this.counter.dataset.min);
    this.max = parseFloat(this.counter.getAttribute('max') || this.counter.dataset.max);
    this.step = parseFloat(this.counter.getAttribute('data-step'));
    _counterEvent.call(this, this.counter);
  }
}

/**
 * Init event on input and element sibling near to it (buttons)
 */
function _counterEvent() {
  _disableButtons.call(this);

  this.counter.addEventListener('blur', () => {
    let value = _getNumberValue.call(this);
    this.counter.value = Math.max(value, this.min);
    value = _getNumberValue.call(this);
    this.counter.value = Math.min(value, this.max);
    _disableButtons.call(this);
  });

  this.counter.previousElementSibling.addEventListener('click', event => {
    event.preventDefault();
    const value = _getNumberValue.call(this);
    const newValue = Math.ceil(value) - this.step;
    this.counter.value = Math.max(newValue, this.min);
    _disableButtons.call(this);
  });

  this.counter.nextElementSibling.addEventListener('click', event => {
    event.preventDefault();
    const value = _getNumberValue.call(this);
    const newValue = Math.floor(value) + this.step;
    this.counter.value = Math.min(newValue, this.max);
    _disableButtons.call(this, );
  });
}

/**
 * Disabled buttons to step up or step down counter's value
 */
function _disableButtons() {
  const value = _getNumberValue.call(this);
  this.counter.previousElementSibling.disabled = (value === this.min);
  this.counter.nextElementSibling.disabled = (value === this.max);
}

/**
 * Return value with comma replace by point.
 * @returns {String}
 */
function _acceptComma(prmValue) {
  return prmValue.replace(/,/g, '.');
}

/**
 * Return the value of counter element passed as parameter
 * @returns {BigInt}
 */
function _getNumberValue() {
  return (this.counter.value === '0') ? 0 : parseFloat(_acceptComma(this.counter.value)) || 1;
}

