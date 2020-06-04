<ShowHtml>
<svg class="kl-hidden" xmlns="http://www.w3.org/2000/svg"><symbol id="Navigation_Arrow_Arrow--Bottom_24px" viewBox="0 0 24 24"><path d="M12.71,17.21a1,1,0,0,1-1.42,0l-9-9A1,1,0,1,1,3.71,6.79L12,15.09l8.29-8.3a1,1,0,1,1,1.42,1.42Z"></path></symbol></svg>
<div class="example">
    <fieldset role="group" class="km-field">
        <label class="km-field__label" for="liste2--989">
            select (without optgroup)
            <span class="km-field__mention">- Obligatoire</span>
        </label>
        <div class="km-select-wrapper">
            <select class="km-select-wrapper__input" name="liste2--989" id="liste2--989">
                <option value="--">--</option>
                <option value="value1">value 1</option>
                <option value="value2" disabled="">value 2</option>
                <option value="value3" selected="">value 3</option>
            </select>
            <svg class="ku-icon-24 km-select-wrapper__ico"><use href="#Navigation_Arrow_Arrow--Bottom_24px"></use></svg>
        </div>
    </fieldset>
    <fieldset role="group" class="km-field">
        <label class="km-field__label" for="testSelectWithOptgroup--978">
            select (with optgroup)
            <span class="km-field__mention">- Obligatoire</span>
        </label>
        <div class="km-field__select-wrapper km-select-wrapper">
            <select class="km-select-wrapper__input" id="testSelectWithOptgroup--978"
                required="" data-missing="Ce champ est obligatoire" name="testSelectWithOptgroup"
                data-cip-id="cIPJQ342845641">
                <optgroup label="groupLabel1">
                    <option value="inputValue1">option 1</option>
                    <option value="inputValue2">option 2</option>
                    <option value="inputValue3" disabled="">option 3</option>
                </optgroup>
                <optgroup label="groupLabel2">
                    <option value="inputValue4">option 4</option>
                    <option value="inputValue5" selected="">option 5</option>
                </optgroup>
                <optgroup label="groupLabel3" disabled="">
                    <option value="inputValue6">option 6</option>
                    <option value="inputValue7">option 7</option>
                </optgroup>
            </select>
            <svg class="ku-icon-24 km-select-wrapper__ico"><use href="#Navigation_Arrow_Arrow--Bottom_24px"></use></svg>
        </div>
    </fieldset>
</div>
</ShowHtml>

<style lang="scss" scoped>
@import 'node_modules/integration-web-core--socle/css/assets/sass/_common/01-setting-tools/_all-settings';
@import 'node_modules/integration-web-core--socle/css/assets/sass/_common/10-bundles/_form.bundle';
</style>
