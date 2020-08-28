'use strict';
/**
 * prmObjHour
 * element : string that contains the class/id of the DOM element we want to attach this module, need to be a HTML select
 * hour : object that contains start, end attributes
 * minuteInterval : number that contains the minute interval we want between each hour
 * onValueUpdate : function to be executed on change event
 */

class HourPicker {
  constructor(prmObjHour) {
    this.parameters = prmObjHour;
    this.hourPicker = this.createHourSelector();
    if (this.parameters.onValueUpdate !== null) {
      this.onValueUpdateSelect();
    }
  }

  createHourOption(prmHour, prmMinute, prmSelect) {
    const option = document.createElement('option');
    const hourString = `${(`0${  prmHour}`).slice(-2)}:${(`0${  prmMinute}`).slice(-2)}`;
    option.value = hourString;

    if (this.parameters.showInterval) {
      const date = `1970-01-01T${hourString}.000Z`;
      const dateSplit = date.split(/[^0-9]/);
      const hour = new Date(dateSplit[0], dateSplit[1] - 1, dateSplit[2], dateSplit[3], dateSplit[4], dateSplit[5]);

      hour.setTime(hour.getTime() + this.parameters.minuteInterval * 60 * 1000);
      option.innerHTML = `${hourString  } - ${(`0${  hour.getHours()}`).slice(-2)}:${(`0${  hour.getMinutes()}`).slice(-2)}`;
    } else {
      option.innerHTML = hourString;
    }

    try {
      prmSelect.appendChild(option);
    } catch (error) {
      console.error(`Can't append option element on ${this.parameters.element} ${error}`);
    }
  }

  createHourSelector() {
    const select = document.querySelector(this.parameters.element);
    this.removeOldHourOptions();

    const start = `1970-01-01T${this.parameters.hour.start}.000Z`;
    const startSplit = start.split(/[^0-9]/);
    const hourStart = new Date(startSplit[0], startSplit[1] - 1, startSplit[2], startSplit[3], startSplit[4], startSplit[5]);

    const end = `1970-01-01T${this.parameters.hour.end}.000Z`;
    const endSplit = end.split(/[^0-9]/);
    const hourEnd = new Date(endSplit[0], endSplit[1] - 1, endSplit[2], endSplit[3], endSplit[4], endSplit[5]);

    if (this.parameters.askForChoice) {
      select.insertAdjacentHTML('afterbegin', '<option value="choice" disabled>Choississez une heure</option>');
    }

    while (hourStart <= hourEnd) {
      this.createHourOption(hourStart.getHours(), hourStart.getMinutes(), select);
      hourStart.setTime(hourStart.getTime() + this.parameters.minuteInterval * 60 * 1000);
    }

    if (this.parameters.askForChoice) {
      select.value = 'choice';
    }

    return select;
  }

  removeOldHourOptions() {
    const select = document.querySelector(this.parameters.element);
    for (let i = select.options.length - 1; i >= 0; i--) {
      select.remove(i);
    }
  }

  onValueUpdateSelect() {
    const select = document.querySelector(this.parameters.element);
    select.addEventListener('change', this.parameters.onValueUpdate);
  }

  get hourValue() {
    return this.hourPicker[this.hourPicker.selectedIndex].value;
  }

  set hourValue(value) {
    this.hourPicker.value = value;
  }
}

export default HourPicker;
