## Example

<showHtml>
    <div class="example">
        <h2 class="example__title">Default</h2>
        <button type="button" class="mc-button">
            <span class="mc-button__label">Default</span>
        </button>
        <button type="button" class="mc-button mc-button--bordered">
            <span class="mc-button__label">Default Bordered</span>
        </button>
    </div>
    <div class="example">
        <h2 class="example__title">Campus</h2>
        <button type="button" class="mc-button mc-button--solid-primary-02">
            <span class="mc-button__label">Campus</span>
        </button>
        <button type="button" class="mc-button mc-button--bordered-primary-02">
            <span class="mc-button__label">Campus bordered</span>
        </button>
    </div>
    <div class="example">
        <h2 class="example__title">Neutral</h2>
        <button type="button" class="mc-button mc-button--solid-neutral">
            <span class="mc-button__label">Neutral</span>
        </button>
        <button type="button" class="mc-button mc-button--bordered-neutral">
            <span class="mc-button__label">Neutral bordered</span>
        </button>
    </div>
    <div class="example">
        <h2 class="example__title">Danger</h2>
        <button type="button" class="mc-button mc-button--solid-danger">
            <span class="mc-button__label">Danger</span>
        </button>
        <button type="button" class="mc-button mc-button--bordered-danger">
            <span class="mc-button__label">Danger bordered</span>
        </button>
    </div>
    <div class="example">
        <h2 class="example__title">Sizes</h2>
        <button type="button" class="mc-button mc-button--s">
            <span class="mc-button__label">Button small</span>
        </button>
        <button type="button" class="mc-button">
            <span class="mc-button__label">Button medium</span>
        </button>
        <button type="button" class="mc-button mc-button--l">
            <span class="mc-button__label">Button large</span>
        </button>
    </div>
    <div class="example">
        <h2 class="example__title">Width</h2>
        <button type="button" class="mc-button mc-button--solid-primary-02 mc-button--full">
            <span class="mc-button__label">Button full width</span>
        </button>
    </div>
</showHtml>

<style lang="scss" scoped>
@import 'node_modules/integration-web-core--socle/css/assets/sass/_common/01-setting-tools/all-settings';
.example {
    background: red;
}
</style>

<script>
export default {
    mounted() {
        import('integration-web-core--socle/js/assets/modules/_accordion.js').then(Accordion => {
            new Accordion.default();
        })
    }
}
</script>