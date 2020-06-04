<template>
    <section class="cd-timeline">
        <slot></slot>    
    </section>
</template>

<script>
export default {
    name:'Timeline'
}
</script>


<style lang="scss"  scoped>
$timeline-background: #eaf3e2; // body background color

.cd-timeline {
  position: relative;
  padding: 2rem 0;
  margin-left: 8rem;

  &::before {
    content: "";
    position: absolute;
    top: 0;
    left: 10px;
    height: 100%;
    width: 4px;
    background: darken($timeline-background, 5%);
  }
}
</style>