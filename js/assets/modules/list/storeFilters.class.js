class StoreFilters {

  constructor(config) {
    try {
      if (config.event === undefined || config.event === null) throw 'CLass StoreFilters need event in parameters';
      this.event = config.event;
    } catch (err) {
      // eslint-disable-next-line no-console
      console.log('Error class StoreFilters', err);
    }
  }

  /**
   * format all values of filters for dispatching
   * @param values
   * @returns {{}}
   */
  format(values) {
    const _data = {};
    const _responseObj = {};
    const _haveValues = Object.keys(values).length > 0;

    if (_haveValues) {

      for (const _value in values) {
        if (Array.isArray(values[_value])) {
          _data[`${_value}`] = `${values[_value].join('#|')}`;
        } else {
          _data[`${_value}`] = `${values[_value]}`;
        }
      }


      //replace caracter "," with "#" and delete all "{}"
      _responseObj['applieds'] = JSON.stringify(_data);
    }
    return _responseObj;
  }

  /**
   * dispatch data in store
   * @param details example {
   * action : 'filter' || 'sort' || 'paginate',
   * params : {param1 : value, params2 : value2 ..}
   * filters : object of selected filters
   * }
   */
  dispatch(details = {}) {

    try {
      if (details.action === undefined || details.action === null) throw 'Method dispatch need action in parameters';
      const  data = {};
      data[this.event.dataKey] = details.filters;
      const detailsEvent = {action: details.action, ...details.params,...data};
      this.event.target(detailsEvent);
    } catch (err) {
      // eslint-disable-next-line no-console
      console.log('Error Method Dispatch', err);
    }


  }
}

export default StoreFilters;

