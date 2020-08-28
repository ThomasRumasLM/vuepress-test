<template>
<ShowHtml>
<form id="my-form">
<div class="example">
    <p class="a-subtitle">Checkbox list</p>
    <fieldset class="mc-field mc-field--group toto-1 " data-toto="toto-1">
        <legend class="mc-field__label">
                Label
            <span class="mc-field__requirement">mandatory</span>
        </legend>
        <span class="mc-field__help">Plusieurs choix possible</span>
        <ul data-missing="Ce champ est obligatoire" class="mc-field__container js-form-field-list">
            <li class="mc-checkbox mc-field__item class-on-li" data-truc="data-on-li">
                <input required="" aria-label="default Choix numéro 1 : default" type="checkbox" class="mc-checkbox__input  class-inner-input js-form-checkbox" name="test1" id="test1--991--0" aria-describedby="error__test1--991" value="default checkbox" aria-checked="false" data-inner-input="data-inner-input-test">
                <label aria-hidden="true" class="mc-checkbox__label " for="test1--991--0">default
                       <span class="mc-checkbox__suffix-label  class-inner-suffix" data-test="data-attribute-suffix">
                       (33)
                       </span>
                </label>
            </li>
            <li class="mc-checkbox mc-field__item class-on-li" data-truc="data-on-li">
                <input required="" aria-label="checked Choix numéro 2 : checked" type="checkbox" class="mc-checkbox__input  js-form-checkbox" name="test1" id="test1--991--1" aria-describedby="error__test1--991" value="checked checkbox" checked="checked" aria-checked="true">
                <label aria-hidden="true" class="mc-checkbox__label " for="test1--991--1">checked
                </label>
            </li>
            <li class="mc-checkbox mc-field__item class-on-li" data-truc="data-on-li">
                <input required="" aria-label="disabled Choix numéro 3 : disabled" type="checkbox" class="mc-checkbox__input  js-form-checkbox" name="test1" id="test1--991--2" aria-describedby="error__test1--991" value="disabled checkbox" disabled="" aria-checked="false">
                <label aria-hidden="true" class="mc-checkbox__label " for="test1--991--2">disabled
                </label>
            </li>
            <li class="mc-checkbox mc-field__item class-on-li" data-truc="data-on-li">
                <input required="" aria-label="invalid Choix numéro 4 : invalid" type="checkbox" class="mc-checkbox__input  is-invalid js-form-checkbox" name="test1" id="test1--991--3" aria-describedby="error__test1--991" value="invalid checkbox" aria-checked="false">
                <label aria-hidden="true" class="mc-checkbox__label " for="test1--991--3">invalid
                </label>
            </li>
        </ul>
    </fieldset>
    <p class="a-subtitle"><br /><br />Checkbox list inline<br /><br /></p>
    <fieldset class="mc-field mc-field--group toto-1 " data-toto="toto-1">
        <legend class="mc-field__label">
                Label
                <span class="mc-field__requirement">mandatory</span>
        </legend>
            <span class="mc-field__help">Plusieurs choix possible</span>
            <ul data-missing="Ce champ est obligatoire" class="mc-field__container mc-field__container--inline js-form-field-list">
            <li class="mc-checkbox mc-field__item class-on-li" data-truc="data-on-li">
                <input required="" aria-label="inline 1 Choix numéro 1 : inline 1" type="checkbox" class="mc-checkbox__input  js-form-checkbox" name="test1" id="test1--991--0" aria-describedby="error__test1--991" value="inline checkbox" aria-checked="false">
                <label aria-hidden="true" class="mc-checkbox__label " for="test1--991--0">inline
                </label>
            </li>
            <li class="mc-checkbox mc-field__item class-on-li" data-truc="data-on-li">
            <input required="" aria-label="inline 2 Choix numéro 2 : inline 2" type="checkbox" class="mc-checkbox__input  js-form-checkbox" name="test1" id="test1--991--1" aria-describedby="error__test1--991" value="inline checkbox" aria-checked="false">
                <label aria-hidden="true" class="mc-checkbox__label " for="test1--991--1">inline
                </label>
            </li>
            <li class="mc-checkbox mc-field__item class-on-li" data-truc="data-on-li">
            <input required="" aria-label="inline 3 Choix numéro 3 : inline 3" type="checkbox" class="mc-checkbox__input  js-form-checkbox" name="test1" id="test1--991--2" aria-describedby="error__test1--991" value="inline checkbox" aria-checked="false">
                <label aria-hidden="true" class="mc-checkbox__label " for="test1--991--2">inline
                </label>
            </li>
            <li class="mc-checkbox mc-field__item class-on-li" data-truc="data-on-li">
            <input required="" aria-label="inline 4 Choix numéro 4 : inline 4" type="checkbox" class="mc-checkbox__input  js-form-checkbox" name="test1" id="test1--991--3" aria-describedby="error__test1--991" value="inline checkbox" aria-checked="false">
                <label aria-hidden="true" class="mc-checkbox__label " for="test1--991--3">inline
                </label>
            </li>
        </ul>
    </fieldset>
    <p class="a-subtitle"><br /><br />Checkbox alone<br /><br /></p>
        <div class="mc-checkbox toto-1" data-toto="toto-1">
            <input aria-label="triste Choix numéro 1 : triste" type="checkbox" class="mc-checkbox__input mc-checkbox innerClass-input js-form-checkbox" name="test1" id="test1--991--0" aria-describedby="error__test1--991" value="Je suis triste" aria-checked="false" data-truc="truc-on-input">
            <label aria-hidden="true" class="mc-checkbox__label  innerClass-label" for="test1--991--0" data-truc="truc-on-label">i'm alone
                    <span class="mc-checkbox__suffix-label  class-inner-suffix" data-test="data-attribute-suffix">
                    (yes, you know...)
                    </span>
            </label>
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

