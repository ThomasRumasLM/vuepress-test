<template>
<ShowHtml>
<form id="my-form">
<div class="example">
  <input type="text" class="ka-input" placeholder="My input atom" id="input-01" name="input-01"/>
</div>
<div class="example">
  <input type="text" class="ka-input is-valid" placeholder="My input atom validated" id="input-01" name="input-01"/>
</div>
<div class="example">
  <input type="text" class="ka-input is-invalid" placeholder="My input atom not validated" id="input-01" name="input-01"/>
</div>
<div class="example">
  <input type="text" class="ka-input" disabled="true "placeholder="My input atom disabled" id="input-01" name="input-01"/>
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

