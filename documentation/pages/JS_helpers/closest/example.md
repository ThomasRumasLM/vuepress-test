<template>
<ShowHtml>
 <section class="js-closest-demo">
    <div class="parent">
    	Parent <br>
        <span class="child1">Child</span>
    </div>
    <span class="child2">Child</span>
</section>
</ShowHtml>
</template>

<style lang="scss" scoped>
body {
  padding: 1rem 1rem 0;
}

.parent {
  padding: 1rem;
  border: 2px #000 solid;
}

.child1,
.child2 {
  margin: 0.5rem 0;
  padding: 0.5rem;
  border: 2px #f00 solid;
  display: inline-block;
}
</style>

<script>
export default {
    updated() {
        let c1 = document.querySelector('.js-closest-demo child1');
        let c2 = document.querySelector('.js-closest-demo child2');
        lm.getClosest(c1, '.parent');
            // > return  <div class="parent">
        lm.getClosest(c1, 'section');
            // > return  <section>
        lm.getClosest(c2, '.parent');
            // > return false
    }
}
</script>