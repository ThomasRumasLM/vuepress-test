// Global assign avoiding `this` mess
let _this;

/**
 * Just add src-content="URL_API" & src-container="CONTAINER_TO_APPEND_RESPONSE" like this :
 * <span class="lazy js-content-loader" data-src-content="/magazine/${reloadUrl}" data-src-container=".js-content-loader-container"></span>
 */
export default class contentLoader {

  /**
   * @param {DOM Element} target
   * @param {Function::optional} successCallback
   * @param {Function::optional} completeCallback
   */
  constructor(target, completeCallback = () => {return true;}) {

    _this = this;

    this.url              = target.dataset.srcContent;
    this.container        = target.dataset.srcContainer;
    this.completeCallback = completeCallback;

    this.callApi(this.container, this.url);

  }

  /**
   * Load content & insert it on container
   * @param {String} container
   * @param {String} url
   */
  callApi(container, url){
    lm.fetch({
      url: url,
      success: data => {
        document.querySelector(container).insertAdjacentHTML('beforeend', data);
      },
      complete: () => {
        _this.completeCallback();
      }
    });
  }
}
