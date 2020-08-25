<template>
<ShowHtml>
<form id="my-form">
<div class="example" id="counterElement">
    <div class="km-field__wrapper km-field__wrapper--counter">
        <button aria-hidden="true" type="button" class="km-field__counter-button km-field__counter-button--left">-</button>
        <input type="text" id="numberOfLayers--990" name="numberOfLayers" value="0" inputmode="number" required="" class="ka-input km-field__input ka-input--counter js-input-counter l-paint-calculator__input km-field__input--inline@from-l is-valid" aria-label="Nombre de couches"
            data-cerberus="INPUT_nombreCouchesCalculette" data-error-wrapper="col-s-12 col-m-12 col-start-l-7 col-l-4" data-missing="Veuillez renseigner le champ" data-mismatch="Veuillez renseigner un nombre à 2 décimales max." pattern="[0-9]+([\.,][0-9]{1,2})?"
            data-step="1" min="1" max="999">
        <button aria-hidden="true" type="button" class="km-field__counter-button km-field__counter-button--right">+</button>
    </div>
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

