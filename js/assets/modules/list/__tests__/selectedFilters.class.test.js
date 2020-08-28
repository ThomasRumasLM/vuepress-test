import SelectedFilters from '../selectedFilters.class';

window.tc_vars = {
  page_name: 'Piquet et accessoires de grillage',
};
window.location = {
  pathname:''
};
document.body.innerHTML = `<div class="km-selected-filters kl-hidden kl-visible@from-xl">
<p class="km-selected-filters__title">Vos filtres :</p>
<ul>
   <li class="km-selected-filters__elements">
       <button class="ka-tag ka-tag--icon-right ka-tag--icon-right-medium js-delete-filter" data-filter-value="Poteau" data-filter-type="standard" data-filter-code="type-de-produit">Poteau
       </button>
   </li>
   <li class="km-selected-filters__elements">
       <button class="ka-tag ka-tag--icon-right ka-tag--icon-right-medium js-delete-filter" data-filter-value="Acier galvanisé" data-filter-type="standard" data-filter-code="matiere">Acier galvanisé
       </button>
   </li>
   <li class="km-selected-filters__elements">
       <button class="ka-tag ka-tag--icon-right ka-tag--icon-right-medium js-delete-filter" data-filter-value="20~39.9" data-filter-type="range" data-filter-code="prices">20 € - 39.9 €
       </button>
   </li>
   <li class="km-selected-filters__reset">
   <button class="mc-link mc-link--s  js-reset-selected-filters">Réinitialiser</button>
                </li>
            </ul>
        </div>`;
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
  }
};


const selectedFiltersTest = new SelectedFilters(config);

describe('Class SelectedFilters', () => {

  test('If Class SelectedFilters is defined', () => {
    expect(selectedFiltersTest).toBeDefined();

  });
  test('If instance selectedFiltersTest is instance of SelectedFilters', () => {
    expect(selectedFiltersTest).toBeInstanceOf(SelectedFilters);

  });
  test('If Class SelectedFilters event is defined', () => {
    expect(selectedFiltersTest.event).toBeInstanceOf(Object);
  });

  test('If selectedFiltersElts in class SelectedFilters is defined', () => {
    expect(selectedFiltersTest.selectedFiltersElts).toBeDefined();
  });

  test('If selectedFilters in class SelectedFilters is defined', () => {
    expect(selectedFiltersTest.selectedFiltersElts).toBeDefined();
  });
  test('If resetButton in class SelectedFilters is defined', () => {
    expect(selectedFiltersTest.resetButton).toBeDefined();
  });

});


describe('SelectedFilters values', () => {

  test('if selectedFilters have values', () => {
    expect(selectedFiltersTest.selectedFilters).toEqual({
      'matiere': ['Acier galvanisé'], 'prices': '20~39.9', 'type-de-produit': [
        'Poteau']
    });
  });

  test('delete element from selectedFilters',()=>{
    eventFire(selectedFiltersTest.selectedFiltersElts[0],'click');
    expect(selectedFiltersTest.selectedFilters).toEqual({
      'matiere': ['Acier galvanisé'], 'prices': '20~39.9'});
  });

  test('reset all selectedFilters',()=>{
    eventFire(selectedFiltersTest.resetButton,'click');
    expect(selectedFiltersTest.selectedFilters).toEqual({});

  });


});



