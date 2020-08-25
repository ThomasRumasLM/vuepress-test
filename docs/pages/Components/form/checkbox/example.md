<template>
<ShowHtml>
<form id="my-form">
<div class="example">
    <fieldset role="group" class="km-field km-field--list">
        <legend class="km-field__label  " for="liste1--990">
            Votre humeur
            <span class="km-field__mention">- Obligatoire</span>
        </legend>
        <ul class="km-field__wrapper">
            <li class="km-checkbox-wrapper km-field__checkbox-wrapper ">
                <input role="checkbox" required="" aria-label="triste Choix numéro 1 : triste" type="checkbox" class="km-checkbox-wrapper__input" name="liste1" id="liste1--990--0" value="Je suis triste">
                <svg class="ku-icon-16 km-checkbox-wrapper__ico"><use href="#Navigation_Notification_Available_16px"></use></svg>
                <label aria-hidden="true" class="km-checkbox-wrapper__label" for="liste1--990--0">
                    triste
                </label>
            </li>
            <li class="km-checkbox-wrapper km-field__checkbox-wrapper ">
                <input role="checkbox" required="" aria-label="mélancolique Choix numéro 2 : mélancolique" type="checkbox" class="km-checkbox-wrapper__input" name="liste1" id="liste1--990--1" value="Je suis mélancolique">
                <svg class="ku-icon-16 km-checkbox-wrapper__ico"><use href="#Navigation_Notification_Available_16px"></use></svg>
                <label aria-hidden="true" class="km-checkbox-wrapper__label" for="liste1--990--1">
                    mélancolique
                </label>
            </li>
            <li class="km-checkbox-wrapper km-field__checkbox-wrapper ">
                <input role="checkbox" required="" aria-label="heureux Choix numéro 3 : heureux" type="checkbox" class="km-checkbox-wrapper__input" name="liste1" id="liste1--990--2" value="Je suis heureux(se)">
                <svg class="ku-icon-16 km-checkbox-wrapper__ico"><use href="#Navigation_Notification_Available_16px"></use></svg>
                <label aria-hidden="true" class="km-checkbox-wrapper__label" for="liste1--990--2">
                    heureux
                </label>
            </li>
            <li class="km-checkbox-wrapper km-field__checkbox-wrapper ">
                <input role="checkbox" required="" aria-label="detendu Choix numéro 4 : detendu" type="checkbox" class="km-checkbox-wrapper__input" name="liste1" id="liste1--990--3" value="Je suis détendu(e)">
                <svg class="ku-icon-16 km-checkbox-wrapper__ico"><use href="#Navigation_Notification_Available_16px"></use></svg>
                <label aria-hidden="true" class="km-checkbox-wrapper__label" for="liste1--990--3">
                    detendu
                </label>
            </li>
        </ul>
    </fieldset>
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

