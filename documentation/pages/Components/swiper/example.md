<template>
<ShowHtml>
<div class="example">
    <div class="kl-swiper__slider-container mySwiperSlider">
        <nav class="kl-swiper__controls" aria-label="Carousel Navigation" tabindex="0">
            <button data-controls="prev" aria-controls="customize" tabindex="-1" class="ka-nav-button ka-nav-button--l " type="button" aria-label="Précédent">
                <svg class="ku-icon-16 "><use xlink:href="#Navigation_Arrow_Arrow--Left_16px" href="#Navigation_Arrow_Arrow--Left_16px"></use></svg>
            </button>
            <button data-controls="next" aria-controls="customize" tabindex="-1" class="ka-nav-button ka-nav-button--l " type="button" aria-label="Suivant">
                <svg class="ku-icon-16 "><use xlink:href="#Navigation_Arrow_Arrow--Right_16px" href="#Navigation_Arrow_Arrow--Right_16px"></use></svg>
            </button>
        </nav>
        <div class="kl-swiper">
            <ul class="kl-swiper__slider">
                <li class="kl-swiper__slider-item l-slider__item"><div>item 1</div></li>
                <li class="kl-swiper__slider-item l-slider__item"><div>item 2</div></li>
                <li class="kl-swiper__slider-item l-slider__item"><div>item 3</div></li>
                <li class="kl-swiper__slider-item l-slider__item"><div>item 4</div></li>
                <li class="kl-swiper__slider-item l-slider__item"><div>item 5</div></li>
            </ul>
        </div>
    </div>
</div>
</ShowHtml>
</template>

<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/04-layouts/swiper.layout';

.example {
  margin: 1rem auto;

  .l-slider__item {
    min-width: 10rem;
    margin: 1rem;
    padding: 1rem;
    background-color: lightgoldenrodyellow;
    text-align: center;
  }
}
</style>

<script>
export default {
    updated() {
        import('../../../../js/assets/modules/_swiperSlider.class')
        .then(m => {
            let mySwiper = document.querySelector('.mySwiperSlider');
            let swiperInstance = new m.default('.mySwiperSlider');
        })
        .catch(error => {
            console.log(error)
        });
    }
}
</script>