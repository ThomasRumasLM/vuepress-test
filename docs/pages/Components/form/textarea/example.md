<template>
<ShowHtml>
<form id="my-form">
<div class="example">
  <textarea class="ka-textarea" placeholder="My textarea" id="input-01" name="input-01"></textarea>
</div>
<div class="example">
  <textarea class="ka-textarea is-valid" placeholder="My textarea validated" id="input-01" name="input-01"></textarea>
</div>
<div class="example">
  <textarea class="ka-textarea is-invalid" placeholder="My textarea not validated" id="input-01" name="input-01"></textarea>
</div>
<div class="example">
  <textarea class="ka-textarea" disabled="true "placeholder="My textarea disabled" id="input-01" name="input-01"></textarea>
</div>
</form>
</ShowHtml>
</template>

<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/10-bundles/form.bundle';

.example {
  margin: 1rem auto;
}
</style>

<script>
export default {
    mounted() {
        import('../../../../../js/assets/modules/_forms.js')
        .then(m => {
            let myForm = document.querySelector('form#my-form');
            let formInstance = new m.Formulaire(myForm);
        })
        .catch(error => {
            console.log(error)
        });
    }
}
</script>

