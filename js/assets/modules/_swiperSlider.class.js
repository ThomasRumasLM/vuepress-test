import ResizeObserver from 'resize-observer-polyfill';
import 'scroll-behavior-polyfill';

const HIDDENCLASS = 'ka-nav-button--hidden';

class SwiperSlider {
  constructor(prmElement, prmScrollWidth = null) {
    this.swiper = document.querySelector(`${prmElement}`);
    this.swiperItem = this.swiper.querySelector('.kl-swiper__slider-item');
    this.buttonsNavigation = this.swiper.querySelectorAll('button.ka-nav-button');
    this.eventLoaded = false;
    if(prmScrollWidth !== null) {
      this.scrollWidth = prmScrollWidth;
    } else {
      this.scrollWidth = _getFullWidth(this.swiperItem);
      _getScrollWidthOnResize.call(this);
    }
    _buttonsVisibility.call(this);
  }

  swipe(prmTarget) {
    const swiper = this.swiper.querySelector('.kl-swiper');
    const scrollValue = (prmTarget.dataset.controls === 'prev') ? this.scrollWidth * -1 : this.scrollWidth;
    swiper.scrollBy(scrollValue, 0);
    this.showButton(swiper, scrollValue);
  }

  showButton(prmScrollSwiper, prmScrollValue) {
    _checkStatusButtons.call(this, prmScrollSwiper, prmScrollValue);
  }
}

function _getScrollWidthOnResize() {
  const resizeObserver = new ResizeObserver(() => {
    this.scrollWidth = _getFullWidth(this.swiperItem);
    _buttonsVisibility.call(this);
  });

  resizeObserver.observe(this.swiper);
}

function _getFullWidth(prmElement) {
  const style = prmElement.currentStyle || window.getComputedStyle(prmElement);
  const result =
  prmElement.clientWidth
    + parseFloat(style.marginLeft) + parseFloat(style.marginRight)
    + parseFloat(style.paddingLeft) + parseFloat(style.paddingRight)
    + parseFloat(style.borderLeftWidth) + parseFloat(style.borderRightWidth);

  return result;
}

function _buttonsVisibility() {
  const swiperWidth = this.swiper.querySelector('.kl-swiper').offsetWidth;
  const swiperSlider = this.swiper.querySelector('.kl-swiper__slider');
  const swiperSliderWidth = swiperSlider.scrollWidth;
  const buttonsNavigation = this.swiper.querySelector('.kl-swiper__controls');
  const classButtonsHidden = 'kl-swiper__controls--hidden';
  const classSwiperCenter = 'kl-swiper__slider--center';

  if(swiperSliderWidth > swiperWidth) {
    _initDesktopButtons.call(this);
    buttonsNavigation.classList.remove(classButtonsHidden);
    swiperSlider.classList.remove(classSwiperCenter);
  } else {
    buttonsNavigation.classList.add(classButtonsHidden);
    swiperSlider.classList.add(classSwiperCenter);
  }
}

function _initDesktopButtons() {
  const buttonsNavigation = this.swiper.querySelectorAll('button.ka-nav-button');
  if(!this.eventLoaded) {
    for (let i = 0; i < buttonsNavigation.length; i++) {
      buttonsNavigation[i].addEventListener('click', (event) => {
        this.swipe(event.target);
      });
    }
    this.eventLoaded = true;
  }
}

function _checkStatusButtons(prmScrollSwiper, prmScrollValue) {
  const limit = prmScrollSwiper.scrollWidth - prmScrollSwiper.clientWidth;
  const scrollPosition = prmScrollSwiper.scrollLeft + prmScrollValue + 1;
  (scrollPosition > 1) ? this.buttonsNavigation[0].classList.remove(HIDDENCLASS) : this.buttonsNavigation[0].classList.add(HIDDENCLASS);
  (scrollPosition >= limit) ? this.buttonsNavigation[1].classList.add(HIDDENCLASS) : this.buttonsNavigation[1].classList.remove(HIDDENCLASS);
}

export default SwiperSlider;
