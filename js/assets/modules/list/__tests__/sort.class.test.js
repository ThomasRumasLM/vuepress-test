import Sort from '../sort.class';
window.tc_vars = {
  page_cat1_label: 'Electricité et domotique',
  page_cat2_label: 'Alarme maison, caméra de surveillance et détecteur de fumée',
  page_cat3_label: 'Extincteur',
  page_cat4_label: ''
};
document.body.innerHTML = `<select class="js-select-sorting" id="sorting-select">
<option value="relevance" >Pertinence</option>
<option value="price-asc" >Prix croissant</option>
<option value="price-desc">Prix décroissant</option>
</select>
`;
const eventFire = (el, etype) => {
  if (el.fireEvent) {
    el.fireEvent(`on ${etype}`);
  } else {
    const evObj = document.createEvent('Events');
    evObj.initEvent(etype, true, false);
    el.dispatchEvent(evObj);
  }
};

const config = {
  event: {
    target: jest.fn(), key: 'selectedFilters',
    dataKey: 'filters'
  }
};

const sortTest = new Sort(config);
describe('Sort class', () => {

  test('If Class Sort is defined', () => {
    expect(sortTest).toBeDefined();

  });
  test('If instance sortTest is instance of Sort', () => {
    expect(sortTest).toBeInstanceOf(Sort);

  });
  test('If Class Sort event is defined', () => {
    expect(sortTest.event).toBeInstanceOf(Object);
  });

  test('If sortingElement in class Sort is defined',()=>{
    expect(sortTest.sortingElement).toBeDefined() ;
  });

  test('If sortingElementPosition in class Sort is defined',()=>{
    expect(sortTest.sortingElementPosition).toBeDefined() ;
  });

});

describe('on Change Sort',()=>{

  test('if on change sort select the event has dispatched',()=>{
    eventFire(sortTest.sortingElement,'change');
    expect(sortTest.event.target).toHaveBeenCalled();
  });

});
