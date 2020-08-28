import {Constants as CONSTANTS} from './constants.class';
import {hitEventCommandersAct} from '../../commons/_commandersact';

class Tracking {

  constructor(options) {
    this.options = options;
    this.trackingConfigObject = {};

    try {
      if(this.options.event === undefined || this.options.event === null) throw ('Paramètre Event est obligatoire!');
      this.eventTarget = this.options.event.target;
      this.track();
    }
    catch (err){
      console.error('Error : ', err);
    }

  }

  track() {
    _initTrackingConfig.call(this);
    hitEventCommandersAct(this.eventTarget, 'gaEvent', JSON.stringify(this.trackingConfigObject));
  }


}

export default Tracking;

function _initTrackingConfig() {

  this.trackingConfigObject.action = `${CONSTANTS.TRACKING_INFOS.UNIVERSE}/${CONSTANTS.TRACKING_INFOS.SUB_UNIVERSE}/${CONSTANTS.TRACKING_INFOS.FAMILY}/${CONSTANTS.TRACKING_INFOS.SUB_FAMILY}`;
  if(this.options.type === 'filter' || this.options.type === 'pedagogicalFilters' ){
    if(this.eventTarget.dataset.type && this.eventTarget.dataset.type === 'toggle'){
      this.trackingConfigObject.label = `${this.eventTarget.dataset.type  } - ${  this.eventTarget.dataset.category}`;
    }else{
      this.trackingConfigObject.label = this.eventTarget.dataset.category;
    }
    this.trackingConfigObject.parameters = {};
    this.trackingConfigObject.parameters['dimension20'] = (this.eventTarget.dataset.filterValue)?this.eventTarget.dataset.filterValue:this.eventTarget.value;
    this.trackingConfigObject.categorie = (this.eventTarget.checked) ? CONSTANTS.TRACKING_INFOS.CATEGORY_CHECKED : CONSTANTS.TRACKING_INFOS.CATEGORY_UNCHECKED;
  }
  if(this.options.type === 'sorting'){
    this.trackingConfigObject.label = this.eventTarget.options[this.eventTarget.selectedIndex].text;
    this.trackingConfigObject.categorie = `${CONSTANTS.TRACKING_INFOS.SORTING}`;
  }
  if(this.options.type === 'range'){
    const targetCategory = this.eventTarget.dataset.category;
    const inputsRange = document.querySelectorAll(`input[data-category=${targetCategory}]`);
    this.trackingConfigObject.parameters = {};
    this.trackingConfigObject.parameters['dimension20'] = `${inputsRange[0].value  } - ${  inputsRange[1].value}`;
    this.trackingConfigObject.label = targetCategory;
  }
}

