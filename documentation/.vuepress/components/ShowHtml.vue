<template>
<div class="preview-container">
  <h2 class="preview-title">Preview</h2>
  <div class="preview-content">
    <div ref="allIcons" class="kl-hidden"></div>
    <slot></slot>
  </div>
</div>
</template>

<style lang="scss" scoped >
// @import '../public/sass/common';

.subtitle {
  margin-top: 1.5rem;
  margin-bottom: 0.5rem;
  font-size: 1.5rem;
  font-family: LeroyMerlin, sans-serif;
  font-weight: 300;
}

.preview {
  &-title {
    margin-bottom: 1rem;
    padding-bottom: 1rem;
    border-bottom: 0.2rem solid #dfe2e5;
  }

  &-container {
    margin-bottom: 2rem;
    margin-top: 2rem;
  }
}

</style>

<script>
import allIcons from "!!raw-loader!../../../freemarker/icon-kit/allicons.svg";
import commonCss from '../public/sass/common.css'

export default {
  name: "ShowHtml",
  mounted() {
    this.$refs.allIcons.insertAdjacentHTML("afterbegin", allIcons);
  },
};
</script>