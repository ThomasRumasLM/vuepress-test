const collapsedClass = 'is-collapsed';
const collapsedClassHeader = 'is-collapsed-header';

class Collapse {
  constructor(option) {
    this.id = option.id;
  }

  toggle(elt) {
    elt.classList.toggle(collapsedClass);
    this.toogleAriaExpanded(elt);
  }

  toogleAriaExpanded(elt) {
    if (elt.getAttribute('aria-expanded') === 'false') {
      elt.setAttribute('aria-expanded', 'true');
    } else {
      elt.setAttribute('aria-expanded', 'false');
    }
  }

  toggleHeader(elt) {
    elt.classList.toggle(collapsedClassHeader);
  }
}

export default Collapse;
