import Filters from '../filters.class';
import {Constants as CONSTANTS} from '../constants.class';
window.tc_vars = {
  page_cat1_label: 'Electricité et domotique',
  page_cat2_label: 'Alarme maison, caméra de surveillance et détecteur de fumée',
  page_cat3_label: 'Extincteur',
  page_cat4_label: ''
};
window.lm = {
  getClosest: function () {
    return document.querySelector('.js-filter-panel');
  },
  forEach: () => {
  }
};
document.body.innerHTML = `
<section class="kl-popin kl-hidden ko-popin-filters js-contentPopinFilters kl-popin--fullscreen js-popin" data-name="js-popin-999" tabindex="-1" aria-labelledby="js-popin-999-title">
<form class="js-form-filters" role="form">
<button class=" js-reset-filters kl-hidden" type="button" data-event="false"> Réinitialiser</button>
 <ul class="kl-accordion js-accordion" id="js-filters-accordion">
   <li class="ko-filter-item ko-filter-item--border js-filter-panel " data-filter-type="standard" data-cerberus="ELEM_Filtres">
       <div class="ko-filter-item__header js-accordion__header " id="js-filters-accordionheader1" tabindex="0" aria-controls="js-filters-accordionpanel1" role="tab">
           <button type="button" class="ko-filter-item__header-link  ">
              <span class="ko-filter-item__name">Type de produit</span>
              <span class="ko-filter-item__examples">
                                          Poteau/
                              Support de piquet/
                              </span>
           </button>
       </div>
       <div class="ko-filter-item__content js-accordion__panel " data-panel="1" data-category-code="type-de-produit" data-filters-type="standard" id="js-filters-accordionpanel4" aria-labelledby="js-filters-accordionheader4" role="tabpanel">

           <div class="kl-showmore is-expandable" id="js-showMore-type-de-produit" data-nb-filters-to-display="6" style="max-height: 15rem;">
        <fieldset role="group" class="km-field km-field--list  km-standard-filter ">
    <legend class="km-field__label   kl-hidden " for="type-de-produit--998">
            Type de produit
    </legend>
    <ul class="km-field__wrapper js-form-field-list">


    <li class="km-checkbox-wrapper km-field__checkbox-wrapper ">
        <input role="checkbox" aria-label="Poteau Choix numéro 1 : Poteau" type="checkbox" class="km-checkbox-wrapper__input js-form-checkbox" name="type-de-produit" id="type-de-produit--998--0" value="Poteau" data-category="Type de produit" data-type="standard">
        <label aria-hidden="true" class="km-checkbox-wrapper__label" for="type-de-produit--998--0">
                Poteau
                   <span class="km-checkbox-wrapper__suffix-label km-content-filter__suffix-label" data-aria-label="57 élément" data-cerberus="ELEM_NombreProduitFiltre">(57)</span>
            </label>
    </li>
            </ul>
        </fieldset>
           </div><span class="mc-link">Voir plus</span>
       </div>
 </li>
   <li class="ko-filter-item ko-filter-item--border js-filter-panel " data-filter-type="toggle" data-cerberus="ELEM_Filtres">
       <div class="km-toggle-filter ">
           <div class="km-toggle-filter__container" data-cerberus="BTN_toggle">    <div class="km-field ">

        <label class="km-switch km-switch--checkbox ">
            <span class="km-switch__label km-field__label km-toggle-filter__label ">deliveryCostFree <span class="km-toggle-filter__label-quantity" aria-hidden="true">(2)</span></span>
            <input class="km-switch__input " type="checkbox" id="deliverycostfree--997" value="true" name="deliverycostfree" data-category="deliveryCostFree" data-type="toggle" aria-label="deliveryCostFree">
            <span class="km-switch__element" aria-hidden="true"></span>
        </label>
    </div>
</div>
       </div>

                             </li>
   <li class="ko-filter-item ko-filter-item--border js-filter-panel " data-filter-type="range" data-cerberus="ELEM_Filtres">
     <div class="ko-filter-item__header js-accordion__header " id="js-filters-accordionheader4" tabindex="0" aria-controls="js-filters-accordionpanel4" role="tab">
         <button type="button" class="ko-filter-item__header-link  ">
             <span class="ko-filter-item__name">Prix</span>
            <span class="ko-filter-item__examples">
                0.7 € - 79.9 € </span>
         </button>
     </div>
      <div class="km-range-filter js-accordion__panel is-collapsed" data-panel="4" data-category-code="prix" data-filters-type="range" id="js-filters-accordionpanel4" aria-labelledby="js-filters-accordionheader4" role="tabpanel" aria-expanded="false">
          <div class="km-range-filter__element">
              <input type="number" step="any" inputmode="numeric" class="js-rangeMin" min="0.7" data-category="prix" data-value-changed="false" value="0.7" aria-label="valeur minimum"><span aria-hidden="true" class="km-range-filter__unit">€</span>
          </div>
          <span class="km-range-filter__separator">-</span>
          <div class="km-range-filter__element">
              <input type="number" step="any" inputmode="numeric" class="js-rangeMax" max="79.9" data-category="prix" data-value-changed="false" value="79.9" aria-label="valeur maximum"><span aria-hidden="true" class="km-range-filter__unit">€</span>
          </div>
          <button class="km-range-filter__reset  js-rangeReset" type="button" data-type="range" data-category="prix">Réinitialiser</button>
          <button type="button" class="ka-button ka-button--secondary ka-button--m km-range-filter__button is-disabled js-rangeApply" disabled="disabled" data-type="range" data-category="prix">Appliquer</button>
      </div>

   </li>

   </ul>
                                 <footer class="km-footer-popin-filters  kl-hidden@from-xl ">
                 <button type="button" class="ka-button ka-button--full l-filter-footer__button js-filter-button js-close-popin ">
                                Voir les 312 produits
                 </button>
             </footer>

                </form></section>`;

const eventFire = (el, etype) => {
  if (el.fireEvent) {
    el.fireEvent(`on ${etype}`);
  } else {
    const evObj = document.createEvent('Events');
    evObj.initEvent(etype, true, false);
    el.dispatchEvent(evObj);
  }
};

const config = {
  event: {
    target: jest.fn(), key: 'selectedFilters',
    dataKey: 'filters'
  },
  lastSelectedFilter: 'prix'
};

const filtersTest = new Filters(config);

describe('Class Filters', () => {

  test('If Class Filters is defined', () => {
    expect(filtersTest).toBeDefined();

  });
  test('If instance selectedFiltersTest is instance of SelectedFilters', () => {
    expect(filtersTest).toBeInstanceOf(Filters);

  });
  test('If Class SelectedFilters form is defined', () => {
    expect(filtersTest.form).toBeDefined();
  });

  test('If selectedFilters in class Filters is defined', () => {
    expect(filtersTest.selectedFilters).toBeDefined();
  });

  test('If lastSelectedFilter in class Filters is defined', () => {
    expect(filtersTest.lastSelectedFilter).toBeDefined();
  });
  test('If resetFiltersButton in class Filters is defined', () => {
    expect(filtersTest.resetFiltersButton).toBeDefined();
  });

});

describe('Standard Filter',()=>{
  const inputs = filtersTest.form.querySelectorAll('input[type=checkbox]');
  beforeAll(() => {
    eventFire(inputs[0], 'click');
  });

  test('checkbox filter must be checked  ', () => {
    const _newListFilters =document.querySelector(`.${CONSTANTS.FILTER_FORM_SELECTOR.FORM}`);
    const _filterSelected = _newListFilters.querySelector('input[value=Poteau]');
    expect(_filterSelected.checked).toEqual(true);
    expect(filtersTest.selectedFilters).toEqual({'type-de-produit':['Poteau']});

  });

  test('selected value must be changed and have values of filter', () => {
    expect(filtersTest.selectedFilters).toEqual({'type-de-produit': ['Poteau']});
  });


});

describe('Range filters', () => {
  const _rangeInputs = filtersTest.form.querySelectorAll(`input[type=number][class*='${CONSTANTS.RANGE_FILTERS.INPUT_SELECTOR}']`);
  const _applyRangeButton = filtersTest.form.querySelector(`.${CONSTANTS.RANGE_FILTERS.SUBMIT_SELECTOR}`);
  const _resetRangeButton = filtersTest.form.querySelector(`.${CONSTANTS.RANGE_FILTERS.RESET_SELECTOR}`);


  describe('Min range filter', () => {
    beforeAll(() => {
      eventFire(_rangeInputs[0], 'click');
      _rangeInputs[0].value = 0.1;
    });

    test('if value > to min default value ',()=>{
      eventFire(_rangeInputs[0], 'blur');
      expect(_rangeInputs[0].value).toEqual('0.7');
      expect(_applyRangeButton.classList.toString().indexOf('is-disabled')).not.toEqual(-1);
    });

    test('if value > to min default value the button is not disbaled',()=>{
      _rangeInputs[0].value = 11;
      eventFire(_rangeInputs[0], 'blur');
      expect(_applyRangeButton.classList.toString().indexOf('is-disabled')).toEqual(-1);
    });



  });

  describe('Max range filter',()=>{
    beforeAll(() => {
      eventFire(_rangeInputs[0], 'click');
      _rangeInputs[0].value = 10;
      eventFire(_rangeInputs[1], 'click');
      _rangeInputs[1].value = 99;
    });

    test('if value > to max default value button must be not disabled ',()=>{
      eventFire(_rangeInputs[1], 'blur');
      expect(_rangeInputs[1].value).toEqual('79.9');
      expect(_applyRangeButton.classList.toString().indexOf('is-disabled')).toEqual(-1);
    });


    test('if value < to max default value the button is not disbaled',()=>{
      _rangeInputs[1].value = 70;
      eventFire(_rangeInputs[1], 'blur');
      expect(_applyRangeButton.classList.toString().indexOf('is-disabled')).toEqual(-1);
    });


    test('if click on reset values',()=>{
      eventFire(_resetRangeButton, 'click');
      expect(_rangeInputs[1].value).toEqual('79.9');
      expect(_rangeInputs[0].value).toEqual('0.7');
      expect(_applyRangeButton.classList.toString().indexOf('is-disabled')).toEqual(-1);
    });

  });

});

describe('selected values have values',()=>{
  const _applyRangeButton = filtersTest.form.querySelector(`.${CONSTANTS.RANGE_FILTERS.SUBMIT_SELECTOR}`);

  beforeAll(() => {
    eventFire(_applyRangeButton,'click');
  });
  test('if selectedFilters have values',()=>{
    expect(filtersTest.selectedFilters).toEqual({'prix': '0.7~79.9','type-de-produit':['Poteau']});
  });
});

