<template>
<ShowHtml>
<form id="my-form">
<div class="mc-field myClass" id="myId" data-toto="toto">
  <label class="mc-field__label" for="testTextarea--977">
    Votre description
    <span class="mc-field__requirement">mandatory</span>
  </label>
  <span class="mc-field__help">Description du champ de formulaire, minimum 10 caractères</span>
  <textarea id="testTextarea--977" name="testTextarea" class="mc-field__input mc-textarea js-form-input myClass"
    placeholder="Votre message ici..." aria-label="Votre description" data-missing="Ce champ est obligatoire"
    data-mismatch="Ce champ ne respecte pas le format attendu : " pattern="(?=^(.{10,3000})$)([^<>{}])*" minlength="10"
    maxlength="3000" required="" data-toto="tata"></textarea>
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
    updated() {
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

