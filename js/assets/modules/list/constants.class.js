export class Constants {

  static get SORT() {
    return {
      'SELECTOR': 'js-select-sorting',
    };
  }
  static get FILTER_FORM_SELECTOR() {
    return {
      'FORM' :'js-form-filters',
      'RESET' : 'js-reset-filters'};
  }

  static get FILTER_SELECTOR_ACCORDION() {
    return {
      'ACCORDION': 'js-filters-accordion',
      'ACCORDION_PANEL': 'js-accordion__panel',
      'FILTER_PANEL': 'js-filter-panel'
    };
  }

  static get SHOWMORE_LINK() {
    return {
      'LIST_SELECTOR': '[id^="js-showMore-"]',
      'ELEM_LIST_FIELD':'.js-form-field-list li',
      'HIDE_ELEM_CLASS' : 'l-hide-element',
      'MORE':'Voir plus',
      'LESS':'Voir moins'
    };
  }

  static get RANGE_FILTERS (){
    return {
      'INPUT_SELECTOR':'js-range',
      'SUBMIT_SELECTOR':'js-rangeApply',
      'RESET_SELECTOR':'js-rangeReset'
    };
  }

  static get FILTERS_TYPES(){
    return {
      'STANDARD' : 'standard',
      'RANGE' : 'range',
      'TOGGLE' : 'toggle',
      'IMAGE':'image',
      'HIERARCHICAL':'hierarchical',
      'COLOR':'color'
    };
  }

  static get SELECTED_FILTERS(){
    return {
      'DELETE_SELECTOR': 'js-delete-filter',
      'RESET_SELECTOR': 'js-reset-selected-filters'
    };
  }

  static get POPIN_FILTERS() {
    return {
      'CONTAINER': 'js-contentPopinFilters',
      'OPEN_BUTTON': 'js-openPopinFilters',
      'CSS_FIXED': 'is-fixed'
    };
  }

  static get HIDDEN_CLASS(){
    return 'kl-hidden';
  }
  static get TRACKING_INFOS() {
    return {
      'UNIVERSE': (window.tc_vars.page_cat1_label) ? window.tc_vars.page_cat1_label : '',
      'SUB_UNIVERSE': (window.tc_vars.page_cat2_label) ? window.tc_vars.page_cat2_label : '',
      'FAMILY': (window.tc_vars.page_cat3_label) ? window.tc_vars.page_cat3_label : '',
      'SUB_FAMILY': (window.tc_vars.page_cat4_label) ? window.tc_vars.page_cat4_label : '',
      'CATEGORY_CHECKED': 'facette',
      'CATEGORY_UNCHECKED': 'désélection facette',
      'SORTING' : 'utilisation tri'
    };
  }

  static get FILTERS_TOOLTIP_MORE_INFO(){
    return {
      'SELECTOR': 'js-tooltip-'
    };
  }
}
