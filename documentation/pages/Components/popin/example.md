<template>
<ShowHtml :key="componentKey" >
<div class="example">
    <button class="mc-button js-popin-btn-1">
        Popin simple M (générée via Javascript)
    </button>
</div>
<div class="example">
    <button class="mc-button js-popin-btn-2">
        Popin simple S (Générée par le template FTL)
    </button>
    <article class="kl-popin kl-hidden js-mypopin  js-popin" data-name="js-popin-999" tabindex="-1"
        aria-labelledby="js-popin-999-title">
        <div
            class="kl-popin__inner col-12 col-l-6 col-start-l-4 col-xl-4 col-start-xl-5 col-xxl-4 col-start-xxl-5 js-popin-inner">
            <header class="kl-popin__header js-popin-header">
                <button class="kl-popin__close js-close-popin" aria-label="Fermer">
                    <svg class="ku-icon-24 "><use href="#Navigation_Control_Cross_24px"></use></svg>
                </button>
                <h1 class="kl-popin__title ka-title-bold-l" id="js-popin-999-title">
                    Popin préintégrée dans la page
                </h1>
                <h2 class="kl-popin__subtitle">
                    Je suis une popin qui est déjà présente dans la page au
                    chargement
                </h2>
            </header>
            <div class="kl-popin__body js-popin-body">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Praesent ut consectetur leo. Nulla facilisi. Donec dapibus magna
                mauris, eu sagittis nisi venenatis ac. Fusce consequat
                pellentesque ante, id rhoncus turpis sollicitudin quis. Maecenas
                molestie tortor mi, in blandit ligula elementum quis. Cras
                condimentum lobortis mi.
            </div>
            <footer class="kl-popin__footer js-popin-footer">
                <button class="mc-button js-closePopin">Fermer</button>
            </footer>
        </div>
    </article>
</div>
</ShowHtml>
</template>

<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';

.example {
  margin: auto;
  margin-bottom: 1.5rem;
}
</style>

<script>
export default {
    name: "Popin",
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
        // POPIN 1 : JS GENERATED
        const popinConfig = {
            'content': {
                cssClass: '',
                title: 'Popin de démo en taille M',
                subTitle: 'Je suis une popin de démo en taille M',
                contentHTML: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ut consectetur leo. Nulla facilisi. Donec dapibus magna mauris, eu sagittis nisi venenatis ac. Fusce consequat pellentesque ante, id rhoncus turpis sollicitudin quis. Maecenas molestie tortor mi, in blandit ligula elementum quis. Cras condimentum lobortis mi.',
                footerHTML: '<button class="mc-button js-close-popin">Fermer</button>'
            }
        };

        const popinTest1 = new lm.Popin(popinConfig);
        const popinButton1 = document.querySelector('.js-popin-btn-1');
        popinButton1.addEventListener('click', e => { popinTest1.open(); });

        // POPIN 2 : ALLREADY IN DOM
        const popinConfig2 = {
            'content': '.js-mypopin'
        };
        const popinTest2 = new lm.Popin(popinConfig2);
        const popinButton2 = document.querySelector('.js-popin-btn-2');
        popinButton2.addEventListener('click', e => { popinTest2.open(); });
    }
}
</script>