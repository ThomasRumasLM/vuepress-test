const PAGINATION_CLASS = {
  PREVIOUS_BUTTON: 'js-previous',
  NEXT_BUTTON: 'js-next',
  SELECTOR: 'js-selector',
  DISABLED: 'km-pagination__button--disabled'
};

export class Pagination {
  /**
   *
   * @param {HTML Element} prmClass need to be an actuel pagination DOM element
   * @param {Function} prmFunction need to be an arrow function to be executed when pagination has changed
   */
  constructor(prmClass, prmFunction = () => { return null; }) {
    //Selector
    this.paginationLayout = document.querySelector(`.${prmClass}`);
    //Attributes
    this.currentPage = parseInt(this.paginationLayout.dataset.current, 10);
    this.maxPage = parseInt(this.paginationLayout.dataset.maxPage, 10);
    this.minPage = 1;
    this.limit = parseInt(this.paginationLayout.dataset.limit, 10);
    this.url = this.paginationLayout.dataset.url;
    //Elements
    this.previousButton = this.paginationLayout.querySelector(`.${PAGINATION_CLASS.PREVIOUS_BUTTON}`);
    this.nextButton = this.paginationLayout.querySelector(`.${PAGINATION_CLASS.NEXT_BUTTON}`);
    this.selector = this.paginationLayout.querySelector(`.${PAGINATION_CLASS.SELECTOR}`);

    this.hasChanged = prmFunction;

    if(this.selector !== undefined && this.selector !== null) {
      this.initializeSelector();
    }

    this.initializeButton();
  }

  initializeButton() {
    this.nextButton.addEventListener('click', (event) => {
      event.preventDefault();
      this.updatePagination('next');
    });

    this.previousButton.addEventListener('click', (event) => {
      event.preventDefault();
      this.updatePagination('previous');
    });
  }

  appendButton() {
    this.previousButton.classList.remove(PAGINATION_CLASS.DISABLED);
    this.nextButton.classList.remove(PAGINATION_CLASS.DISABLED);

    switch (this.currentPage) {
    case 1:
      this.previousButton.classList.add(PAGINATION_CLASS.DISABLED);
      break;
    case this.maxPage:
      this.nextButton.classList.add(PAGINATION_CLASS.DISABLED);
      break;
    default:
      break;
    }
  }

  initializeSelector() {
    this.selector.addEventListener('change', () => {
      this.updatePagination();
    });
  }

  updateSelectorValue() {
    if(this.selector !== undefined && this.selector !== null) {
      this.selector.value = this.currentPage;
    }
  }

  /**
   *
   * @param {String} prmMode can be previous, next or empty
   */
  updatePagination(prmMode = '') {
    switch (prmMode) {
    case 'next':
      if(this.currentPage < this.maxPage) {
        this.currentPage++;
        this.updateSelectorValue();
      }
      break;
    case 'previous':
      if(this.currentPage > this.minPage) {
        this.currentPage--;
        this.updateSelectorValue();
      }
      break;
    default:
      this.currentPage = parseInt(this.selector.options[this.selector.selectedIndex].value, 10);
      break;
    }
    this.appendButton();
    this.hasChanged();
    this.paginationLayout.dataset.current = this.currentPage;
  }

  getUrl() {
    const params = {
      page : this.currentPage,
      limit: this.limit
    };
    return `${this.url}?${_serialize(params)}`;
  }

  getParam() {
    const params = {
      page : this.currentPage,
      limit: this.limit
    };
    return `${_serialize(params)}`;
  }
}

/**
 *
 * @param {Object} prmObj need to be a JSON object you want to serialize
 */
function _serialize(prmObj) {
  const str = [];
  for (const p in prmObj)
    if (Object.prototype.hasOwnProperty.call(prmObj, p)) {
      str.push(`${encodeURIComponent(p)}=${encodeURIComponent(prmObj[p])}`);
    }
  return str.join('&');
}
