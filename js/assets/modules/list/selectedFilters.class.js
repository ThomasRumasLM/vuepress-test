import StoreFilters from './storeFilters.class';
import {Constants as CONSTANTS} from './constants.class';
import Tracking from './tracking.class';

class SelectedFilters extends StoreFilters {

  constructor(config) {
    super(config);
    try {
      if (config.event === undefined || config.event === null) throw 'CLass SelectedFilters need event in parameters';
      this.selectedFiltersElts = document.querySelectorAll(`.${CONSTANTS.SELECTED_FILTERS.DELETE_SELECTOR}`);
      this.selectedFilters = {};
      this.resetButton = null;
      _initEvents.call(this);
      _getSelectedFiltersValues.call(this);

    }catch(err){
      // eslint-disable-next-line no-console
      console.log('Error class SelectedFilters', err);
    }

  }
}

export default SelectedFilters;

/**
 * get all values of selected filters
 * @private
 */

function _getSelectedFiltersValues(){
  if(this.selectedFiltersElts.length > 0){
    this.selectedFilters = Array.from(this.selectedFiltersElts).reduce((values,value)=>{

      const {filterValue, filterCode, filterType} = value.dataset;
      if (values[filterCode] === undefined) {
        values[filterCode] = [];
      }

      if(filterType === CONSTANTS.FILTERS_TYPES.RANGE){
        values[filterCode] = filterValue;
      }else{
        values[filterCode].push(filterValue);
      }

      return values;
    },{});
  }
}

/**
 * inti all of event of composant selected filters (tags and reset button)
 * @private
 */
function _initEvents() {
  if(this.selectedFiltersElts.length > 0) {
    //init delete buttons events
    this.selectedFilters = Array.from(this.selectedFiltersElts).map((_button) => {
      _button.addEventListener('click', _deleteFilter.bind(this));
    });
    // init reset button event
    this.resetButton = document.querySelector(`.${CONSTANTS.SELECTED_FILTERS.RESET_SELECTOR}`);
    this.resetButton.addEventListener('click', _resetFilters.bind(this));
  }
}

/**
 * delete one clicked filter and dispatch event
 * @param evt
 * @private
 */
function _deleteFilter(evt) {
  const {filterValue,filterType,filterCode} = evt.target.dataset;

  if (filterType === CONSTANTS.FILTERS_TYPES.STANDARD || filterType === CONSTANTS.FILTERS_TYPES.IMAGE || filterType === CONSTANTS.FILTERS_TYPES.TOGGLE || filterType === CONSTANTS.FILTERS_TYPES.HIERARCHICAL || filterType === CONSTANTS.FILTERS_TYPES.COLOR) {

    for(const value of this.selectedFilters[filterCode]){
      if (value === filterValue) {
        const index = this.selectedFilters[filterCode].indexOf(value);
        this.selectedFilters[filterCode].splice(index, 1);
      }
    }

    if (this.selectedFilters[filterCode].length === 0) {
      delete this.selectedFilters[filterCode];
    }
  }
  if (filterType === CONSTANTS.FILTERS_TYPES.RANGE) {
    delete this.selectedFilters[`${filterCode}`];
  }
  this.dispatch({action:'filter',params:{'lastSelectedFilter': filterCode},filters:this.format(this.selectedFilters)});
  new Tracking({event: evt, type: 'filter'});
}

/**
 * reset and delete all filters values
 * @private
 */
function _resetFilters() {
  this.selectedFilters = {};
  window.history.pushState({}, window.tc_vars.page_name, window.location.pathname);
  this.dispatch({'action':'filter',filters:this.format(this.selectedFilters)});
}

