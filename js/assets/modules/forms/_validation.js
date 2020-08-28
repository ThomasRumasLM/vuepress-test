import config from '../../tokens/field.json';

export class Validation {
  constructor(prmForm) {
    this.formular = prmForm;
    this.submitEvent();
    this.invalidEvent();
    this.submitWithButton();
    this.focusEventOnFields();
    this.blurEventOnFields();
    this.checkedEventForRadioAndCheckbox();
    this.changeEventCriterion();
  }

  /**
   * Support Safari, iOS Safari, and the Android browser—each of which do not prevent form submissions by default
   */
  submitEvent() {
    this.formular.addEventListener('submit', event => {
      if (!this.formular.checkValidity()) {
        event.preventDefault();
      }
    });
  }

  /**
   * Init invalid event on fields from formular
   */
  invalidEvent() {
    this.formular.addEventListener('invalid', event => {
      _turnInvalid(event.target);
      event.preventDefault();
    });
  }

  /**
   * Init submit buttons click event in formular
   */
  submitWithButton() {
    const submitButton = this.formular.querySelector('button[type=submit], input[type=submit]');
    submitButton.addEventListener('click', () => {
      const fields = this.formular.querySelectorAll(`.js-form-input, .js-input-upload, .${config.class} select, .${config.class} textarea, .js-form-radio, .js-form-checkbox, .js-form-ratingstar`);
      lm.forEach(fields, field => {
        if(!_isRadio(field) && !_isCheckbox(field) && !_isRatingstar(field)) {
          if(_isTrimable(field)) {
            field.value = field.value.trim();
          }
          if(field.checkValidity()) {
            if(!_isEmpty(field) ) {
              if(!_isDefaultValue(field)) {
                _turnValid(field);
              } else {
                _turnInvalid(field);
              }
            }
          } else {
            _turnInvalid(field);
          }
          _preValidThisField(field);
        } else {
          const listContainer = lm.getClosest(field, '.js-form-field-list');
          const listInputs = listContainer.querySelectorAll('.js-form-radio, .js-form-checkbox, .js-form-ratingstar');
          const minRequired = listContainer.dataset.minRequired ? listContainer.dataset.minRequired
            : field.hasAttribute('required') ? 1
              : 0;
          const listInputsChecked = listContainer.querySelectorAll('.js-form-radio:checked, .js-form-checkbox:checked, .js-form-ratingstar:checked');
          const arrayListInputs = Array.from(listInputs);

          if(!arrayListInputs.find(el => el === document.activeElement)) {
            if(listInputsChecked.length < minRequired || (field.hasAttribute('required') && _isRatingstar(field) && field.value === '0')) {
              lm.forEach(listInputs, el => {
                el.classList.remove('is-valid');
                el.classList.add('is-invalid');
              });
              _manageErrorMsg(arrayListInputs.find(el => !el.matches(':checked')));
            }
          }
        }
      });
    });
  }

  /**
   * Init event to triggered focus event on fields from formular
   */
  focusEventOnFields() {
    const fields = this.formular.querySelectorAll(`.js-form-input, .${config.class} select, .${config.class} textarea`);
    lm.forEach(fields, field => {
      field.addEventListener('focus', () => {
        _resetValidity(field);
      });
    });
  }

  /**
   * Init event to triggered blur event on fields from formular
   */
  blurEventOnFields() {
    const fields = this.formular.querySelectorAll(`.js-form-input, .js-input-upload, .${config.class} select, .${config.class} textarea`);
    lm.forEach(fields, field => {
      field.addEventListener('blur', () => {
        _resetValidity(field);

        if(_isTrimable(field)) {
          field.value = field.value.trim();
        }

        if(field.checkValidity()) {
          if(field.matches('.js-input-criterion')) {
            if(field.nextElementSibling.querySelectorAll('.is-invalid').length > 0){
              _turnInvalid(field);
              return;
            }
          }

          if(!_isEmpty(field)) {
            if(!_isDefaultValue(field)) {
              _turnValid(field);
            } else {
              _turnInvalid(field);
            }
          }
        } else {
          _turnInvalid(field);
        }
      });
      _preValidThisField(field);
    });
  }

  /**
   * Init event to triggered checked event on radio buttons and checkbox from formular
   */
  checkedEventForRadioAndCheckbox() {
    const fields = this.formular.querySelectorAll('.js-form-radio, .js-form-checkbox, .js-form-ratingstar');
    lm.forEach(fields, field => {
      const listContainer = lm.getClosest(field, '.js-form-field-list');
      const listInputs = listContainer.querySelectorAll('.js-form-radio, .js-form-checkbox, .js-form-ratingstar');
      const minRequired = listContainer.dataset.minRequired ? listContainer.dataset.minRequired
        : field.hasAttribute('required') ? 1
          : 0;
      let listInputsChecked;

      field.addEventListener('change', () => {
        listInputsChecked = listContainer.querySelectorAll('.js-form-radio:checked, .js-form-checkbox:checked, .js-form-ratingstar:checked');
        lm.forEach(listInputs, el => {
          el.required = (listInputsChecked.length < minRequired);
          _resetValidity(el);
        });
      });

      field.addEventListener('blur', () => {
        listInputsChecked = listContainer.querySelectorAll('.js-form-radio:checked, .js-form-checkbox:checked, .js-form-ratingstar:checked');
        setTimeout(()=>{
          const arrayListInputs = Array.from(listInputs);
          if(!arrayListInputs.find(el => el === document.activeElement)) {
            if(listInputsChecked.length < minRequired || (field.hasAttribute('required') && _isRatingstar(field) && field.value === '0')) {
              lm.forEach(listInputs, el => {
                el.classList.remove('is-valid');
                el.classList.add('is-invalid');
              });
              _manageErrorMsg(arrayListInputs.find(el => !el.matches(':checked')));
            }
          }
        }, 1);
      });

    });
  }

  /**
   * Init event on fields that's have criterion from formular
   */
  changeEventCriterion() {
    const inputsWithCriterion = this.formular.querySelectorAll( '.js-input-criterion' );
    lm.forEach(inputsWithCriterion, input => {
      const criterionList = _getCriterion(input);
      lm.forEach(['keyup', 'mouseup', 'change'], eventType => {
        input.addEventListener(eventType, () => {
          _validCriterion(input, criterionList);
        });
      });
      input.dispatchEvent( new CustomEvent('change', {'target': input }) );
    });
  }
}

/**
 * Reset validty of field
 * @param {Node} prmField
 */
function _resetValidity(prmField) {
  prmField.classList.remove('is-valid', 'is-invalid');
  _manageErrorMsg(prmField);
}

/**
 * Valid field value before submitting formular
 * @param {Node} prmField
 */
function _preValidThisField(prmField) {
  if(!_isEmpty(prmField) && !_isRadio(prmField) && !_isCheckbox(prmField) && !_isRatingstar(prmField) && !_isSelect(prmField)) {
    if(prmField.checkValidity()) {
      _turnValid(prmField);
    } else {
      _turnInvalid(prmField);
    }
  }
}

/**
 * Valid field and add good CSS classes
 * @param {Node} prmField
 */
function _turnValid(prmField) {
  prmField.classList.remove('is-invalid');
  prmField.classList.add('is-valid');
  _manageErrorMsg(prmField);
}

/**
 * Invalid field and add good CSS classes
 * @param {Node} prmField
 */
function _turnInvalid(prmField) {
  prmField.classList.remove('is-valid');
  prmField.classList.add('is-invalid');
  _manageErrorMsg(prmField);
}

/**
 * Show/Hide errors message from field
 * @param {Node} prmField
 */
function _manageErrorMsg(prmField) {
  const fieldContainer = lm.getClosest(prmField, `.${config.class}`);
  const errorMsg = fieldContainer.querySelector('.js-form-error');
  if( errorMsg ) {
    prmField.removeAttribute('aria-describedby');
    fieldContainer.removeChild(errorMsg);
  }

  if(prmField.matches('.js-input-criterion.is-invalid')) {
    if(_isEmpty(prmField)) {
      prmField.insertAdjacentHTML('afterend', _makeError(prmField, 'missing'));
    } else {
      prmField.insertAdjacentHTML('afterend', _makeError(prmField, 'mismatch'));
    }
    return;
  }

  if(prmField.matches('.is-invalid:not(.km-field__criteria-list__item)') ) {
    if(_isEmpty(prmField) || _isRadio(prmField) || _isCheckbox(prmField) || _isRatingstar(prmField)) {
      fieldContainer.insertAdjacentHTML('beforeend', _makeError(prmField, 'missing'));
    } else {
      fieldContainer.insertAdjacentHTML('beforeend', _makeError(prmField, 'mismatch'));
    }
  }
}

/**
 * Append error message depending prmErrorType value
 * @param {Node} prmField
 * @param {String} prmErrorType
 */
function _makeError(prmField, prmErrorType) {
  let msg;
  let cssClass;
  let tplPrefix = '';
  let tplSuffix = '';
  if(_isRadio(prmField) || _isCheckbox(prmField) || _isRatingstar(prmField)) {

    const checkableList = lm.getClosest(prmField, '.js-form-field-list');
    msg = checkableList.dataset[`${prmErrorType}`] ? checkableList.dataset[`${prmErrorType}`] : '';

    cssClass = checkableList.dataset['errorWrapper'] || '';
    cssClass += ' js-form-error';
    if (checkableList.dataset['errorWrapper']) {
      tplPrefix = '<div class="col-container-inner js-form-error">';
      tplSuffix = '</div>';
    }

  } else {
    msg = prmField.dataset[`${prmErrorType}`] ? prmField.dataset[`${prmErrorType}`] : '';
    cssClass = `${prmField.dataset['errorWrapper'] ? prmField.dataset['errorWrapper'] : ''} js-form-error`;
  }
  // role alert ? only on blur ?
  prmField.setAttribute('aria-describedby', `${prmField.id}-error`);
  const tpl = `${tplPrefix}<span class="${config.class}${config.error} ${cssClass}" id="{{=it.id}}-error">{{=it.msg}}</span>${tplSuffix}`;
  return lm.template(tpl, {'msg': msg, 'id': prmField.id});
}

/**
 * Get all valids criterion from a field
 * @param {Node} prmField
 */
function _getCriterion(prmField) {
  const criterion = lm.getClosest(prmField, `.${config.class}`).querySelectorAll('.km-field__criteria-list li');
  const criterionList = [];
  lm.forEach(criterion, criteria => {
    const pattern = {
      'pattern': new RegExp( criteria.getAttribute('data-pattern')),
      'element': criteria
    };
    criterionList.push(pattern);
  });
  return criterionList;
}

/**
 * Valid a field if all criterions are validated
 * @param {Node} prmField
 * @param {Array} prmCriterionList
 */
function _validCriterion(prmField, prmCriterionList) {
  lm.forEach(prmCriterionList, criteria => {
    const {pattern} = criteria;
    if(pattern.test(prmField.value)) {
      _turnValid(criteria.element);
    } else {
      _turnInvalid(criteria.element);

    }
  });
}

/**
 * Check if selected value is not default value
 * @param {Node} prmField
 */
function _isDefaultValue(prmField) {
  const options = prmField.querySelectorAll('option');
  for (let i = 0; i < options.length; i++) {
    if(options[i].dataset.order === prmField.value) {
      return options[i].dataset.order === prmField.value;
    }
  }
  return false;
}

/**
 * Test if field value is equal to ''
 * @param {Node} prmField
 */
function _isEmpty(prmField) {
  return prmField.value === '';
}

/**
 * Test if field is a radio button
 * @param {Node} prmField
 */
function _isRadio(prmField) {
  return prmField.type === 'radio';
}

/**
 * Test if field is a checkbox
 * @param {Node} prmField
 */
function _isCheckbox(prmField) {
  return prmField.type === 'checkbox';
}

/**
 * Test if field is a rating stars input
 * @param {Node} prmField
 */
function _isRatingstar(prmField) {
  return (prmField.type === 'radio' && prmField.classList.contains('js-form-ratingstar'));
}

/**
 * Test if field is a select
 * @param {Node} prmField
 */
function _isSelect(prmField) {
  return prmField.tagName === 'SELECT';
}

/**
 * Test if fiels is a textual one
 * @param {Node} prmField
 */
function _isTrimable(prmField) {
  return prmField.type === 'text';
}
