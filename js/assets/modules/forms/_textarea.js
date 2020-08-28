export class TextArea {
  /**
   * Init needed events for textarea
   * @param {Node} prmTextArea
   */
  constructor(prmTextArea) {
    this.textarea = prmTextArea;
    _maxLengthCounter.call(this);
  }
}

/**
 * Init needed events for textarea and enable characters remaining
 */
function _maxLengthCounter() {
  const remainingCharDiv = document.createElement('div');
  remainingCharDiv.classList.add('km-field__remaining-character');
  this.textarea.insertAdjacentElement('afterend', remainingCharDiv);

  lm.forEach(['keydown', 'mousedown'], eventType => {
    this.textarea.addEventListener(eventType, () => {
      setTimeout( () => {
        const remainingChar = _getRemainingChar.call(this);
        if ( remainingChar >= 0 ) {
          this.textarea.value = this.textarea.value.substring(0, this.textarea.maxLength);
        }
        remainingCharDiv.innerHTML = `${remainingChar} caractère${remainingChar > 1 ? 's' : ''} restant${remainingChar>1?'s':''}`;
      }, 16);

    });
  });
  this.textarea.dispatchEvent( new Event('keydown' ) );
}

/**
 * Return number of characters remaining
 * @returns {BigInt}
 */
function _getRemainingChar() {
  return this.textarea.maxLength - this.textarea.value.length;
}
