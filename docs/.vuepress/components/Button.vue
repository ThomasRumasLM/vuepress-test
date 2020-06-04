<template>
  <a
    :href="buttonHref"
    class="mc-button mc-button--l mc-button--bordered doc-button"
  >{{buttonLabel}}</a>
</template>

<style lang="scss" scoped >
@import "~integration-web-core--socle/documentation/static/sass/common";
.doc-button {
  margin: 1rem;
  &:hover {
    text-decoration: none!important;
  }
}
</style>

<script>
export default {
  name: "Button",
  props: ["buttonHref", "buttonLabel"]
};
</script>