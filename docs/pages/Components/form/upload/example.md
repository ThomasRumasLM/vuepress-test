<template>
<ShowHtml>
<form id="my-form">
<div class="example">
    <div class="km-field__wrapper km-input km-input--upload js-input-wrapper__upload-area">
        <svg class="kl-hidden" xmlns="http://www.w3.org/2000/svg">
      <symbol id="Navigation_Publish_Trashbin_24px" viewBox="0 0 24 24">
        <path d="M18.08,8A1,1,0,0,0,17,8.92L16.08,20H7.92L7,8.92a1,1,0,1,0-2,.16l1,12A1,1,0,0,0,7,22H17a1,1,0,0,0,1-.92l1-12A1,1,0,0,0,18.08,8Z"></path>
        <path d="M19,5H15.23l-.65-2.27a1,1,0,0,0-1-.73H10.38a1,1,0,0,0-1,.73L8.77,5H5A1,1,0,0,0,5,7H19a1,1,0,0,0,0-2ZM10.38,3h3.24l.57,2H9.81Z"></path>
        <path d="M12.5,18V10a.5.5,0,0,0-1,0v8a.5.5,0,0,0,1,0Z"></path>
        <path d="M14.25,18.5a.5.5,0,0,0,.5-.47l.5-8a.5.5,0,0,0-.47-.53.49.49,0,0,0-.53.47l-.5,8a.5.5,0,0,0,.47.53Z"></path>
        <path d="M9.75,18.5h0a.5.5,0,0,0,.47-.53l-.5-8a.49.49,0,0,0-.53-.47.5.5,0,0,0-.47.53l.5,8A.5.5,0,0,0,9.75,18.5Z"></path>
      </symbol>
    </svg>
        <input aria-label="Votre pièce jointe Cliquez pour choisir un  fichier sur votre appareil" data-size="4000" type="file" id="attachments--972" class="km-input__upload js-input-upload" name="attachments" accept="image/jpg, image/png, image/gif, application/pdf"
            data-mismatch="Ce champ ne respecte pas le format attendu : ">
        <input type="hidden" id="attachments--972__allowed_files" name="attachments__allowed_files">
        <span class="km-input__instructions" aria-hidden="true">
      <svg class="kl-hidden" xmlns="http://www.w3.org/2000/svg">
        <symbol id="Navigation_Control_Circle--More_32px" viewBox="0 0 32 32">
          <path d="M16,3A13,13,0,1,0,29,16,13,13,0,0,0,16,3Zm0,24A11,11,0,1,1,27,16,11,11,0,0,1,16,27Z"></path>
          <path d="M20,15H17V12a1,1,0,0,0-2,0v3H12a1,1,0,0,0,0,2h3v3a1,1,0,0,0,2,0V17h3a1,1,0,0,0,0-2Z"></path>
        </symbol>
      </svg>
      <svg class="ku-icon-32 km-input__instructions__ico">
        <use href="#Navigation_Control_Circle--More_32px"></use>
      </svg>
      Drag &amp; drop or click to choose a file
    </span>
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

