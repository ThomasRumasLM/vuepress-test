import StoreFilters from './storeFilters.class';
import Accordion from '../_accordion';
import {Constants as CONSTANTS} from './constants.class';
import Showmore from '../_showmore.js';
import Tracking from './tracking.class';
import {Tooltip} from '../_tooltip.class';


class Filters extends StoreFilters {
  constructor(config) {
    super(config);
    try {
      if (config.event === undefined || config.event === null) throw 'CLass Filters need event in parameters';
      this.config = config;
      this.form = document.querySelector(`.${CONSTANTS.FILTER_FORM_SELECTOR.FORM}`);
      this.selectedFilters = {};
      this.lastSelectedFilter = (config.lastSelectedFilter !== undefined) ? config.lastSelectedFilter : null;
      this.resetFiltersButton = document.querySelector(`.${CONSTANTS.FILTER_FORM_SELECTOR.RESET}`);
      this.initEvents();
      _initAccordion.call(this);
      _initShowMore();
      _initToolTip();
    } catch (err) {
      // eslint-disable-next-line no-console
      console.log('Error class Filters', err);
    }

  }

  /**
   * intialize all events of filters (checkbox , toggle , input etc...)
   */
  initEvents() {
    _initCheckboxEvents.call(this);
    _initRangeEvents.call(this);
    _initResetEvent.call(this);

  }

}

export default Filters;

/**
 * initalize event of reset filter on popin in mobile version
 * @private
 */
function _initResetEvent() {

  if (Object.keys(this.selectedFilters).length > 0) {
    this.resetFiltersButton.classList.remove(`${CONSTANTS.HIDDEN_CLASS}`);
    if (this.resetFiltersButton.dataset.event === 'false') {
      this.resetFiltersButton.dataset.event = 'true';
      this.resetFiltersButton.addEventListener('click', _resetFilters.bind(this), {once: true, capture: true});
    }
  } else {
    this.resetFiltersButton.classList.add(`${CONSTANTS.HIDDEN_CLASS}`);
    this.resetFiltersButton.dataset.event = 'false';
  }

}

/**
 * dispatch event on clicked in button reset filters
 * @private
 */
function _resetFilters() {

  this.selectedFilters = {};
  window.history.pushState({}, window.tc_vars.page_name, window.location.pathname);
  this.dispatch({action: 'filter', filters: this.format(this.selectedFilters)});
}

/**
 * init all events for standard and toggle filters
 * @private
 */
function _initCheckboxEvents() {
  const _checkBoxInputs = this.form.querySelectorAll('input[type=checkbox]');
  if (_checkBoxInputs.length > 0) {
    for (let i = 0; i < _checkBoxInputs.length; i++) {
      _checkBoxInputs[i].addEventListener('change', _transformValues.bind(this));
      if (_checkBoxInputs[i].checked) {
        _getFiltersValues.call(this, _checkBoxInputs[i]);
      }
    }
  }
}

/**
 * init all events for all range filters
 * @private
 */
function _initRangeEvents() {

  const _rangeElts = this.form.querySelectorAll(`[class*='${CONSTANTS.RANGE_FILTERS.INPUT_SELECTOR}']`);

  if (_rangeElts.length > 0) {
    const _rangeInputs = Array.from(_rangeElts);

    const _allRangesFilters = _rangeInputs.reduce((_inputs, _value) => {

      if (!Array.isArray(_inputs)) _inputs = [];
      if (_inputs[_value.dataset.category] === undefined) {
        _inputs[_value.dataset.category] = [];
      }
      _inputs[_value.dataset.category].push(_value);
      return _inputs;
    }, 0);

    for (const _category in _allRangesFilters) {
      const _rangeMinInput = _allRangesFilters[_category][0];
      const _rangeMaxInput = _allRangesFilters[_category][1];
      const _resetRangeButton = _allRangesFilters[_category][2];
      const _submitRangeButton = _allRangesFilters[_category][3];
      const _defaultMin = parseFloat(_rangeMinInput.getAttribute('min'));
      const _defaultMax = parseFloat(_rangeMaxInput.getAttribute('max'));
      const _minApplied = parseFloat(_rangeMinInput.dataset.minApplied);
      const _maxApplied = parseFloat(_rangeMaxInput.dataset.maxApplied);
      if (parseFloat(_rangeMinInput.value) !== _defaultMin || parseFloat(_rangeMaxInput.value) !== _defaultMax) {
        this.selectedFilters[_submitRangeButton.dataset.category] = `${_rangeMinInput.value}~${_rangeMaxInput.value}`;
      }

      const _rangeInputsNumber = _allRangesFilters[_category].filter((_input) => (_input.getAttribute('type') === 'number'));
      _rangeInputsNumber.map((input) => {

        input.addEventListener('blur', function (evt) {

          if ((evt.target.value === '' || parseFloat(evt.target.value) < _defaultMin) && evt.target.getAttribute('min') !== null) {
            evt.target.value = (_defaultMin !== _minApplied) ? _minApplied : _defaultMin;
          }

          if ((evt.target.value === '' || parseFloat(evt.target.value) > _defaultMax ) && evt.target.getAttribute('max') !== null ) {
            evt.target.value =(_defaultMax !== _maxApplied) ? _maxApplied :  _defaultMax;
          }

          if (parseFloat(evt.target.value) > parseFloat(_rangeMaxInput.value)) {
            evt.target.value = parseFloat(_rangeMaxInput.value) - 1;
          }

          if (parseFloat(evt.target.value) < parseFloat(_rangeMinInput.value)) {
            evt.target.value = parseFloat(_rangeMinInput.value) + 1;
          }

          _enabledSubmitRangeButton(_submitRangeButton, !(parseFloat(_rangeMinInput.value) === _minApplied && parseFloat(_rangeMaxInput.value) === _maxApplied));

        });

        input.addEventListener('input', function (evt) {
          if (parseFloat(evt.target.value) > _defaultMin && parseFloat(evt.target.value) < _defaultMax) {
            _enabledSubmitRangeButton(_submitRangeButton);
          }
        });

      });

      _submitRangeButton.addEventListener('click', _transformValues.bind(this));
      _resetRangeButton.addEventListener('click', _resetRange.bind(this));

    }

  }

}


/**
 * transform all values of diffrents types of filters
 *  example {code1 : [filter1,filter2,filter3],code2:[filter1etc...]}
 * and dispatch event with all values selected
 * @param evt
 */

function _transformValues(evt) {
  const {type} = evt.target.dataset;
  const _typeFilter = (type === CONSTANTS.FILTERS_TYPES.STANDARD || type === CONSTANTS.FILTERS_TYPES.TOGGLE || type === CONSTANTS.FILTERS_TYPES.IMAGE || type === CONSTANTS.FILTERS_TYPES.COLOR) ? CONSTANTS.FILTERS_TYPES.STANDARD : type;

  try {
    eval(`_transform${_typeFilter.charAt(0).toUpperCase()}${_typeFilter.slice(1)}Values`).bind(this)(evt);
    this.dispatch({
      action: 'filter',
      params: {'lastSelectedFilter': this.lastSelectedFilter},
      filters: this.format(this.selectedFilters)
    });
  } catch (err) {
    // eslint-disable-next-line no-console
    console.log('Error type not be transformed', err);
  }

}

/**
 * transform all range filters values
 * @param evt
 * @private
 */
//eslint-disable-next-line
function _transformRangeValues(evt) {
  this.lastSelectedFilter = lm.getClosest(evt.target, `.${CONSTANTS.FILTER_SELECTOR_ACCORDION.FILTER_PANEL}`).querySelector(`.${CONSTANTS.FILTER_SELECTOR_ACCORDION.ACCORDION_PANEL}`).dataset.categoryCode;
  const _rangeValues = this.form.querySelectorAll(`input[type=number][data-category=${evt.target.dataset.category}]`);
  this.selectedFilters[evt.target.dataset.category] = `${_rangeValues[0].value}~${_rangeValues[1].value}`;
  new Tracking({event: evt, type: 'range'});
}

/**
 * transform all standard and toggle filters values
 * @param evt
 * @private
 */
//eslint-disable-next-line
function _transformStandardValues(evt) {
  const {name, checked, value} = evt.target;
  this.lastSelectedFilter = (evt.target.dataset.type === CONSTANTS.FILTERS_TYPES.STANDARD || evt.target.dataset.type === CONSTANTS.FILTERS_TYPES.IMAGE || evt.target.dataset.type === CONSTANTS.FILTERS_TYPES.COLOR) ? lm.getClosest(evt.target, `.${CONSTANTS.FILTER_SELECTOR_ACCORDION.FILTER_PANEL}`).querySelector(`.${CONSTANTS.FILTER_SELECTOR_ACCORDION.ACCORDION_PANEL}`).dataset.categoryCode : null;
  this.selectedFilters[name] = (!Object.prototype.hasOwnProperty.call(this.selectedFilters, name)) ? [] : this.selectedFilters[name];
  if (checked) {
    this.selectedFilters[name].push(value);
  } else {
    this.selectedFilters[name] = this.selectedFilters[name].filter(item => item !== value);
  }

  if (this.selectedFilters[name].length === 0) {
    delete this.selectedFilters[name];
  }
  new Tracking({event: evt, type: 'filter'});
}

/**
 * get all values of checked filters on relaod page
 * @param element
 * @private
 */
function _getFiltersValues(element) {
  const {type} = element.dataset;
  if (type === CONSTANTS.FILTERS_TYPES.STANDARD || type === CONSTANTS.FILTERS_TYPES.TOGGLE || type === CONSTANTS.FILTERS_TYPES.IMAGE || type === CONSTANTS.FILTERS_TYPES.COLOR) {
    const {name, value} = element;
    this.selectedFilters[name] = (!Object.prototype.hasOwnProperty.call(this.selectedFilters, name)) ? [] : this.selectedFilters[name];
    if (this.selectedFilters[name].indexOf(value) === -1) {
      this.selectedFilters[name].push(value);
    }
  }


}


/**
 * init collapse filters
 * @private
 */
function _initAccordion() {

  const _configAccordion = {
    'id': CONSTANTS.FILTER_SELECTOR_ACCORDION.ACCORDION,
    'defaultOpen': ['1', '2'],
    'mode': 'open'
  };

  if (this.lastSelectedFilter !== null) {
    const lastPanelElt = this.form.querySelector(`[data-category-code = ${this.lastSelectedFilter}]`);
    if (lastPanelElt !== null) {
      const {panel, filtersType} = lastPanelElt.dataset;
      let haveOtherValues = null;
      const _typeFilter = (filtersType === CONSTANTS.FILTERS_TYPES.STANDARD || filtersType === CONSTANTS.FILTERS_TYPES.IMAGE || filtersType === CONSTANTS.FILTERS_TYPES.COLOR) ? CONSTANTS.FILTERS_TYPES.STANDARD : filtersType;
      switch (_typeFilter) {
      case `${CONSTANTS.FILTERS_TYPES.STANDARD}`:
        haveOtherValues = lastPanelElt.querySelectorAll('input[type=checkbox]:checked').length > 0;
        break;
      case `${CONSTANTS.FILTERS_TYPES.RANGE}`:
        haveOtherValues = [...lastPanelElt.querySelectorAll(`input[type=number][class*='${CONSTANTS.RANGE_FILTERS.INPUT_SELECTOR}']`)].filter(item => item.dataset.valueChanged === 'true');
        break;
      }

      if (_configAccordion['defaultOpen'].indexOf(panel) !== -1 && !haveOtherValues) {
        _configAccordion['defaultOpen'] = [...new Set([..._configAccordion['defaultOpen'].filter(item => (item !== panel)), ..._configAccordion['defaultOpen']])];
      }

      if (_configAccordion['defaultOpen'].indexOf(panel) === -1 && haveOtherValues) {
        _configAccordion['defaultOpen'].push(panel);
      }

    }


  }

  new Accordion(_configAccordion);
}


/**
 * Init Showmore "Voir plus" in filters
 * @private
 */
function _initShowMore() {
  const selectorJsShowMore = CONSTANTS.SHOWMORE_LINK.LIST_SELECTOR;
  const classFormFieldList = CONSTANTS.SHOWMORE_LINK.ELEM_LIST_FIELD;
  const textShowMore = CONSTANTS.SHOWMORE_LINK.MORE;
  const textShowLess = CONSTANTS.SHOWMORE_LINK.LESS;
  const popinFiltersClass = CONSTANTS.POPIN_FILTERS.CONTAINER;
  const hideElementClass = CONSTANTS.SHOWMORE_LINK.HIDE_ELEM_CLASS;

  const popinFilters = document.querySelector(`.${popinFiltersClass}`);
  const isElementHidden = window.getComputedStyle(popinFilters)['display'] === 'none';
  const _showMoreFiltersPanel = document.querySelectorAll(`${selectorJsShowMore}`);
  const _haveNbFilterToDisplay = Array.from(_showMoreFiltersPanel).filter((ele)=>{
    return ele.dataset.nbFiltersToDisplay !== '';
  }).length > 0;

  if(_haveNbFilterToDisplay) {
    if (isElementHidden) {
      popinFilters.classList.add(`${hideElementClass}`);
    }

    for (let i = 0; i < _showMoreFiltersPanel.length; i++) {

      const showMoreFiltersPanel = _showMoreFiltersPanel[i];
      const _showMoreFilterPanelId = showMoreFiltersPanel.id;
      const _nbFiltersToDisplay = showMoreFiltersPanel.dataset.nbFiltersToDisplay;

      /* Calculate heigth of li */
      let _heightListToDisplay = 0;
      const _listFilterPanel = showMoreFiltersPanel.querySelectorAll(`${classFormFieldList}:nth-child(-n+${_nbFiltersToDisplay})`);
      for (let i = 0; i < _listFilterPanel.length; i++) {
        const element = _listFilterPanel[i];
        let elementHeight = element.getBoundingClientRect().height;
        const elementStyle = window.getComputedStyle(element);

        elementHeight = ['top', 'bottom']
          .map(function (side) {
            return parseInt(elementStyle[`margin-${side}`], 10);
          })
          .reduce(function (total, side) {
            return total + side;
          }, elementHeight);

        _heightListToDisplay = _heightListToDisplay + elementHeight;
      }

      const _remHeight = `${_heightListToDisplay / Math.round(parseFloat(getComputedStyle(document.documentElement).fontSize)) }rem`;

      const optionShowMoreFilters = {
        id: _showMoreFilterPanelId,
        label: {
          more: textShowMore,
          less: textShowLess
        },
        initialHeight: `${_remHeight}`
      };

      /* Calculate if "show more" needs to be displayed */
      const _totalFilters = _showMoreFiltersPanel[i].querySelectorAll(`${classFormFieldList}`).length;
      if (_totalFilters > _nbFiltersToDisplay) {
        new Showmore(optionShowMoreFilters);
      }
    }
    if (isElementHidden) {
      popinFilters.classList.remove(`${hideElementClass}`);
    }

  }

}

/**
 * initialize tooltip for filter
 * @private
 */
function _initToolTip() {
  const listTooltipSelector = CONSTANTS.FILTERS_TOOLTIP_MORE_INFO.SELECTOR;
  const _tooltipsInfo = document.querySelectorAll(`[class*="${listTooltipSelector}"]`);
  if (_tooltipsInfo.length > 0) {
    for (let i = 0; i < _tooltipsInfo.length; i++) {
      const _tooltipClasses = _tooltipsInfo[i].classList;
      for (let j = 0; j < _tooltipClasses.length; j++) {
        if (_tooltipClasses[j].indexOf(`${listTooltipSelector}`) === 0) {
          new Tooltip({element: `.${_tooltipClasses[j]}`});
        }
      }
    }
  }
}

/**
 * enable and disable button
 * @param _button
 * @param action
 * @private
 */

function _enabledSubmitRangeButton(_button, action = true) {

  if (action) {
    _button.classList.remove('is-disabled');
  } else {
    _button.classList.add('is-disabled');
  }
  _button.disabled = !action;

}

/**
 * reset value of range filters
 * @param evt
 * @private
 */
function _resetRange(evt) {
  const _rangeValues = this.form.querySelectorAll(`input[type=number][data-category=${evt.target.dataset.category}]`);
  const _rangeMin = _rangeValues[0];
  const _rangeMax = _rangeValues[1];
  const _isValuesChanged = ((_rangeMin.value !== _rangeMin.getAttribute('min')) || (_rangeMax.value !== _rangeMax.getAttribute('max')));
  if (_isValuesChanged) {
    _rangeMin.value = parseFloat(_rangeMin.getAttribute('min'));
    _rangeMax.value = parseFloat(_rangeMax.getAttribute('max'));
    delete this.selectedFilters[evt.target.dataset.category];
    this.dispatch({
      action: 'filter',
      'lastSelectedFilter': this.lastSelectedFilter,
      filters: this.format(this.selectedFilters)
    });

  }

}
