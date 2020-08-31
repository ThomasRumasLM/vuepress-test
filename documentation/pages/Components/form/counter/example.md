<template>
<ShowHtml :key="componentKey" >
<form id="my-form">
<div class="mc-field">
    <label class="mc-field__label" for="quantity--988">
        My label (Size S)
    </label>
    <div class="km-field__wrapper--counter">
        <button class="mc-button mc-button--bordered mc-button--s mc-field__input km-field__counter-button--left"
            data-cerberus="cerberusBtnMinus" type="button" aria-label="moins" disabled=""> <span
                class="mc-button__label">-</span> </button>
        <input type="text" id="quantity--988" name="trucs"
            class="mc-text-input ka-input--counter js-input-counter mc-field__input mc-text-input--s" placeholder="Compteur"
            aria-label="Nombre de trucs" data-missing="Veuillez renseigner un nombre valide compris entre 3 et 10"
            data-mismatch="Veuillez renseigner un nombre valide compris entre 3 et 10"
            pattern="[0-9]+([\.,][0-9]{1,2})?" required="" data-step="1" data-min="3" data-max="10" value="3">
        <button class="mc-button mc-button--bordered mc-button--s mc-field__input km-field__counter-button--right"
            data-cerberus="cerberusBtnPlus" type="button" aria-label="plus"> <span class="mc-button__label">+</span>
        </button>
    </div>
</div>
<br />
<div class="mc-field">
    <label class="mc-field__label" for="quantity--987">
        My label (Size m)
    </label>
    <div class="km-field__wrapper--counter">
        <button class="mc-button mc-button--bordered mc-button--m mc-field__input km-field__counter-button--left"
            data-cerberus="cerberusBtnMinus" type="button" aria-label="moins" disabled=""> <span
                class="mc-button__label">-</span> </button>
        <input type="text" id="quantity--987" name="trucs"
            class="mc-text-input ka-input--counter js-input-counter mc-field__input mc-text-input--s" placeholder="Compteur"
            aria-label="Nombre de trucs" data-missing="Veuillez renseigner un nombre valide compris entre 3 et 10"
            data-mismatch="Veuillez renseigner un nombre valide compris entre 3 et 10"
            pattern="[0-9]+([\.,][0-9]{1,2})?" required="" data-step="1" data-min="3" data-max="10" value="3">
        <button class="mc-button mc-button--bordered mc-button--m mc-field__input km-field__counter-button--right"
            data-cerberus="cerberusBtnPlus" type="button" aria-label="plus"> <span class="mc-button__label">+</span>
        </button>
    </div>
</div>
<br />
<div class="mc-field">
    <label class="mc-field__label" for="quantity--986">
        My label (Size l)
    </label>
    <div class="km-field__wrapper--counter">
        <button class="mc-button mc-button--bordered mc-button--l mc-field__input km-field__counter-button--left"
            data-cerberus="cerberusBtnMinus" type="button" aria-label="moins" disabled=""> <span
                class="mc-button__label">-</span> </button>
        <input type="text" id="quantity--986" name="trucs"
            class="mc-text-input ka-input--counter js-input-counter mc-field__input mc-text-input--s" placeholder="Compteur"
            aria-label="Nombre de trucs" data-missing="Veuillez renseigner un nombre valide compris entre 3 et 10"
            data-mismatch="Veuillez renseigner un nombre valide compris entre 3 et 10"
            pattern="[0-9]+([\.,][0-9]{1,2})?" required="" data-step="1" data-min="3" data-max="10" value="3">
        <button class="mc-button mc-button--bordered mc-button--l mc-field__input km-field__counter-button--right"
            data-cerberus="cerberusBtnPlus" type="button" aria-label="plus"> <span class="mc-button__label">+</span>
        </button>
    </div>
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
    name: "Counter",
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

