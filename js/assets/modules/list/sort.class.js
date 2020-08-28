import StoreFilters from './storeFilters.class';
import {Constants as CONSTANTS} from './constants.class';
import Tracking from './tracking.class';

class Sort extends StoreFilters {

  constructor(config) {
    super(config);
    try {
      if (config.event === undefined || config.event === null) throw 'CLass Sort need event in parameters';
      this.sortingElement = null;
      this.sortingElementPosition = null;
      this.initEvent();
    }catch (err){
      // eslint-disable-next-line no-console
      console.log('Error class Sort', err);
    }

  }

  /**
   * init event of select of sorting
   */
  initEvent() {
    this.sortingElement = document.querySelector(`.${CONSTANTS.SORT.SELECTOR}`);
    this.sortingElementPosition = (this.sortingElement.getBoundingClientRect().top + window.scrollY - 30);
    this.sortingElement.addEventListener('change', _sorting.bind(this));
  }

}


export default Sort;

function _sorting(evt) {
  this.dispatch({action:'sort',filters:{'sorting':evt.target.value}});
  new Tracking({event:evt,type:'sorting'});
}
