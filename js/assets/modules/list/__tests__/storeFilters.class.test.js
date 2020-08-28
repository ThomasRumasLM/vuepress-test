import StoreFilters from '../storeFilters.class';

const config = {event: {target:jest.fn(), key : 'selectedFilters',
  dataKey : 'filters'}};
const storeFiltersTest = new StoreFilters(config);
const _selectedValues = {'prices': '20~39.9','type-de-produit': ['Support de piquet', 'Tendeur de câble']};
describe('StoreFilters class', () => {

  test('If Class StoreFilters  is defined', () => {
    expect(StoreFilters).toBeDefined();

  });
  test('If instance storeFiltersTest is instance of SToreFilter', () => {
    expect(storeFiltersTest).toBeInstanceOf(StoreFilters);

  });
  test('If Class StoreFilters event is defined', () => {
    expect(storeFiltersTest.event).toBeInstanceOf(Object);

  });
});


describe('StoreFilters.format method', () => {

  test('If values is formatted', () => {
    expect(storeFiltersTest.format(_selectedValues)).toEqual({'applieds': 'prices:20~39.9#type-de-produit:Support de piquet|Tendeur de câble'});
  });
});

describe('StoreFilters.dispatch', () => {
  const details = {action:'filter',filters:storeFiltersTest.format(_selectedValues)};
  test('if  dispatch event ', () => {
    storeFiltersTest.dispatch(details);
    expect(storeFiltersTest.event.target).toHaveBeenCalled();
  });


});
