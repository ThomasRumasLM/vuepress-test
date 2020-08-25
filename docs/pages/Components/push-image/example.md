<template>
<ShowHtml>
<section class="example">
    <div class="km-push-image">
        <div class="km-push-image__picture">
            <picture class="lazy-loaded" loading="lazy" data-class="km-push-image__picture--image"
                data-iesrc="/images/push.jpg" data-alt="La pose de votre robinet par un professionnel">
                <source srcset="/images/push.jpg?width=320" media="(max-width: 320px)">
                <source srcset="/images/push.jpg?width=640"
                    media="(max-width: 320px) and (-webkit-min-device-pixel-ratio: 2)">
                <source srcset="/images/push.jpg?width=960"
                    media="(max-width: 320px) and (-webkit-min-device-pixel-ratio: 3)">
                <source srcset="/images/push.jpg?width=640" media="(max-width: 640px)">
                <source srcset="/images/push.jpg?width=1280"
                    media="(max-width: 640px) and (-webkit-min-device-pixel-ratio: 2)">
                <source srcset="/images/push.jpg?width=1920"
                    media="(max-width: 640px) and (-webkit-min-device-pixel-ratio: 3)">
                <source srcset="/images/push.jpg?width=960" media="(max-width: 960px)">
                <source srcset="/images/push.jpg?width=1280"
                    media="(max-width: 960px) and (-webkit-min-device-pixel-ratio: 2)">
                <source srcset="/images/push.jpg?width=1280" media="(max-width: 1280px)">
                <source srcset="/images/push.jpg?width=1920" media="(max-width: 1920px)">
                <source srcset="/images/push.jpg?width=1921" media="(min-width: 1921px)">
                <img alt="La pose de votre robinet par un professionnel" class="km-push-image__picture--image">
            </picture>
        </div>
        <div class="km-push-image__content">
            <h3 class="km-push-image__title">Tous nos forfaits de pose</h3>
            <p class="km-push-image__description">La pose de votre robinet par un professionnel</p>
            <a class="mc-link km-push-image__link" href="/">J'en profite</a>
        </div>
    </div>
</section>
</ShowHtml>
</template>

<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/06-molecules/push-image.molecules';

.example {
  width: 50%;
  margin: 0 auto;
}
</style>