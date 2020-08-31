<template>
<ShowHtml :key="componentKey" >
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
<button class="mc-button mc-button--s doc-submit" form="km-form" type="submit"><span class="mc-button__label">Submit</span></button>
</form>
</ShowHtml>
</template>

<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/10-bundles/form.bundle';

.example {
  margin: 1rem auto;
}

.doc-submit {
  margin-top: 1rem;
}
</style>

<script>
export default {
    name: "Textarea",
    data() {
        return {
            componentKey: 0,
        };
    },
    methods: {
        forceRerender() {
            this.componentKey += 1;
        }
    },
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

