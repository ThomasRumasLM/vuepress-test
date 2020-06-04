<showHtml>
<div class="example">
    <div class="kl-accordion km-accordion js-accordion" id="accMacro">
        <button class="km-accordion__header js-accordion__header" id="accMacroheader1" tabindex="0" aria-controls="accMacropanel1" role="tab">
            Title 1
            <div class="km-accordion__icon-container js-accordion__icon-container">
            <svg class="ku-icon-32 km-accordion__icon js-accordion__icon js-accordion__icon-more"><use href="#Navigation_Control_More_32px"></use></svg>
            <svg class="ku-icon-32 km-accordion__icon js-accordion__icon js-accordion__icon-less kl-hidden"><use href="#Navigation_Control_Less_32px"></use></svg>
            </div>
        </button>
        <div class="km-accordion__panel js-accordion__panel is-collapsed" id="accMacropanel3" aria-labelledby="accMacroheader3" role="tabpanel" data-panel="1" aria-expanded="false">
            <div class="km-accordion__content">
                ACC CONTENT <br>
                LIGNE 2
            </div>
        </div>
        <button class="km-accordion__header js-accordion__header" id="accMacroheader2" tabindex="0" aria-controls="accMacropanel2" role="tab">
            Title 2
            <div class="km-accordion__icon-container js-accordion__icon-container">
                <svg class="ku-icon-32 km-accordion__icon js-accordion__icon js-accordion__icon-more"><use href="#Navigation_Control_More_32px"></use></svg>
                <svg class="ku-icon-32 km-accordion__icon js-accordion__icon js-accordion__icon-less kl-hidden"><use href="#Navigation_Control_Less_32px"></use></svg>
            </div>
        </button>
        <div class="km-accordion__panel js-accordion__panel is-collapsed" id="accMacropanel3" aria-labelledby="accMacroheader3" role="tabpanel" data-panel="2" aria-expanded="false">
            <div class="km-accordion__content">
                ACC CONTENT <br>
                LIGNE 2
            </div>
        </div>
        <button class="km-accordion__header js-accordion__header" id="accMacroheader3" tabindex="0" aria-controls="accMacropanel3" role="tab">
            Title 3
            <div class="km-accordion__icon-container js-accordion__icon-container">
                <svg class="ku-icon-32 km-accordion__icon js-accordion__icon js-accordion__icon-more"><use href="#Navigation_Control_More_32px"></use></svg>
                <svg class="ku-icon-32 km-accordion__icon js-accordion__icon js-accordion__icon-less kl-hidden"><use href="#Navigation_Control_Less_32px"></use></svg>
            </div>
        </button>
        <div class="km-accordion__panel js-accordion__panel is-collapsed" id="accMacropanel3" aria-labelledby="accMacroheader3" role="tabpanel" data-panel="3" aria-expanded="false">
            <div class="km-accordion__content">
                ACC CONTENT <br>
                LIGNE 2
            </div>
        </div>
    </div>
</div>

</showHtml>

<style lang="scss" scoped>
@import 'node_modules/integration-web-core--socle/css/assets/sass/_common/01-setting-tools/_all-settings';
@import 'node_modules/integration-web-core--socle/css/assets/sass/_common/04-layouts/_accordion.layout';
@import 'node_modules/integration-web-core--socle/css/assets/sass/_common/06-molecules/_accordion.molecule';
</style>

<script>
const accMacro = {id: 'accMacro'};
export default {
    mounted() {
        import('integration-web-core--socle/js/assets/modules/_accordion.js').then(Accordion => {
            new Accordion.default(accMacro);
        })
    }
}
</script>