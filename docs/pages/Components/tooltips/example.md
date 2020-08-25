<template>
<ShowHtml>
<div class="example">
    <p class="subtitle">Default behavior (top):</p>
    <div class="kl-tooltip js-tooltip1">
        Example of a default simple tooltip
        <span class="kl-tooltip__container">
            <button class="js-tooltip__button kl-tooltip__button " type="button" aria-label="Lire l'info bulle">
                <span class="js-tooltip__pointer is-tooltip-hidden kl-tooltip__pointer kl-tooltip__pointer--top"></span>
                <svg class="kl-hidden" xmlns="http://www.w3.org/2000/svg">
                    <symbol id="Navigation_Notification_Information_24px" viewBox="0 0 24 24">
                        <path d="M12,22A10,10,0,1,1,22,12,10,10,0,0,1,12,22ZM12,4a8,8,0,1,0,8,8A8,8,0,0,0,12,4Z"></path>
                        <path d="M12,17a1,1,0,0,1-1-1V11.61a1,1,0,0,1,2,0V16A1,1,0,0,1,12,17Z"></path>
                        <circle cx="12" cy="8" r="1"></circle>
                    </symbol>
                </svg>
                <svg class="ku-icon-24 ">
                    <use href="#Navigation_Notification_Information_24px"></use>
                </svg>
            </button>
            <aside class="js-tooltip__wrapper kl-tooltip__wrapper is-tooltip-hidden kl-tooltip__wrapper--top">
                <button class="js-tooltip__close-button kl-tooltip__close" type="button"
                    aria-label="Fermer l'info bulle">
                    <svg class="ku-icon-16 ">
                        <use href="#Navigation_Control_Cross_16px"></use>
                    </svg>
                </button>
                <div class=" kl-tooltip__content">
                    Sample content for my tooltip
                </div>
            </aside>
        </span>
    </div>
</div>
<div class="example">
    <p class="subtitle">Left position:</p>
    <div class="kl-tooltip js-tooltip2">
        Example of tooltip on the left side
        <span class="kl-tooltip__container">
            <button class="js-tooltip__button kl-tooltip__button " type="button" aria-label="Lire l'info bulle">
                <span
                    class="js-tooltip__pointer is-tooltip-hidden kl-tooltip__pointer  kl-tooltip__pointer--left"></span>
                <svg class="ku-icon-24 ">
                    <use href="#Navigation_Notification_Information_24px"></use>
                </svg>
            </button>
            <aside class="js-tooltip__wrapper kl-tooltip__wrapper is-tooltip-hidden  kl-tooltip__wrapper--left">
                <button class="js-tooltip__close-button kl-tooltip__close" type="button"
                    aria-label="Fermer l'info bulle">
                    <svg class="ku-icon-16 ">
                        <use href="#Navigation_Control_Cross_16px"></use>
                    </svg>
                </button>
                <div class=" kl-tooltip__content">
                    Sample content for my tooltip
                </div>
            </aside>
        </span>
    </div>
</div>
<div class="example">
    <p class="subtitle">Right position:</p>
    <div class="kl-tooltip js-tooltip3">
        Example of tooltip on the right side
        <span class="kl-tooltip__container">
            <button class="js-tooltip__button kl-tooltip__button " type="button" aria-label="Lire l'info bulle">
                <span
                    class="js-tooltip__pointer is-tooltip-hidden kl-tooltip__pointer  kl-tooltip__pointer--right"></span>
                <svg class="ku-icon-24 ">
                    <use href="#Navigation_Notification_Information_24px"></use>
                </svg>
            </button>
            <aside class="js-tooltip__wrapper kl-tooltip__wrapper is-tooltip-hidden  kl-tooltip__wrapper--right">
                <button class="js-tooltip__close-button kl-tooltip__close" type="button"
                    aria-label="Fermer l'info bulle">
                    <svg class="ku-icon-16 ">
                        <use href="#Navigation_Control_Cross_16px"></use>
                    </svg>
                </button>
                <div class=" kl-tooltip__content">
                    Sample content for my tooltip
                </div>
            </aside>
        </span>
    </div>
</div>
<div class="example">
    <p class="subtitle">Bottom position</p>
    <div class="kl-tooltip js-tooltip4">
        Example of tooltip on the bottom side
        <span class="kl-tooltip__container">
            <button class="js-tooltip__button kl-tooltip__button " type="button" aria-label="Lire l'info bulle">
                <span
                    class="js-tooltip__pointer is-tooltip-hidden kl-tooltip__pointer  kl-tooltip__pointer--bottom"></span>
                <svg class="ku-icon-24 ">
                    <use href="#Navigation_Notification_Information_24px"></use>
                </svg>
            </button>
            <aside class="js-tooltip__wrapper kl-tooltip__wrapper is-tooltip-hidden  kl-tooltip__wrapper--bottom">
                <button class="js-tooltip__close-button kl-tooltip__close" type="button"
                    aria-label="Fermer l'info bulle">
                    <svg class="ku-icon-16 ">
                        <use href="#Navigation_Control_Cross_16px"></use>
                    </svg>
                </button>
                <div class=" kl-tooltip__content">
                    Sample content for my tooltip
                </div>
            </aside>
        </span>
    </div>
</div>
<div class="example">
    <p class="subtitle">Behavior on click :</p>
    <div class="kl-tooltip js-tooltip5 is-tooltip-click-only">Example of a tooltip that opens only by clicking.
        <span class="kl-tooltip__container">
            <button class="js-tooltip__button kl-tooltip__button " type="button" aria-label="Lire l'info bulle">
                <span class="js-tooltip__pointer is-tooltip-hidden kl-tooltip__pointer kl-tooltip__pointer--top"></span>
                <svg class="ku-icon-24 ">
                    <use href="#Navigation_Notification_Information_24px"></use>
                </svg>
            </button>
            <aside class="js-tooltip__wrapper kl-tooltip__wrapper is-tooltip-hidden kl-tooltip__wrapper--top">
                <button class="js-tooltip__close-button kl-tooltip__close" type="button"
                    aria-label="Fermer l'info bulle">
                    <svg class="ku-icon-16 ">
                        <use href="#Navigation_Control_Cross_16px"></use>
                    </svg>
                </button>
                <div class=" kl-tooltip__content">
                    Sample content for my tooltip
                </div>
            </aside>
        </span>
    </div>
</div>
<div class="example">
    <div class="kl-tooltip js-tooltip6">
        Example of tooltip with overloaded style
        <span class="kl-tooltip__container">
            <button class="js-tooltip__button kl-tooltip__button m-tooltip-blue__button" type="button"
                aria-label="Lire l'info bulle">
                <span class="js-tooltip__pointer is-tooltip-hidden kl-tooltip__pointer kl-tooltip__pointer--top"></span>
                <svg class="ku-icon-24 ">
                    <use href="#Navigation_Notification_Information_24px"></use>
                </svg>
            </button>
            <aside class="js-tooltip__wrapper kl-tooltip__wrapper is-tooltip-hidden kl-tooltip__wrapper--top">
                <button class="js-tooltip__close-button kl-tooltip__close" type="button"
                    aria-label="Fermer l'info bulle">
                    <svg class="ku-icon-16 ">
                        <use href="#Navigation_Control_Cross_16px"></use>
                    </svg>
                </button>
                <div class="m-tooltip-blue__content kl-tooltip__content">
                    Sample content for my tooltip
                </div>
            </aside>
        </span>
    </div>
</div>
<div class="example">
    <p class="subtitle">Custom icon on the left side</p>
    <div class="kl-tooltip js-tooltip7 ">
        <span class="kl-tooltip__container">
            <button class="js-tooltip__button kl-tooltip__button kl-tooltip__button--left m-custom-class__button"
                type="button" aria-label="Lire l'info bulle">
                <span class="js-tooltip__pointer is-tooltip-hidden kl-tooltip__pointer kl-tooltip__pointer--top"></span>
                <svg class="ku-icon-24 m-custom-class__icon">
                    <use href="#Navigation_Notification_Information_24px"></use>
                </svg>
            </button>
            <aside class="js-tooltip__wrapper kl-tooltip__wrapper is-tooltip-hidden kl-tooltip__wrapper--top">
                <button class="js-tooltip__close-button kl-tooltip__close" type="button"
                    aria-label="Fermer l'info bulle">
                    <svg class="ku-icon-16">
                        <use href="#Navigation_Control_Cross_16px"></use>
                    </svg>
                </button>
                <div class=" kl-tooltip__content m-custom-class__content">
                    Sample content for my tooltip
                </div>
            </aside>
        </span>
        Example de tooltip with custom icon on the left side.
    </div>
</div>
<div class="example">
    <p class="subtitle">Hover behavior</p>
    <div class="kl-tooltip js-tooltip8 is-tooltip-texthover ">
        Tooltip example that opens by hovering the texte
        <span class="kl-tooltip__container">
            <button class="js-tooltip__button kl-tooltip__button " type="button" aria-label="Lire l'info bulle">
                <span class="js-tooltip__pointer is-tooltip-hidden kl-tooltip__pointer kl-tooltip__pointer--top"></span>
                <svg class="ku-icon-24 ">
                    <use href="#Navigation_Notification_Information_24px"></use>
                </svg>
            </button>
            <aside class="js-tooltip__wrapper kl-tooltip__wrapper is-tooltip-hidden kl-tooltip__wrapper--top">
                <button class="js-tooltip__close-button kl-tooltip__close" type="button"
                    aria-label="Fermer l'info bulle">
                    <svg class="ku-icon-16 ">
                        <use href="#Navigation_Control_Cross_16px"></use>
                    </svg>
                </button>
                <div class=" kl-tooltip__content">
                    Sample content for my tooltip
                </div>
            </aside>
        </span>
    </div>
</div>
</ShowHtml>
</template>

<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/04-layouts/tooltips.layout';

.example {
  margin: 1rem auto;

  &:first-of-type {
    margin-top: 3rem;
  }

  .m-custom-class {
    &__icon {
      fill: #f00;
    }
  }
}
</style>

<script>

export default {
    mounted () {
        import('../../../../js/assets/modules/_tooltip.class.js')
        .then(m => {
            const TooltipsModule1 = new m.Tooltip({
                element: '.js-tooltip1',
                onOpen: () => { console.log('open'); },
                onClose: () => { console.log('close'); }
            });
    
            new m.Tooltip({ element: '.js-tooltip2' });
            new m.Tooltip({ element: '.js-tooltip3' });
            new m.Tooltip({ element: '.js-tooltip4' });
            new m.Tooltip({ element: '.js-tooltip5' });
            new m.Tooltip({ element: '.js-tooltip6' });
            new m.Tooltip({ element: '.js-tooltip7' });
            new m.Tooltip({ element: '.js-tooltip8' });
        })
        .catch(error => {
            console.log(error)
        });
    }
}
</script>