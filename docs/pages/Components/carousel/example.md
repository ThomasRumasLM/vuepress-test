<template>
<ShowHtml>
<div  class="km-carousel km-carousel--bevel-right-l">
    <nav class="km-carousel__controls" id="js-my-carousel-controls" aria-label="Carousel Navigation" tabindex="0">
        <button data-controls="prev" aria-controls="customize" tabindex="-1" class="ka-nav-button ka-nav-button--l" type="button" aria-label="Précédent">
            <svg class="ku-icon-16 "><use href="#Navigation_Arrow_Arrow--Left_16px"></use></svg>
        </button>
        <button data-controls="next" aria-controls="customize" tabindex="-1" class="ka-nav-button ka-nav-button--l" type="button" aria-label="Suivant">
            <svg class="ku-icon-16 "><use href="#Navigation_Arrow_Arrow--Right_16px"></use></svg>
        </button>
    </nav>
    <ul id="js-my-carousel" data-carousel-id="js-my-carousel">
        <li><img class="km-carousel__img tns-lazy-img" :src="$withBase('/images/loader.svg')" data-src="/images/carousel/caroussel-1.png"></li>
        <li><img class="km-carousel__img tns-lazy-img" :src="$withBase('/images/loader.svg')" data-src="/images/carousel/caroussel-2.png"></li>
        <li><img class="km-carousel__img tns-lazy-img" :src="$withBase('/images/loader.svg')" data-src="/images/carousel/caroussel-4.png"></li>
        <li><img class="km-carousel__img tns-lazy-img" :src="$withBase('/images/loader.svg')" data-src="/images/carousel/caroussel-5.png"></li>
        <li><img class="km-carousel__img tns-lazy-img" :src="$withBase('/images/loader.svg')" data-src="/images/carousel/caroussel-6.png"></li>
        <li><img class="km-carousel__img tns-lazy-img" :src="$withBase('/images/loader.svg')" data-src="/images/carousel/caroussel-7.png"></li>
    </ul>
</div>
</ShowHtml>
</template>

<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/10-bundles/carousel.bundle';

.example {
  text-align: center;
  margin: 1rem auto;
  display: block;
}
</style>

<script>
export default {
    mounted () {
        import('../../../../js/assets/modules/_carousel.class')
        .then(m => {
            const _options = {
                container: "#js-my-carousel"
            };
            new m.Carousel(_options);
        })
        .catch(error => {
            console.log(error)
        });
    }
}
</script>