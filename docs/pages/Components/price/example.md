<template>
<ShowHtml>
<!-- Legend -->
<div class="example example--title">
        <p>Type:</p>
        <p>Full:</p>
        <p>Light:</p>
</div>
<!-- Type DEFAULT -->
<div class="example">
        <p>Type "DEFAULT"</p>
        <div class="km-price ">
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
        <div class="km-price  km-price--light">
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
</div>
<!-- Type FIRST_PRICE -->
<div class="example">
        <p>Type "FIRST_PRICE"</p>
        <div class="km-price ">
            <div class="km-price__flag--budget-price">
                1er prix
            </div>
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
        <div class="km-price  km-price--light">
            <div class="km-price__flag--budget-price">
                1er prix
            </div>
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
</div>
<!-- Type GOOD_PURCHASE -->
<div class="example">
        <p>Type "GOOD_PURCHASE"</p>
        <div class="km-price ">
            <div class="km-price__flag--budget-price">
                Meilleur rapport qualité prix
            </div>
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
        <div class="km-price  km-price--light">
            <div class="km-price__flag--budget-price">
                Meilleur rapport qualité prix
            </div>
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
</div>
<!-- Type HIGH_QUALITY -->
<div class="example">
        <p>Type "HIGH_QUALITY"</p>
        <div class="km-price ">
            <div class="km-price__flag--high-quality">
                Prix haute qualité
            </div>
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
        <div class="km-price  km-price--light">
            <div class="km-price__flag--high-quality">
                Prix haute qualité
            </div>
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
</div>
<!-- Type STAR_PRODUCT -->
<div class="example">
        <p>Type "STAR_PRODUCT"</p>
        <div class="km-price ">
            <div class="km-price__flag--star-product">
                Vous êtes certain de faire le bon achat
            </div>
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
        <div class="km-price  km-price--light">
            <div class="km-price__flag--star-product">
                Vous êtes certain de faire le bon achat
            </div>
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
</div>
<!-- Type DESTOCKING -->
<div class="example">
        <p>Type "DESTOCKING"</p>
        <div class="km-price  km-price--discount">
            <div class="km-price__flag--clearance">
                <div class="km-price__flag--clearance-label">déstockage</div>
                <div class="km-price__flag--clearance-amount">
                    - 14 %
                </div>
            </div>
            <p class="km-price__from">
                <span class="km-price__from-without-offer">1 199.99 €</span>
            </p>
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
        <div class="km-price  km-price--light km-price--discount">
            <div class="km-price__flag--clearance">
                <div class="km-price__flag--clearance-label">déstockage</div>
                <div class="km-price__flag--clearance-amount">
                    - 14 %
                </div>
            </div>
            <p class="km-price__from">
                <span class="km-price__from-without-offer">1 199.99 €</span>
            </p>
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
</div>
<!-- Type OPE_COM -->
<div class="example">
        <p>Type "OPE_COM"</p>
        <div class="km-price  km-price--discount">
            <div class="km-price__flag--discount">
                - 14 %
            </div>
            <div class="km-price__flag--discount-end-date">
                Jusqu'au 28 juin
            </div>
            <p class="km-price__from">
                <span class="km-price__from-without-offer">1 199.99 €</span>
            </p>
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
        <div class="km-price  km-price--light km-price--discount">
            <div class="km-price__flag--discount">
                - 14 %
            </div>
            <p class="km-price__from">
                <span class="km-price__from-without-offer">1 199.99 €</span>
            </p>
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
</div>
<!-- Type with refundsOfferLabel -->
<div class="example">
        <p>Type with refundsOfferLabel</p>
        <div class="km-price ">
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
            <div class="km-price__tag-label">
                20€ remboursés
            </div>
        </div>
        <div class="km-price  km-price--light">
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
            <div class="km-price__tag-label">
                20€ remboursés
            </div>
        </div>
</div>
<!-- Price style -->
<div class="example">
        <p>Price style</p>
        <div class="km-price ">
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € par le carton">
                    9 999.90 €</span>
                <span class="km-price__primary-unit-sale" aria-hidden="true">/ le carton</span>
            </p>
            <p class="km-price__secondary">
                Soit 4.66 €
                <span>/ m²</span>
            </p>
        </div>
        <div class="km-price  km-price--light">
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € par le carton">
                    9 999.90 €</span>
                <span class="km-price__primary-unit-sale" aria-hidden="true">/ le carton</span>
            </p>
            <p class="km-price__secondary">
                Soit 4.66 €
                <span>/ m²</span>
            </p>
        </div>
</div>
<!-- D3E mobilier -->
<div class="example">
        <p>D3E mobilier</p>
        <div class="km-price ">
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
            <div class="km-price__eco-part">
                dont 0.20 €
                <button class="mc-link km-price__eco-part-link js-popin-deee__button">
                    éco-part au recyclage des meubles
                    <svg class="kl-hidden" xmlns="http://www.w3.org/2000/svg"><symbol id="Navigation_Notification_Information_24px" viewBox="0 0 24 24"><path d="M12 22a10 10 0 1110-10 10 10 0 01-10 10zm0-18a8 8 0 108 8 8 8 0 00-8-8z"></path><path d="M12 17a1 1 0 01-1-1v-4.39a1 1 0 012 0V16a1 1 0 01-1 1z"></path><circle cx="12" cy="8" r="1"></circle></symbol></svg>
                    <svg class="ku-icon-24 km-price__eco-part-link-icon"><use href="#Navigation_Notification_Information_24px"></use></svg>
                </button>
                <article class="kl-popin kl-hidden js-popin-deee kl-popin--fullscreen js-popin" data-name="js-popin-999"
                    tabindex="-1" role="dialog" aria-labelledby="js-popin-999-title">
                    <div
                        class="kl-popin__inner col-12 col-l-10 col-start-l-2 col-xl-6 col-start-xl-4 col-xxl-6 col-start-xxl-4  js-popin-inner">
                        <header class="kl-popin__header js-popin-header ">
                            <button class="kl-popin__close js-close-popin" aria-label="Fermer">
                                <svg class="ku-icon-24 "><use href="#Navigation_Control_Cross_24px"></use></svg>
                            </button>
                            <h1 class="kl-popin__title ka-title-bold-l" id="js-popin-999-title">
                                Éco-participation sur le mobilier
                            </h1>
                        </header>
                        <div class="kl-popin__body js-popin-body ">
                            Depuis le 1er mai 2013, tout mobilier neuf vendu est
                            soumis à l’éco-participation. Son montant est ajouté
                            au prix de vente du produit, et est reversé à
                            Eco-mobilier un éco-organisme agréé par l’Etat qui a
                            pour vocation de collecter et valoriser le mobilier
                            usagé en lui offrant une 2ème vie, en le recyclant
                            ou en l’utilisant comme source d’énergie. Ce montant
                            varie selon le produit et le type de traitement
                            qu'il nécessite.
                        </div>
                    </div>
                </article>
            </div>
        </div>
        <div class="km-price  km-price--light">
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
</div>
<!-- D3E DDS -->
<div class="example">
        <p>D3E DDS</p>
        <div class="km-price ">
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
            <div class="km-price__eco-part">
                dont 0.20 €
                <button class="mc-link km-price__eco-part-link js-popin-deee__button">
                    éco-part au recyclage des DDS
                    <svg class="ku-icon-24 km-price__eco-part-link-icon"><use href="#Navigation_Notification_Information_24px"></use></svg>
                </button>
                <article class="kl-popin kl-hidden js-popin-deee kl-popin--fullscreen js-popin" data-name="js-popin-998"
                    tabindex="-1" role="dialog" aria-labelledby="js-popin-998-title">
                    <div
                        class="kl-popin__inner col-12 col-l-10 col-start-l-2 col-xl-6 col-start-xl-4 col-xxl-6 col-start-xxl-4  js-popin-inner">
                        <header class="kl-popin__header js-popin-header ">
                            <button class="kl-popin__close js-close-popin" aria-label="Fermer">
                                <svg class="ku-icon-24 "><use href="#Navigation_Control_Cross_24px"></use></svg>
                            </button>
                            <h1 class="kl-popin__title ka-title-bold-l" id="js-popin-998-title">
                                Éco-participations Déchets Diffus Spécifiques
                            </h1>
                        </header>
                        <div class="kl-popin__body js-popin-body ">
                            Les produits chimiques pouvant présenter un risque
                            significatif pour la santé et l’environnement sont
                            soumis à l’éco-participation DDS (Déchets Diffus
                            Spécifiques ménagers). Celle-ci est reversée à
                            EcoDDS, un éco-organisme chargé de collecter et
                            traiter les DDS.
                        </div>
                    </div>
                </article>
            </div>
        </div>
        <div class="km-price  km-price--light">
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
</div>
<!-- D3E multiple -->
<div class="example">
        <p>D3E multiple</p>
        <div class="km-price ">
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
            <div class="km-price__eco-part">
                dont 0.20 €
                <button class="mc-link km-price__eco-part-link js-popin-deee__button">
                    éco-participation
                    <svg class="ku-icon-24 km-price__eco-part-link-icon"><use href="#Navigation_Notification_Information_24px"></use></svg>
                </button>
                <article class="kl-popin kl-hidden js-popin-deee kl-popin--fullscreen js-popin" data-name="js-popin-997"
                    tabindex="-1" role="dialog" aria-labelledby="js-popin-997-title">
                    <div
                        class="kl-popin__inner col-12 col-l-10 col-start-l-2 col-xl-6 col-start-xl-4 col-xxl-6 col-start-xxl-4  js-popin-inner">
                        <header class="kl-popin__header js-popin-header ">
                            <button class="kl-popin__close js-close-popin" aria-label="Fermer">
                                <svg class="ku-icon-24 "><use href="#Navigation_Control_Cross_24px"></use></svg>
                            </button>
                            <h1 class="kl-popin__title ka-title-bold-l" id="js-popin-997-title">
                                Éco-participations
                            </h1>
                        </header>
                        <div class="kl-popin__body js-popin-body ">
                            L'éco-participation est un montant ajouté au prix de
                            vente du produit. Ce montant est reversé à un
                            éco-organisme agréé par l'Etat, et permet de
                            financer la collecte, le recyclage et la dépollution
                            des meubles et des équipements électriques et
                            électroniques.
                        </div>
                    </div>
                </article>
            </div>
        </div>
        <div class="km-price  km-price--light">
            <p class="km-price__primary">
                <span data-cerberus="ELEM_PRIX" aria-label="9 999,90 € ">
                    9 999.90 €</span>
            </p>
        </div>
</div>
</ShowHtml>
</template>

<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/06-molecules/price.molecules';
@import 'css/assets/sass/_common/10-bundles/item-tile.bundle';

.example {
  display: flex;
  justify-content: space-between;
  padding: 2rem;
  border-bottom: 1px solid $grey-200;

  &--title {
    @include set-font-scale('06', 'l');

    font-weight: get-font-weight(bold);
  }
}
</style>