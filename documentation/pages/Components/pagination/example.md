<template>
<ShowHtml>

<div class="example">
  <p class="subtitle">Default</p>
<div class="mc-pagination js-pagination" data-cerberus="toto" data-url="http://toto.fr" data-current="6" data-limit="48" data-max-page="10">
  <a href="http://toto.fr?page=5" class="mc-pagination__button  testcustom js-previous" aria-label="Page précédente" title="Page précédente">
    <svg class="ku-icon-24 mc-pagination__button-icon"><use href="#Navigation_Arrow_Arrow--Left_24px"></use></svg>
  </a>
  <div class="mc-pagination__field">
    <select class="mc-select mc-pagination__select js-selector" aria-label="Choisir un numéro de page">
      <option value="1" aria-label="1 sur 10">1 sur 10</option>
      <option value="2" aria-label="2 sur 10">2 sur 10</option>
      <option value="3" aria-label="3 sur 10">3 sur 10</option>
      <option value="4" aria-label="4 sur 10">4 sur 10</option>
      <option value="5" aria-label="5 sur 10">5 sur 10</option>
      <option value="6" aria-label="6 sur 10" selected="">6 sur 10</option>
      <option value="7" aria-label="7 sur 10">7 sur 10</option>
      <option value="8" aria-label="8 sur 10">8 sur 10</option>
      <option value="9" aria-label="9 sur 10">9 sur 10</option>
      <option value="10" aria-label="10 sur 10">10 sur 10</option>
    </select>
  </div>
  <a href="http://toto.fr?page=7" class="mc-pagination__button  testcustom js-next" aria-label="Page suivante" title="Page suivante">
    <svg class="ku-icon-24 mc-pagination__button-icon"><use href="#Navigation_Arrow_Arrow--Right_24px"></use></svg>
  </a>
</div>
</div>


<div class="example">
  <p class="subtitle">Light</p>
  <div class="mc-pagination mc-pagination--light js-pagination" data-cerberus="toto" data-url="http://toto.fr" data-current="3" data-limit="48" data-max-page="10">
    <a href="http://toto.fr?page=2" class="mc-pagination__button  testcustom js-previous" aria-label="Page précédente" title="Page précédente">
      <svg class="ku-icon-24 mc-pagination__button-icon"><use href="#Navigation_Arrow_Arrow--Left_24px"></use></svg>
    </a>
    <a href="http://toto.fr?page=4" class="mc-pagination__button  testcustom js-next" aria-label="Page suivante" title="Page suivante">
      <svg class="ku-icon-24 mc-pagination__button-icon"><use href="#Navigation_Arrow_Arrow--Right_24px"></use></svg>
    </a>
  </div>
</div>
</ShowHtml>
</template>

<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/06-molecules/pagination.molecule';
</style>