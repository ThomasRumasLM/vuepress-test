<template>
  <div class="cd-timeline__card">
    <span class="cd-timeline__dot" :class="'cd-timeline__dot--' + type"></span>
    <span class="cd-timeline__content-date">{{date}}</span>
    <div class="cd-timeline__content cd-timeline__content--type">
      <h2 class="cd-timeline__content-title">{{title}}</h2>
      <p class="cd-timeline__content-text">{{text}}</p>
      <a :href="linkhref" class="cd-timeline__content-link">{{linklabel}}</a>
    </div>
  </div>
</template>

<script>
export default {
  name: "TimelineItem",
  props: ["type", "date", "title", "text", "linklabel", "linkhref"],
};
</script>

<style lang="scss"  scoped>
$timeline-background: #eaf3e2; // body background color
$timeline-light: #fff; // white
$timeline-dark: #303e49; // blue dark
$timeline-yellow: #f0ca45; // yellow
$timeline-green: #75ce66; // green
$timeline-red: #c03b44; // red

.cd-timeline {
  &__card {
    position: relative;
    margin: 2rem 0;
  }

  &__dot {
    position: absolute;
    top: 0;
    left: 0;
    width: 24px;
    height: 24px;
    border-radius: 50%;
    box-shadow:
      0 0 0 4px $timeline-light,
      inset 0 2px 0 rgba($timeline-dark, 0.08),
      0 3px 0 4px rgba($timeline-dark, 0.05);

    &--success {
      background: $timeline-green;
    }

    &--warning {
      background: $timeline-yellow;
    }

    &--danger {
      background: $timeline-red;
    }
  }

  &__content {
    margin: 0 60px;
    background: lighten($timeline-background, 5%);
    padding: 1rem;
    box-shadow: 0 3px 0 darken($timeline-background, 5%);

    &-title {
      color: $timeline-dark;
    }

    &-text {
      margin-top: 1rem;
      line-height: 1.6;
    }

    &-date {
      position: absolute;
      width: 8rem;
      top: 0;
      right: calc(100% + 1rem);
      text-align: right;
    }

    &-legend {
      margin-top: 1rem;
      margin-bottom: 0.25rem;
      color: lighten($timeline-dark, 25%);
    }

    &-teams {
      display: flex;
      flex-wrap: wrap;

      label {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-right: 1rem;
        color: lighten($timeline-dark, 25%);
      }
    }
  }
}
</style>