import { tns } from 'tiny-slider/src/tiny-slider';

class Carousel extends tns{
  constructor(_options){

    _options.lazyload = true;
    _options.mouseDrag = true;
    _options.controlsContainer = (_options.controlsContainer) ?_options.controlsContainer : `${_options.container}-controls`,
    super(_options);

  }

}

export default Carousel;