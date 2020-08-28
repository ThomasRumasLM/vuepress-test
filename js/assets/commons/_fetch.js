export const lmFetch = ( options = {} ) => {

  try {
    if( !options.url ) {
      throw new Error('Le param \'url\' est obligatoire : Ex : {url: \'https://www.leroymerlin.fr\'}');
    }

    // Data object for fetch call
    const opt = {
      method: 'GET',
      headers: {
        'Content-Type': 'text/html',
        'Cache': 'no-cache'
      },
      credentials: 'same-origin'
    };
    for(const k in options) {
      if( k !== 'url' && k !== 'callback' && k !== 'data' ) { opt[k] = options[k]; }
    }

    // callback functions
    const callback = {
      // eslint-disable-next-line no-console
      success: options.success || (data => { console.log(data); }),
      // eslint-disable-next-line no-console
      error: options.error || (data => { console.log(data); }),
      // eslint-disable-next-line no-console
      complete: options.complete || (() => {return true;})
    };

    // Query parameters
    const esc = encodeURIComponent;
    const query = (options.data)?Object.keys(options.data).map(k => `${esc(k)}=${esc(options.data[k])}`).join('&'):'';
    let { url } = options;

    if(options.url.includes('?')) {
      url = `${options.url}&${query}`;
    } else if (query !== '') {
      url = `${options.url}?${query}`;
    }

    fetch(url, opt)
      .then(response => {
        const fetchResult = {
          status: response.status,
          headers: response.headers
        };
        if(response.ok){ // vérifier que le code de statut est bien compris entre 200 et 299 inclus
          response.text().then(data => {
            callback.success(data, fetchResult);
            callback.complete();
          });
        } else {
          response.text().then(data => {
            callback.error(data, fetchResult);
            callback.complete();
          });
        }
      })
      .catch(error => {
        callback.error(error, {
          status: 500,
          headers: new Headers({})
        });
        callback.complete();
      });
  }
  catch(e) {
    return false;
  }
};
