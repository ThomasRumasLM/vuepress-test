<template>
<ShowHtml :key="componentKey" >
<form id="my-form">
<div class="mc-field">
  <label class="mc-field__label kl-tooltip" for="input1--993">
    Votre nom
    <span class="kl-tooltip__container">
      <button class="js-tooltip__button kl-tooltip__button
          m-mon-context__button
          " type="button" aria-label="Lire l'info bulle">
        <span class="js-tooltip__pointer is-tooltip-hidden kl-tooltip__pointer  kl-tooltip__pointer--bottom"></span>
        <svg class="ku-icon-24 m-mon-context__icon"><use href="#Navigation_Notification_Information_24px"></use></svg>
      </button>
      <span class="js-tooltip__wrapper kl-tooltip__wrapper is-tooltip-hidden  kl-tooltip__wrapper--bottom">
        <button class="js-tooltip__close-button kl-tooltip__close" type="button" aria-label="Fermer l'info bulle">
          <svg class="ku-icon-16 "><use href="#Navigation_Control_Cross_16px"></use></svg>
        </button>
        <div class="m-mon-context__content kl-tooltip__content">
          Ma jolie tooltip
        </div>
      </span>
    </span>
    <span class="mc-field__requirement">mandatory</span>
  </label>
  <span class="mc-field__help">Inscrivez ici votre nom de famille</span>
  <input type="text" id="input1--993" name="input1"
    class="mc-text-input js-form-input mc-field__input js-input-criterion" placeholder="Dupont" aria-label="Votre nom"
    data-missing="Ce champ est obligatoire" data-mismatch="Ce champ ne respecte pas le format attendu : "
    pattern="([a-zA-Z0-9_\-éèëêàâäôöùûüîïç' ]*)" required="">
  <ul class="km-field__criteria-list">
    <li class="km-field__criteria-list__item is-invalid" data-pattern="(.*[a-z]){8,}"><span
        class="ka-bullet km-field__criteria-list__bullet" aria-label="Critère à valider : 8 caractères minimum"></span>
      8 caractères minimum</li>
    <li class="km-field__criteria-list__item is-invalid" data-pattern="(.*[A-Z]){1,}"><span
        class="ka-bullet km-field__criteria-list__bullet" aria-label="Critère à valider : 1 majuscule minimum"></span>
      1 majuscule minimum</li>
    <li class="km-field__criteria-list__item is-invalid" data-pattern="(.*[0-9]){1,}"><span
        class="ka-bullet km-field__criteria-list__bullet" aria-label="Critère à valider : 1 chiffre minimum"></span> 1
      chiffre minimum</li>
  </ul>
</div>
<div class="mc-field">
  <label class="mc-field__label" for="smallinput--991">
    Votre nom
    <span class="mc-field__requirement">mandatory</span>
  </label>
  <span class="mc-field__help">Inscrivez ici votre nom de famille</span>
  <input type="text" id="smallinput--991" name="smallinput"
    class="mc-text-input js-form-input mc-field__input mc-text-input--s" placeholder="Dupont" aria-label="Votre nom"
    data-missing="Ce champ est obligatoire" data-mismatch="Ce champ ne respecte pas le format attendu : "
    pattern="([a-zA-Z0-9_\-éèëêàâäôöùûüîïç' ]*)" required="">
</div>
<div class="mc-field">
  <label class="mc-field__label" for="basicInput--989">
    Votre nom
    <span class="mc-field__requirement">mandatory</span>
  </label>
  <span class="mc-field__help">Inscrivez ici votre nom de famille</span>
  <input type="text" id="basicInput--989" name="basicInput" class="mc-text-input js-form-input mc-field__input"
    placeholder="Dupont" aria-label="Votre nom"
    data-missing="Veuillez renseigner un nombre valide compris entre 0 et 10"
    data-mismatch="Veuillez renseigner un nombre valide compris entre 0 et 10" pattern="[0-9]+([\.,][0-9]{1,2})?"
    required="">
</div>
<div class="mc-field">
  <label class="mc-field__label kl-tooltip" for="name--986">
    Votre nom
    <span class="kl-tooltip__container">
      <button class="js-tooltip__button kl-tooltip__button m-mon-context__button
          " type="button" aria-label="Lire l'info bulle">
        <span class="js-tooltip__pointer is-tooltip-hidden kl-tooltip__pointer  kl-tooltip__pointer--bottom"></span>
        <svg class="ku-icon-24 m-mon-context__icon"><use href="#Navigation_Notification_Information_24px"></use></svg>
      </button>
      <span class="js-tooltip__wrapper kl-tooltip__wrapper is-tooltip-hidden  kl-tooltip__wrapper--bottom">
        <button class="js-tooltip__close-button kl-tooltip__close" type="button" aria-label="Fermer l'info bulle">
          <svg class="ku-icon-16 "><use href="#Navigation_Control_Cross_16px"></use></svg>
        </button>
        <div class="m-mon-context__content kl-tooltip__content">
          Ma jolie tooltip
        </div>
      </span>
    </span>
    <span class="mc-field__requirement">mandatory</span>
  </label>
  <span class="mc-field__help">Inscrivez ici votre nom de famille</span>
  <div class="mc-left-icon-input">
    <svg class="ku-icon-24 mc-left-icon-input__icon"><use href="#Media_Camera_24px"></use></svg>
    <input type="text" id="name--986" name="name"
      class="mc-text-input js-form-input mc-left-icon-input__input is-invalid" placeholder="Dupont"
      aria-label="Votre nom" data-missing="Ce champ est obligatoire"
      data-mismatch="Ce champ ne respecte pas le format attendu : " pattern="([a-zA-Z0-9_\-éèëêàâäôöùûüîïç' ]*)"
      required="" aria-describedby="name--986-error">
  </div>
  <span class="mc-field__error-message  js-form-error" id="name--986-error">Ce champ est obligatoire</span>
</div>
<button class="mc-button mc-button--s doc-submit" form="km-form" type="submit"><span class="mc-button__label">Submit</span></button>
</form>
</ShowHtml>
</template>

<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/04-layouts/tooltips.layout';
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
    name: "Input",
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

