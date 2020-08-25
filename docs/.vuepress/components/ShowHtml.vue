<template>
  <div class="preview-container">
    <div ref="allIcons" class="kl-hidden"></div>
    <slot></slot>
  </div>
</template>

<style lang="scss" scoped >
@import '../public/sass/common';

.subtitle {
  margin-top: 1.5rem;
  margin-bottom: 0.5rem;
  font-size: 1.5rem;
  font-family: LeroyMerlin, sans-serif;
  font-weight: 300;
}

.preview-container {
  margin-top: 2rem;
  margin-bottom: 2rem;
}
</style>

<script>
import allIcons from "!!raw-loader!../../../freemarker/icon-kit/allicons.svg";

export default {
  name: "ShowHtml",
  mounted() {
    this.$refs.allIcons.insertAdjacentHTML("afterbegin", allIcons);
  },
};
</script>