// Form validation module

// Input type specific behavior

import * as _captcha from './forms/_captcha.js';
import {Counter} from './forms/_counter.js';
import {Upload} from './forms/_upload.js';
import {Validation} from './forms/_validation.js';

export class Formulaire {
  constructor(prmForm) {
    // Init input type specific behavior
    this.formular = prmForm;
    this.initCounters();
    this.initUploadInput();
    this.initValidation();

    _captcha.captchaBehavior.call(this, prmForm);
  }

  initCounters() {
    const counterList = this.formular.querySelectorAll('.js-input-counter');
    for(let i = 0; i < counterList.length; i++) {
      new Counter(counterList[i]);
    }
  }

  initUploadInput() {
    const uploadList = this.formular.querySelectorAll('.js-input-upload');
    for(let i = 0; i < uploadList.length; i++) {
      new Upload(uploadList[i]);
    }
  }

  initValidation() {
    new Validation(this.formular);
  }
}
