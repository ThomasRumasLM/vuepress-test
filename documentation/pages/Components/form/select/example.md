<template>
<ShowHtml>
<form id="my-form">
<div class="example">
    <p class="a-subtitle">Select option group with fields</p>
    <fieldset class="mc-field toto js-select-wrapper" data-toto="toto">
        <label class="mc-field__label" for="testSelect--975">
            Votre description
            <span class="mc-field__requirement">mandatory</span>
        </label>
        <span class="mc-field__help">Description du champ de formulaire</span>
        <select class="mc-select  mc-field__input js-select-wrapper__input" id="testSelect--975" required=""
            aria-describedby="error__testSelect--975">
            <option value="select one item" data-order="select one item" disabled="" selected="">-- select one item --
            </option>
            <optgroup label="myGroupLabel 1" disabled="">
                <option value="value_1-1">
                    content_1-1
                </option>
                <option value="value_1-2">
                    content_1-2
                </option>
            </optgroup>
            <optgroup label="myGroupLabel 2">
                <option value="value_2-1">
                    content_2-1
                </option>
                <option value="value_2-2">
                    content_2-2
                </option>
                <option value="value_2-3">
                    content_2-3
                </option>
            </optgroup>
        </select>
    </fieldset>
    <p class="a-subtitle">Select simple with fields</p>
    <div class="mc-field toto js-select-wrapper" data-toto="toto">
        <label class="mc-field__label" for="testSelectSimple--973">
            Votre description
        </label>
        <span class="mc-field__help">Description du champ de formulaire</span>
        <select class="mc-select myCustomClass myOtherClass mc-select--s mc-field__input js-select-wrapper__input"
            id="testSelectSimple--973" data-blabla="datatruc" data-blibli="otherDataTruc">
            <option value="select one item" data-order="select one item" disabled="" selected="">-- select one item --
            </option>
            <option value="value_1">
                content_1
            </option>
            <option value="value_2">
                content_2
            </option>
            <option value="value_3">
                content_3
            </option>
        </select>
    </div>
    <p class="a-subtitle">Select with no order option</p>
    <div class="mc-field toto js-select-wrapper" data-toto="toto">
        <label class="mc-field__label" for="testSelectDefault--971">
            Votre description
        </label>
        <span class="mc-field__help">Description du champ de formulaire</span>
        <select class="mc-select  mc-field__input js-select-wrapper__input" id="testSelectDefault--971">
            <option value="value_1">
                content_1
            </option>
            <option value="value_2">
                content_2
            </option>
            <option value="value_3">
                content_3
            </option>
        </select>
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

