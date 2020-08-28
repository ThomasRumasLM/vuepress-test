export const localStorageLM = {

  init : (LMDataKey = 'LMData') => {
    setTimeout(() => {
      // Not before onload, can block UI
      if(!available('localStorage')){
        return 'storage not available';
      }

      if(!storageKeyExist('LMData')){
        localStorageLM.preset(LMDataKey);
      }else{
        const LMData = getDataObject(LMDataKey);
        clean(LMData);
      }
    }, 0);
  },

  preset : (LMDataKey = 'LMData') => {
    if(!available('localStorage')){
      if( !lm.cookie.get(`${LMDataKey}localStorage`) ) {
        lm.cookie.set(`${LMDataKey}localStorage`, JSON.stringify( {} ) );
      }
      if( !lm.cookie.get(`${LMDataKey}sessionStorage`) ) {
        lm.cookie.set(`${LMDataKey}sessionStorage`, JSON.stringify( {} ) );
      }
      return;
    }

    if(!window['localStorage'].getItem(LMDataKey)){
      window.localStorage[LMDataKey] = JSON.stringify( {} );
    }
    if(!window['sessionStorage'].getItem(LMDataKey)){
      window.sessionStorage[LMDataKey] = JSON.stringify( {} );
    }
  },

  get : (key, type = 'localStorage', LMDataKey = 'LMData') => {
    const LMDataValue = getDataObject(LMDataKey);

    if( LMDataValue[type] && LMDataValue[type][key] ) {
      return LMDataValue[type][key].data;
    }
    if(window.DEBUG){
      console.warn(`Key "${key}" don't exist in "${type}"`);
    }
    return '';
  },

  set : (key, value, expire = 1, type = 'localStorage', LMDataKey = 'LMData') => {
  // Set or update data by key, define or update expire date
  // expire date (object) or day number (number)
    if( typeof value !== 'object' && typeof value !== 'string' ) {
      console.error(`L'objet "${key}" passé en paramètre est invalide`);
      return false;
    }
    if(!available('localStorage') && value.length > 2000){
    // If localStorage unavailable, we use a cookie => size must be limited
      console.error(`L'objet "${key}" passé en paramètre est trop volumineux`);
      return false;
    }

    const LMDataValue = getDataObject(LMDataKey);
    LMDataValue[type][key] = { 'expire': expireIn(expire), 'data': value };
    writeInStorage(type, LMDataValue, LMDataKey);
    return LMDataValue[type][key];
  },

  delete : (key, type = 'localStorage', LMDataKey = 'LMData') => {
    const LMDataValue = getDataObject(LMDataKey);

    if(LMDataValue[type][key]){
      delete LMDataValue[type][key];
      writeInStorage(type, LMDataValue, LMDataKey);
    }

    return LMDataValue;
  },

  exist : (key, type = 'localStorage', LMDataKey = 'LMData') => {
    const LMDataValue = getDataObject(LMDataKey);
    if( LMDataValue[type] ) {
      return typeof LMDataValue[type][key] !== 'undefined';
    }
    return false;
  },

  getExpireDate: (key, type = 'localStorage', LMDataKey = 'LMData') => {
    const LMDataValue = getDataObject(LMDataKey);
    if( LMDataValue[type] && LMDataValue[type][key] ) {
      return LMDataValue[type][key].expire;
    }
  }

};

const now = new Date().getTime();
const expireIn = (days) => {
  // get a day number, return a timestamp
  const then = now+(days*24*60*60*1000);
  return then;
};

const writeInStorage = (type, LMData, LMDataKey = 'LMData') => {
  // if no LocalStorage
  if(!available('localStorage')){
    // write in cookie
    lm.cookie.set(LMDataKey+type, JSON.stringify(LMData[type]) );
    return;
  }

  window[type].setItem(LMDataKey, JSON.stringify( LMData[type]));
};

const getDataObject = (LMDataKey = 'LMData') => {
  const LMDataValue = {};

  // if no LocalStorage
  if(!available('localStorage')){
    // set variable from cookie session
    LMDataValue.localStorage = JSON.parse( lm.cookie.get( `${LMDataKey}localStorage`) ) || {};
    LMDataValue.sessionStorage = JSON.parse( lm.cookie.get( `${LMDataKey}sessionStorage`) ) || {};
    return LMDataValue;
  }
  LMDataValue.localStorage = JSON.parse(  window['localStorage'].getItem( LMDataKey ) ) || {};
  LMDataValue.sessionStorage = JSON.parse(  window['sessionStorage'].getItem( LMDataKey ) ) || {};
  return LMDataValue;
};

const storageKeyExist = (LMDataKey = 'LMData') => {
  if(!window['localStorage'].getItem(LMDataKey) && !window['sessionStorage'].getItem(LMDataKey)){
    return false;
  }else{
    return true;
  }
};

const available = (type) => {
  try {
    const storage = window[type],
      x = '__storage_test__';
    storage.setItem(x, x);
    storage.removeItem(x);
    return true;
  }
  catch(e) {
    return false;
  }
};

const clean = (LMDataKey) => {
  // Loop true data and delete expired data
  Object.keys(LMDataKey).forEach(
    (dataPlace) => {
      Object.keys(LMDataKey[dataPlace]).forEach(
        (item) => {
          if(now > LMDataKey[dataPlace][item].expire) {
            localStorageLM.delete(item, dataPlace);
          }
        }
      );
    }
  );
};

localStorageLM.init();
