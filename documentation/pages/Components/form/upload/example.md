<template>
<ShowHtml :key="componentKey" >
<form id="my-form">
<div class="example">
    <div class="mc-field">
    <label class="mc-field__label" for="testUploadMandatory--969">
            Votre description
            <span class="mc-field__requirement">mandatory</span>
    </label>
        <span class="mc-field__help">Description du champ de formulaire</span>
    <div class="mc-fileuploader">
        <input type="file" aria-label="Select a file to upload" class="mc-fileuploader__input js-input-upload " id="testUploadMandatory--969" data-missing="Veuillez sélectionner un fichier" data-mismatch="Mauvais format de fichier" required="" data-size="2000" accept="image/png, image/jpg, image/jpeg">
        <label for="testUploadMandatory--969" class="mc-fileuploader__label">
            <span class="mc-fileuploader__label--center">Select a file to upload</span>
        </label>
    </div>
    </div>
    <div class="mc-field">
    <label class="mc-field__label" for="testUpload--968">
            Votre description
    </label>
        <span class="mc-field__help">Champs non obligatoire</span>
    <div class="mc-fileuploader">
        <input type="file" aria-label="Select a file to upload" class="mc-fileuploader__input js-input-upload " id="testUpload--968" data-mismatch="Mauvais format de fichier" data-size="2000" accept="image/png, image/jpg, image/jpeg">
        <label for="testUpload--968" class="mc-fileuploader__label">
            <span class="mc-fileuploader__label--center">Select a file to upload</span>
        </label>
    </div>
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
    name: "Upload",
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

