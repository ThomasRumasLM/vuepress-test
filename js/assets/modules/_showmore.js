import Collapse from './collapse/_collapse';

const EXPANDABLECLASS = 'is-expandable';
const SHOWMORECLASS = {
  link: 'mc-link'
};

class ShowMore extends Collapse {
  constructor(options) {
    super(options.id);
    this.options = options;
    this.container = document.getElementById(this.options.id);
    this.init();
  }

  init() {
    this.container.classList.add(EXPANDABLECLASS);
    this.container.style.maxHeight = this.options.initialHeight;
    const btn = _initButton.call(this);
    this.container.parentNode.insertBefore(btn, this.container.nextSibling);

    btn.addEventListener('click', _toggleButton.bind(this));
  }
}

export default ShowMore;

function _toggleButton(e) {
  if (!e.target.classList.contains(SHOWMORECLASS.link)) return;
  e.preventDefault();
  const action = (this.container.classList.contains(EXPANDABLECLASS)) ? 'less' : 'more';
  const labelBtn = (action === 'less') ? this.options.label.less : this.options.label.more;
  e.target.innerHTML = labelBtn;
  this.container.classList.toggle(EXPANDABLECLASS);
  this.container.style.maxHeight = (action === 'more') ? this.options.initialHeight : null;

}

function _initButton() {
  const btn = document.createElement('span');
  btn.classList.add(SHOWMORECLASS.link);
  btn.innerHTML = this.options.label.more;
  return btn;
}
