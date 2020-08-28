'use strict';

/**
 * To know the parameter you can use : https://flatpickr.js.org/options/
 * prmObjDate
 * element : string that contains the class/id of the DOM element we want to append this module
 * dateFormat : string that contains the date format we want to use
 * disable : Array that contains date we don't want to be choose, example ['2018-05-25']
 * minDate : string or DateTime that contains the minimum date that are possibly to choose
 */

import flatpickr from 'flatpickr';
import French from 'flatpickr/dist/l10n/fr';

class DatePicker {
  constructor(prmObjDate) {
    flatpickr.localize(French.fr);
    this.parameters = prmObjDate;
    this.datePicker = new flatpickr(this.parameters.element, this.parameters);
  }

  get dateValue() {
    return this.datePicker.input.value;
  }

  set dateValue(prmDateValue) {
    const date = new Date(prmDateValue);
    this.datePicker.input.value = `${(`0${  date.getDate()}`).slice(-2)}/${(`0${  date.getMonth() + 1}`).slice(-2)}/${date.getFullYear()}`;
  }
}

export default DatePicker; 
