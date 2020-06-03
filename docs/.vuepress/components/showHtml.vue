<template>
  <div :class="'comp-preview'">
    <slot></slot>
  </div>
</template>

<style lang="scss"  scoped>
.comp-preview {
//   @import "~integration-web-core--socle/documentation/static/sass/common.css";

  @import "~integration-web-core--socle/css/assets/sass/_common/01-setting-tools/_all-settings.scss";
//   @import "~integration-web-core--socle/css/assets/sass/_common/01-setting-tools/_font-family.fonts.scss";
  @import "~integration-web-core--socle/css/assets/sass/_common/02-generic/_reset.scss";
  @import "~integration-web-core--socle/css/assets/sass/_common/02-generic/_normalize.bundle.scss";
  @import "~integration-web-core--socle/css/assets/sass/_common/04-layouts/_grid.layout.scss";
  @import "~integration-web-core--socle/css/assets/sass/_common/04-layouts/_popin.layout.scss";
  @import "~integration-web-core--socle/css/assets/sass/_common/04-layouts/_container.layout.scss";
  @import "~integration-web-core--socle/css/assets/sass/_common/09-utilities/_font.utility.scss";
  @import "~integration-web-core--socle/css/assets/sass/_common/09-utilities/_icons-kit.utility.scss";
  @import "~integration-web-core--socle/css/assets/sass/_common/09-utilities/_spaces.utility.scss";
  @import "~integration-web-core--socle/css/assets/sass/_common/05-atoms/_base.scss";
  @import "~integration-web-core--socle/css/assets/sass/_common/04-layouts/_visibility.layout.scss";

  // Long time support
  @import "~integration-web-core--socle/css/assets/sass/_common/11-support/_spaces.scss";
  @import "~integration-web-core--socle/css/assets/sass/_common/11-support/_font.scss";
  @import "~integration-web-core--socle/css/assets/sass/_common/11-support/_titles.scss";
}
</style>

<script>
export default {
  name: "showHtml"
};
</script>