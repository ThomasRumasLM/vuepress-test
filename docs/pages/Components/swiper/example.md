<template>
<ShowHtml>
<div class="example">
    <div class="kl-swiper__slider-container mySwiperSlider">
        <nav class="kl-swiper__controls" aria-label="Carousel Navigation" tabindex="0">
            <button data-controls="prev" aria-controls="customize" tabindex="-1" class="ka-nav-button ka-nav-button--l "
                type="button" aria-label="Précédent">
                <svg class="ku-icon-16 "><use xlink:href="#Navigation_Arrow_Arrow--Left_16px" href="#Navigation_Arrow_Arrow--Left_16px"></use></svg>
            </button>
            <button data-controls="next" aria-controls="customize" tabindex="-1" class="ka-nav-button ka-nav-button--l "
                type="button" aria-label="Suivant">
                <svg class="ku-icon-16 "><use xlink:href="#Navigation_Arrow_Arrow--Right_16px" href="#Navigation_Arrow_Arrow--Right_16px"></use></svg>
            </button>
        </nav>
        <div class="kl-swiper kl-container">
            <ul class="kl-swiper__slider">
                <li class="kl-swiper__slider-item l-slider__item">
                    <div>item</div>
                </li>
                <li class="kl-swiper__slider-item l-slider__item">
                    <div>item</div>
                </li>
                <li class="kl-swiper__slider-item l-slider__item">
                    <div>item</div>
                </li>
                <li class="kl-swiper__slider-item l-slider__item">
                    <div>item</div>
                </li>
                <li class="kl-swiper__slider-item l-slider__item">
                    <div>item</div>
                </li>
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
  width: 50vw;

  &:first-of-type {
    margin-top: 3rem;
  }

  .l-slider__item {
    width: 25%;
  }
}
</style>

<script>
export default {
    mounted() {
        import('../../../../js/assets/modules/_swiperSlider.class.js')
        .then(SwiperSlider => {
            new SwiperSlider('mySwiperSlider');
        })
        .catch(error => {
            console.log(error)
        });
    }
}
</script>