<template>
  <article
    :id="name"
    class="db__app js-app col-12 col-xl-6"
    :data-team="team"
  >
    <div class="db__app--line db__app--header">
      {{name}}
      <div class="mc-flag mc-flag--bordered-dark js-team-name">
          <span>{{team}}</span>
      </div>
    </div>

    <div class="db__app--line">
      <div>Core version</div>
      <span type="button" :class="statusCore" class="mc-tag-text mc-tag-text--s mc-tag-text--dark version js-team-name">
        <span class="mc-tag-text__label">{{coreVersion}}</span>
      </span>
    </div>
    <div class="db__app--line">
      <div>Kobi version</div>
      <span type="button" :class="statusKobi" class="mc-tag-text mc-tag-text--s mc-tag-text--dark version js-team-name">
        <span class="mc-tag-text__label">{{kobiVersion}}</span>
      </span>
    </div>
  </article>
</template>

<script>
export default {
  name: "DashboardCard",
  props: [
    "name",
    "team",
    "coreVersion",
    "statusCore",
    "kobiVersion",
    "statusKobi",
  ],
};
</script>

<style lang="scss" scoped>
@import '../public/sass/common';
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/05-atoms/flag.atoms';
@import 'css/assets/sass/_common/05-atoms/tags.atoms';

.version {
  box-shadow: none;
}

.up-to-date {
  background: #91c854;
}

.behind-patch {
  background: #f8cc1c;
}

.behind-minor {
  background: #fc961e;
}

.behind-major {
  background: #df382b;
}

.not-on-tag {
  background: #54c4de;
}

.db__app {
  border: 1px #999 solid;
  border-radius: 3px;

  &--line {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 1rem 0.5rem;

    &:not(:last-child) {
      padding: 0.5rem 1rem;
    }
  }

  &--header {
    padding: 1rem;
    background: $color-grey-200;
  }
}
</style>