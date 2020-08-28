import {Constants} from '../constants.class';
window.tc_vars = {
  page_cat1_label: 'Electricité et domotique',
  page_cat2_label: 'Alarme maison, caméra de surveillance et détecteur de fumée',
  page_cat3_label: 'Extincteur',
  page_cat4_label: ''
};
describe('Constants class', () => {

  test('If Class Constants is defined', () => {
    expect(Constants).toBeDefined();
  });

});

describe('SORT constants : ', () => {

  test('If SORT selectors is an object', () => {
    expect(Constants.SORT).toBeInstanceOf(Object);
  });

  test('If SORT.SELECTOR have value js-select-sorting', () => {
    expect(Constants.SORT.SELECTOR).toEqual('js-select-sorting');
  });
});

describe('FILTER_FORM_SELECTOR constants : ', () => {

  test('If FILTER_FORM_SELECTOR is an object', () => {
    expect(Constants.FILTER_FORM_SELECTOR).toBeInstanceOf(Object);
  });

  test('If FILTER_FORM_SELECTOR.FORM  have value js-form-filters', () => {
    expect(Constants.FILTER_FORM_SELECTOR.FORM).toEqual('js-form-filters');
  });
  test('If FILTER_FORM_SELECTOR.RESET  have value js-reset-filters', () => {
    expect(Constants.FILTER_FORM_SELECTOR.RESET).toEqual('js-reset-filters');
  });
});

describe('FILTER_SELECTOR_ACCORDION constants : ', () => {

  test('If FILTER_SELECTOR_ACCORDION is an object', () => {
    expect(Constants.FILTER_SELECTOR_ACCORDION).toBeInstanceOf(Object);
  });


  test('If FILTER_SELECTOR_ACCORDION.ACCORDION  have value js-filters-accordion', () => {
    expect(Constants.FILTER_SELECTOR_ACCORDION.ACCORDION).toEqual('js-filters-accordion');
  });

  test('If FILTER_SELECTOR_ACCORDION.ACCORDION_PANEL  have value js-accordion__panel', () => {
    expect(Constants.FILTER_SELECTOR_ACCORDION.ACCORDION_PANEL).toEqual('js-accordion__panel');
  });

  test('If FILTER_SELECTOR_ACCORDION.FILTER_PANEL  have value js-filter-panel', () => {
    expect(Constants.FILTER_SELECTOR_ACCORDION.FILTER_PANEL).toEqual('js-filter-panel');
  });
});

describe('SHOWMORE_LINK constants : ', () => {

  test('If SHOWMORE_LINK is an object', () => {
    expect(Constants.SHOWMORE_LINK).toBeInstanceOf(Object);
  });

  test('If SHOWMORE_LINK.LIST_SELECTOR  have value [id^="js-showMore-"]', () => {
    expect(Constants.SHOWMORE_LINK.LIST_SELECTOR).toEqual('[id^="js-showMore-"]');
  });

  test('If SHOWMORE_LINK.ELEM_LIST_FIELD  have value .js-form-field-list li', () => {
    expect(Constants.SHOWMORE_LINK.ELEM_LIST_FIELD).toEqual('.js-form-field-list li');
  });

  test('If SHOWMORE_LINK.HIDE_ELEM_CLASS  have value l-hide-element', () => {
    expect(Constants.SHOWMORE_LINK.HIDE_ELEM_CLASS).toEqual('l-hide-element');
  });

  test('If SHOWMORE_LINK.MORE  have value Voir plus', () => {
    expect(Constants.SHOWMORE_LINK.MORE).toEqual('Voir plus');
  });

  test('If SHOWMORE_LINK.LESS  have value Voir moins', () => {
    expect(Constants.SHOWMORE_LINK.LESS).toEqual('Voir moins');
  });
});

describe('RANGE_FILTERS constants : ', () => {

  test('If RANGE_FILTERS is an object', () => {
    expect(Constants.RANGE_FILTERS).toBeInstanceOf(Object);
  });

  test('If RANGE_FILTERS.INPUT_SELECTOR  have value js-range', () => {
    expect(Constants.RANGE_FILTERS.INPUT_SELECTOR).toEqual('js-range');
  });

  test('If RANGE_FILTERS.SUBMIT_SELECTOR  have value js-rangeApply', () => {
    expect(Constants.RANGE_FILTERS.SUBMIT_SELECTOR).toEqual('js-rangeApply');
  });

  test('If RANGE_FILTERS.RESET_SELECTOR  have value js-rangeReset', () => {
    expect(Constants.RANGE_FILTERS.RESET_SELECTOR).toEqual('js-rangeReset');
  });


});

describe('FILTERS_TYPES constants : ', () => {

  test('If FILTERS_TYPES is an object', () => {
    expect(Constants.FILTERS_TYPES).toBeInstanceOf(Object);
  });

  test('If FILTERS_TYPES.STANDARD  have value standard', () => {
    expect(Constants.FILTERS_TYPES.STANDARD).toEqual('standard');
  });

  test('If FILTERS_TYPES.RANGE  have value range', () => {
    expect(Constants.FILTERS_TYPES.RANGE).toEqual('range');
  });

  test('If FILTERS_TYPES.TOGGLE  have value toggle', () => {
    expect(Constants.FILTERS_TYPES.TOGGLE).toEqual('toggle');
  });
  test('If FILTERS_TYPES.IMAGE  have value image', () => {
    expect(Constants.FILTERS_TYPES.IMAGE).toEqual('image');
  });
  test('If FILTERS_TYPES.HIERARCHICAL  have value HIERARCHICAL', () => {
    expect(Constants.FILTERS_TYPES.HIERARCHICAL).toEqual('hierarchical');
  });
  test('If FILTERS_TYPES.COLOR  have value COLOR', () => {
    expect(Constants.FILTERS_TYPES.COLOR).toEqual('color');
  });


});


describe('SELECTED_FILTERS constants : ', () => {

  test('If SELECTED_FILTERS is an object', () => {
    expect(Constants.SELECTED_FILTERS).toBeInstanceOf(Object);
  });

  test('If SELECTED_FILTERS.DELETE_SELECTOR  have value js-delete-filter', () => {
    expect(Constants.SELECTED_FILTERS.DELETE_SELECTOR).toEqual('js-delete-filter');
  });

  test('If SELECTED_FILTERS.RESET_SELECTOR  have value js-reset-selected-filters', () => {
    expect(Constants.SELECTED_FILTERS.RESET_SELECTOR).toEqual('js-reset-selected-filters');
  });


});

describe('POPIN_FILTERS constants : ', () => {

  test('If POPIN_FILTERS selectors is an object', () => {
    expect(Constants.POPIN_FILTERS).toBeInstanceOf(Object);
  });

  test('If SORT.SELECTOR have value js-contentPopinFilters', () => {
    expect(Constants.POPIN_FILTERS.CONTAINER).toEqual('js-contentPopinFilters');
  });
});

describe('HIDDEN_CLASS constants : ', () => {

  test('If HIDDEN_CLASS have value kl-hidden', () => {
    expect(Constants.HIDDEN_CLASS).toEqual('kl-hidden');
  });
});

describe('TRACKING_INFOS', () => {

  test('If TRACKING_INFOS is an object', () => {
    expect(Constants.TRACKING_INFOS).toBeInstanceOf(Object);
  });

  test('If TRACKING_INFOS.UNIVERSE have value ', () => {
    expect(Constants.TRACKING_INFOS.UNIVERSE).toEqual('Electricité et domotique');
  });

  test('If TRACKING_INFOS.SUB_UNVERSE have value ', () => {
    expect(Constants.TRACKING_INFOS.SUB_UNIVERSE).toEqual('Alarme maison, caméra de surveillance et détecteur de fumée');
  });

  test('If TRACKING_INFOS.FAMILY have value ', () => {
    expect(Constants.TRACKING_INFOS.FAMILY).toEqual('Extincteur');
  });

  test('If TRACKING_INFOS.SUB_FAMILY have value ', () => {
    expect(Constants.TRACKING_INFOS.SUB_FAMILY).toEqual('');
  });

  test('If TRACKING_INFOS.CATEGORY_CHECKED have value ', () => {
    expect(Constants.TRACKING_INFOS.CATEGORY_CHECKED).toEqual('facette');
  });

});

describe('FILTERS_TOOLTIP_MORE_INFO constants : ', () => {

  test('If FILTERS_TOOLTIP_MORE_INFO  is an object', () => {
    expect(Constants.FILTERS_TOOLTIP_MORE_INFO).toBeInstanceOf(Object);
  });

  test('If FILTERS_TOOLTIP_MORE_INFO.SELECTOR have value js-tooltip-', () => {
    expect(Constants.FILTERS_TOOLTIP_MORE_INFO.SELECTOR).toEqual('js-tooltip-');
  });
});
