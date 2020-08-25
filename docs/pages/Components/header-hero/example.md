<template>
<ShowHtml>
<div class="example">
    <div class="ko-header-hero">
        <div class="col-container">
            <div class="ko-header-hero__content col-12">
                <h1 class="ko-header-hero__title">my title</h1>
                <p class="ko-header-hero__description">my description</p>
            </div>
        </div>
        <div class="ko-header-hero__bloc-img">
            <img :src="$withBase('/images/carousel/caroussel-2.png')" class="ko-header-hero__img" alt="header hero example"/>
        </div>
    </div>
</div>
</ShowHtml>
</template>

<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/07-organisms/header-hero.organisms';

.example {
  /* margin: 1rem auto; */

  /* width: 80vw; */
}
</style>