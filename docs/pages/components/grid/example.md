<ShowHtml>
<div class="example">
    <h3 class="ka-title-regular-xs example__title">Classical default grid</h3>
    <div class="molecule-1 col-container-inner">
        <div class="elt col-3">col-3</div>
        <div class="elt col-3">col-3</div>
        <div class="elt col-3">col-3</div>
        <div class="elt col-3 col-line-end">col-3 col-line-end</div>
    </div>
    <h3 class="ka-title-regular-xs example__title">Grid with change from breakpoint L</h3>
    <div class="molecule-2 col-container-inner">
        <div class="elt col-2 col-l-6">col-2 col-l-6</div>
        <div class="elt col-3 col-l-6">col-3 col-l-6</div>
        <div class="elt col-3 col-l-6">col-3 col-l-6</div>
        <div class="elt col-4 col-l-6 col-line-end">col-4 col-l-6 col-line-end</div>
    </div>
    <h3 class="ka-title-regular-xs example__title">Grid with offset</h3>
    <div class="molecule-4 col-container-inner">
        <div class="elt col-3 col-start-4">col-3 col-start-4</div>
        <div class="elt col-6 col-line-end">col-6 col-line-end</div>
    </div>
    <h3 class="ka-title-regular-xs example__title">Grid with offset from L</h3>
    <div class="molecule-3 col-container-inner">
        <div class="elt col-6 col-l-6 col-start-l-4">col-6 col-l-6 col-start-l-4</div>
        <div class="elt col-6 col-l-3 col-line-end">col-6 col-l-3 col-line-end</div>
    </div>
</div>
</ShowHtml>

<style lang="scss" scoped>
@import 'node_modules/integration-web-core--socle/css/assets/sass/_common/01-setting-tools/_all-settings';
.example {
    text-align: center;
    &__title {
        margin: 1rem 0;
    }
    .elt {
        padding: 0.5rem 0;
    }
    .molecule {
        &-1 {
            .elt {
                background: paleturquoise;
            }
        }
        &-2 {
            .elt {
                background: palegreen;
            }
        }
        &-3 {
            .elt {
                background: palegoldenrod;
            }
        }
        &-4 {
            .elt {
                background: peachpuff;
            }
        }
    }
}

</style>
