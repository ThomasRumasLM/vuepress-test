import Collapse from './collapse/_collapse';

const COLLAPSEDCLASS = 'is-collapsed';
const ACCORDIONCLASS = {
  accordion: 'js-accordion',
  header: 'js-accordion__header',
  iconContainer: 'js-accordion__icon-container',
  icon: 'js-accordion__icon',
  iconMore: 'js-accordion__icon-more',
  iconLess: 'js-accordion__icon-less',
  panel: 'js-accordion__panel'
};
const HIDDENCLASS = 'kl-hidden';

class Accordion extends Collapse {
  constructor(options) {
    super(options.id);
    this.options = options;
    // _this = this;
    this.container = document.getElementById(this.options.id);
    this.headers = this.container.querySelectorAll(`.${  ACCORDIONCLASS.header}`);
    this.init();
  }

  init() {
    lm.forEach(this.headers, (header, i) => {
      const _container = lm.getClosest(header, `.${  ACCORDIONCLASS.accordion}`);
      const panel = header.nextElementSibling;
      const _panels = _container.querySelectorAll(`.${  ACCORDIONCLASS.panel}`);
      const count = i + 1;

      this.setAccessibility({
        type: 'header',
        elt: header,
        id: this.options.id,
        count: count
      });

      lm.forEach(_panels, (panel, i) => {
        this.setAccessibility({
          type: 'panel',
          elt: panel,
          id: this.options.id,
          count: i + 1
        });
        panel.dataset.panel = i + 1;
      });
      const iconContainer = header.querySelector(`.${  ACCORDIONCLASS.iconContainer}`);

      if (this.options.defaultOpen) {
        if (this.options.defaultOpen.indexOf(panel.dataset.panel) === -1) {
          this.toggle(panel);
          this.toggleHeader(header);
        } else {
          this.toggleHeaderIcons(iconContainer);
        }
      } else {
        this.toggle(panel);
        this.toggleHeader(header);
      }

      header.addEventListener('click', (e) => {
        e.preventDefault();

        // Cible le panel suivant le header cliqué et le toggle
        const currentPanel = header.nextElementSibling;
        this.toggle(currentPanel);
        this.toggleHeader(header);

        if (iconContainer) {
          this.toggleHeaderIcons(iconContainer);
          this.otherIconsBehavior(this.headers, header);
        }

        // Comportement des autres panels au click
        this.otherPanelsBehavior(_panels, currentPanel);
      });
    });
  }

  otherPanelsBehavior(panels, currentPanel) {
    if (this.options.mode !== 'open') {
      // Ferme tous les autres panels du même container
      lm.forEach(panels, (_panel, header) => {
        if (_panel !== currentPanel) {
          if (!_panel.classList.contains(COLLAPSEDCLASS)) {
            this.toggle(_panel);
            this.toggleHeader(header);
          }
        }
      });
    }
  }

  toggleHeaderIcons(iconContainer) {
    const iconMore = iconContainer.querySelector(`.${  ACCORDIONCLASS.iconMore}`);
    const iconLess = iconContainer.querySelector(`.${  ACCORDIONCLASS.iconLess}`);
    const classListIconMoreString = iconMore.getAttribute('class').toString();
    const classListIconLessString = iconLess.getAttribute('class').toString();

    if (classListIconMoreString.indexOf(HIDDENCLASS) !== -1) {
      const removeHiddenClass = classListIconMoreString.replace(HIDDENCLASS, '');
      iconMore.setAttribute('class', removeHiddenClass );
      const newClasses = `${classListIconLessString  } ${  HIDDENCLASS}`;
      iconLess.setAttribute('class', newClasses );
    }

    if (classListIconLessString.indexOf(HIDDENCLASS) !== -1) {
      const newClasses = `${classListIconMoreString  } ${  HIDDENCLASS}`;
      iconMore.setAttribute('class', newClasses );
      const removeHiddenClass =  classListIconLessString.replace(HIDDENCLASS, '');
      iconLess.setAttribute('class', removeHiddenClass );
    }
  }

  otherIconsBehavior(headers, currentHeader) {
    if (this.options.mode !== 'open') {
      lm.forEach(headers, (_header) => {
        if (_header !== currentHeader) {
          const iconMore = _header.querySelector(`.${  ACCORDIONCLASS.iconMore}`);
          const iconLess = _header.querySelector(`.${  ACCORDIONCLASS.iconLess}`);
          iconMore.classList.remove(HIDDENCLASS);
          iconLess.classList.add(HIDDENCLASS);
        }
      });
    }
  }

  setAccessibility(params) {
    params.elt.setAttribute('id', `${params.id}${params.type}${params.count}`);
    if (params.type === 'panel') {
      params.elt.setAttribute('aria-labelledby', `${params.id}header${params.count}`);
      params.elt.setAttribute('role', 'tabpanel');
    } else if (params.type === 'header') {
      params.elt.setAttribute('tabindex', '0');
      params.elt.setAttribute('aria-controls', `${params.id}panel${params.count}`);
      params.elt.setAttribute('role', 'tab');
    }
  }
}

export default Accordion;
