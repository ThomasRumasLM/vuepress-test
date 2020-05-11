<#import "common-macro.ftl" as macros>
<#import "icons.ftl" as icons>
<#include "tools/_format-price.function.ftl" />
<#--
    DEPRECATED, use showPrice instead

    price : show block price for a product (product page, tile product in family page...)

    @param priceInformations
        "priceInformations" : {
            "price" : 9999.9,					                sell price
            "priceWithoutOffer" : 199.99,                       price without offer
            "formattedDiscount" : "-50%",                       only if offer
            "priceEndDate" : "1565740800000",                   only if offer
            "currency" :
                {
                    "label" : "EUR",
                    "value" : "€"
                },
            "unitSale" : "Litre",					            expected values : "m²" || "litre" || "unité"...
            "packagingPrice" : 4.66,		                    only if product have conditionning
            "packagingUnitSale" : "m²",			                only if product have conditionning
            "refundsOfferLabel" : "20€ remboursés",	            "ODR"
            "type": "GOOD_PURCHASE", 		                            expected values : "FIRST_PRICE", "GOOD_PURCHASE", "STAR_PRODUCT", "DESTOCKING", "OPE_COM", ""
            "ecoPart" :
                {
                    "type": 1,                                  type of DEEE
                    "price": 0.2                                amount of DEEE
                }
        }
    @param isLight{Boolean} - If full or light presentation
-->

<#macro price priceInformations isLight>
    <#-- Prepare data -->
    <#assign cssClass = "" />
    <#if isLight == true>
        <#assign cssClass = cssClass + " km-price--light" />
    </#if>
    <#if (priceInformations.formattedDiscount)?? && priceInformations.formattedDiscount != "">
        <#assign cssClass = cssClass + " km-price--discount" />
    </#if>

    <div class="km-price ${cssClass}">
        <#switch priceInformations.type>
            <#case "FIRST_PRICE">
                <div class="km-price__flag--budget-price">
                    1er prix
                </div>
            <#break>
            <#case "GOOD_PURCHASE">
                <div class="km-price__flag--budget-price">
                    Meilleur rapport qualité prix
                </div>
            <#break>
            <#case "HIGH_QUALITY">
                <div class="km-price__flag--high-quality">
                Prix haute qualité
                </div>
            <#break>
            <#case "STAR_PRODUCT">
                <div class="km-price__flag--star-product">
                    Vous êtes certain de faire le bon achat
                </div>
            <#break>
            <#case "DESTOCKING">
                <div class="km-price__flag--clearance">
                    <div class="km-price__flag--clearance-label">déstockage</div>
                    <div class="km-price__flag--clearance-amount">
                        ${priceInformations.formattedDiscount}
                    </div>
                </div>
            <#break>
            <#case "OPE_COM">
                <div class="km-price__flag--discount">
                    ${priceInformations.formattedDiscount}
                </div>
                <#if isLight == false>
                    <div class="km-price__flag--discount-end-date">Jusqu'au ${priceInformations.priceEndDate?string["dd MMMM"]}</div>
                </#if>
            <#break>
        </#switch>

        <#-- price -->
        <#if (priceInformations.priceWithoutOffer)??>
            <p class="km-price__from">
                <span class="km-price__from-without-offer">${formatPrice(priceInformations.priceWithoutOffer, priceInformations.currency.value)}</span>
            </p>
        </#if>
        <#if (priceInformations.price)??>
            <#assign priceAriaLabel = priceInformations.price?string[",##0.00;; decimalSeparator=',' groupingSeparator=' '"] + " " + priceInformations.currency.value/>
            <p class="km-price__primary">
                <span <@macros.cerberus attributeValue="ELEM_PRIX" />
                aria-label="${priceAriaLabel} <#if (priceInformations.unitSale)?? && priceInformations.unitSale != "">par ${priceInformations.unitSale}</#if>"
                >
                ${formatPrice(priceInformations.price, priceInformations.currency.value)}</span>
                <#if (priceInformations.unitSale)?? && priceInformations.unitSale != "">
                    <span class="km-price__primary-unit-sale" aria-hidden="true">/ ${priceInformations.unitSale}</span>
                </#if>
            </p>
        </#if>

        <#-- Secondary price -->
        <#if (priceInformations.packagingPrice)??>
            <p class="km-price__secondary">
                Soit ${formatPrice(priceInformations.packagingPrice, priceInformations.currency.value)}
                <#if (priceInformations.packagingUnitSale)?? && priceInformations.packagingUnitSale != "">
                    <span>/ ${priceInformations.packagingUnitSale}</span>
                </#if>
            </p>
        </#if>

        <#-- eco-part -->
        <#if isLight == false && (priceInformations.ecoPart)??>
            <#if (priceInformations.ecoPart.type)?? && priceInformations.ecoPart.type?string == "0">
                <#assign labelEcoPart ="éco-part au recyclage des D3E" />
                <#assign titleEcoPart>Éco-participation DEEE</#assign>
                <#assign textEcoPart>
                    Depuis le 15 novembre 2006, tous les produits électriques et électroniques vendus aux ménages sont soumis à l'éco-participation DEEE (Déchets d'Equipements Electriques et Electroniques). L’éco-participation est indiquée sur les étiquettes de manière visible et séparée du prix du produit. Celle-ci permet de financer la collecte, le recyclage et la dépollution de ces produits. Son montant varie selon le produit et le type de traitement qu'il nécessite.
                </#assign>
            <#elseif (priceInformations.ecoPart.type)?? && priceInformations.ecoPart.type?string == "1">
                <#assign labelEcoPart ="éco-part au recyclage des meubles" />
                <#assign titleEcoPart>Éco-participation sur le mobilier</#assign>
                <#assign textEcoPart>
                    Depuis le 1er mai 2013, tout mobilier neuf vendu est soumis à l’éco-participation. Son montant est ajouté au prix de vente du produit, et est reversé à Eco-mobilier un éco-organisme agréé par l’Etat qui a pour vocation de collecter et valoriser le mobilier usagé en lui offrant une 2ème vie, en le recyclant ou en l’utilisant comme source d’énergie. Ce montant varie selon le produit et le type de traitement qu'il nécessite.
                </#assign>
            <#elseif (priceInformations.ecoPart.type)?? && priceInformations.ecoPart.type?string == "2">
                <#assign labelEcoPart ="éco-part au recyclage des DDS" />
                <#assign titleEcoPart>Éco-participations Déchets Diffus Spécifiques</#assign>
                <#assign textEcoPart>
                    Les produits chimiques pouvant présenter un risque significatif pour la santé et l’environnement sont soumis à l’éco-participation DDS (Déchets Diffus Spécifiques ménagers). Celle-ci est reversée à EcoDDS, un éco-organisme chargé de collecter et traiter les DDS.
                </#assign>
            <#else>
                <#assign labelEcoPart ="éco-participation" />
                <#assign titleEcoPart>Éco-participations</#assign>
                <#assign textEcoPart>
                    L'éco-participation est un montant ajouté au prix de vente du produit. Ce montant est reversé à un éco-organisme agréé par l'Etat, et permet de financer la collecte, le recyclage et la dépollution des meubles et des équipements électriques et électroniques.
                </#assign>
            </#if>

            <#assign confPopin = {
                "title": "${titleEcoPart}",
                "footerHTML": "",
                "cssClass": {
                    "popin": "js-popin-deee"
                },
                "desktopSize": "m",
                "fullscreen": true,
                "blocked": false,
                "role": "dialog"
            }>

            <div class="km-price__eco-part">
                dont ${formatPrice(priceInformations.ecoPart.price, priceInformations.currency.value)}
                <button class="ka-link km-price__eco-part-link js-popin-deee__button">
                    ${labelEcoPart}
                    <@icons.icon iconPath="Navigation_Notification_Information_24px" class="km-price__eco-part-link-icon" />
                </button>
                <@macros.popin confPopin>
                    ${textEcoPart}
                </@macros.popin>
            </div>
        </#if>

        <#-- Capsule -->
        <#if (priceInformations.refundsOfferLabel)??>
            <div class="km-price__tag-label">
                ${priceInformations.refundsOfferLabel}
            </div>
        </#if>
    </div>
</#macro>

<#--
    showPrice : show block price for a product with new opus'datas (product page, tile product in family page...)
    @param showPriceInformations
        "showPriceInformations" : {
            "mainPrice" : 9999.9,					            sell price
            "mainPriceUnit" : "Litre",					        expected values : "m²" || "litre" || "unité"...
            "priceWithoutOffer" : 199.99,                       price without offer
            "priceEndDate" : "1565740800000",                   only if offer
            "currency" :
                {
                    "label" : "EUR",
                    "value" : "€"
                },
            "displayDiscount":
                {
                    "type": "PERCENTAGE",
                    "value": 14
                },
            "secondaryPrice" : 4.66,		                    only if product have conditionning
            "secondaryPriceUnit" : "m²",			            only if product have conditionning
            "refundsOfferLabel" : "20€ remboursés",	            "ODR"
            "type": "GOOD_PURCHASE", 		                    expected values : "FIRST_PRICE", "GOOD_PURCHASE", "STAR_PRODUCT", "DESTOCKING", "OPE_COM", "DISCOUNT" , ""
            "ecoPart" :
                {
                    "type": 1,                                  type of DEEE
                    "price": 0.2                                amount of DEEE
                }
        }
    @param isLight{Boolean} - If full or light presentation
-->

<#macro showPrice showPriceInformations isLight>
    <#-- Prepare data -->
    <#assign cssClass = "" />
    <#if isLight == true>
        <#assign cssClass = cssClass + " km-price--light" />
    </#if>
    <#if (showPriceInformations.displayDiscount)??>
        <#assign cssClass = cssClass + " km-price--discount" />
    </#if>

    <div class="km-price ${cssClass}">
        <#switch showPriceInformations.type>
            <#case "FIRST_PRICE">
                <div class="km-price__flag--budget-price">
                    1er prix
                </div>
            <#break>
            <#case "GOOD_PURCHASE">
                <div class="km-price__flag--best-value">
                    Meilleur rapport qualité prix
                </div>
            <#break>
            <#case "HIGH_QUALITY">
                <div class="km-price__flag--high-quality">
                Prix haute qualité
                </div>
            <#break>
            <#case "STAR_PRODUCT">
                <div class="km-price__flag--star-product">
                    Vous êtes certain de faire le bon achat
                </div>
            <#break>
            <#case "DESTOCKING">
                <#if (showPriceInformations.displayDiscount)??>
                    <div class="km-price__flag--clearance">
                        <div class="km-price__flag--clearance-label">déstockage</div>
                        <div class="km-price__flag--clearance-amount">
                            <#if showPriceInformations.displayDiscount.type = "PERCENTAGE">
                                <#assign discountUnitLabel = "%" />
                            <#else>
                                <#assign discountUnitLabel = showPriceInformations.currency.value />
                            </#if>
                            - ${showPriceInformations.displayDiscount.value?string["0"]} ${discountUnitLabel}
                        </div>
                    </div>
                </#if>
            <#break>
            <#case "OPE_COM">
                <#if (showPriceInformations.displayDiscount)??>
                    <div class="km-price__flag--discount">
                        <#if showPriceInformations.displayDiscount.type = "PERCENTAGE">
                            <#assign discountUnitLabel = "%" />
                        <#else>
                            <#assign discountUnitLabel = showPriceInformations.currency.value />
                        </#if>
                        - ${showPriceInformations.displayDiscount.value?string["0"]} ${discountUnitLabel}
                    </div>
                    <#if isLight == false>
                        <div class="km-price__flag--discount-end-date">Jusqu'au ${showPriceInformations.priceEndDate?string["dd MMMM"]}</div>
                    </#if>
                </#if>
            <#break>
            <#case "DISCOUNT">
                <#if (showPriceInformations.displayDiscount)??>
                    <div class="km-price__flag--discount">
                        <#if showPriceInformations.displayDiscount.type = "PERCENTAGE">
                            <#assign discountUnitLabel = "%" />
                        <#else>
                            <#assign discountUnitLabel = showPriceInformations.currency.value />
                        </#if>
                        - ${showPriceInformations.displayDiscount.value?string["0"]} ${discountUnitLabel}
                    </div>
                </#if>
            <#break>
        </#switch>

        <#-- price -->
        <#if (showPriceInformations.priceWithoutOffer)??>
            <p class="km-price__from">
                <span class="km-price__from-without-offer">${formatPrice(showPriceInformations.priceWithoutOffer, showPriceInformations.currency.value)}</span>
            </p>
        </#if>

        <#if (showPriceInformations.mainPrice)??>
            <#assign priceAriaLabel = showPriceInformations.mainPrice?string[",##0.00;; decimalSeparator=',' groupingSeparator=' '"] + " " + showPriceInformations.currency.value/>
            <p class="km-price__primary">
                <span <@macros.cerberus attributeValue="ELEM_PRIX" />
                aria-label="${priceAriaLabel} <#if (showPriceInformations.mainPriceUnit)?? && showPriceInformations.mainPriceUnit != "">par ${showPriceInformations.mainPriceUnit}</#if>"
                >
                ${formatPrice(showPriceInformations.mainPrice, showPriceInformations.currency.value)}</span>
                <#if (showPriceInformations.mainPriceUnit)?? && showPriceInformations.mainPriceUnit != "">
                    <span class="km-price__primary-unit-sale" aria-hidden="true">/ ${showPriceInformations.mainPriceUnit}</span>
                </#if>
            </p>
        </#if>

        <#-- Secondary price -->
        <#if (showPriceInformations.secondaryPrice)??>
            <p class="km-price__secondary">
                Soit ${formatPrice(showPriceInformations.secondaryPrice, showPriceInformations.currency.value)}
                <#if (showPriceInformations.secondaryPriceUnit)?? && showPriceInformations.secondaryPriceUnit != "">
                    <span>/ ${showPriceInformations.secondaryPriceUnit}</span>
                </#if>
            </p>
        </#if>

        <#-- eco-part -->
        <#if isLight == false && (showPriceInformations.ecoPart)??>
            <#if (showPriceInformations.ecoPart.type)?? && showPriceInformations.ecoPart.type?string == "0">
                <#assign labelEcoPart ="éco-part au recyclage des D3E" />
                <#assign titleEcoPart>Éco-participation DEEE</#assign>
                <#assign textEcoPart>
                    Depuis le 15 novembre 2006, tous les produits électriques et électroniques vendus aux ménages sont soumis à l'éco-participation DEEE (Déchets d'Equipements Electriques et Electroniques). L’éco-participation est indiquée sur les étiquettes de manière visible et séparée du prix du produit. Celle-ci permet de financer la collecte, le recyclage et la dépollution de ces produits. Son montant varie selon le produit et le type de traitement qu'il nécessite.
                </#assign>
            <#elseif (showPriceInformations.ecoPart.type)?? && showPriceInformations.ecoPart.type?string == "1">
                <#assign labelEcoPart ="éco-part au recyclage des meubles" />
                <#assign titleEcoPart>Éco-participation sur le mobilier</#assign>
                <#assign textEcoPart>
                    Depuis le 1er mai 2013, tout mobilier neuf vendu est soumis à l’éco-participation. Son montant est ajouté au prix de vente du produit, et est reversé à Eco-mobilier un éco-organisme agréé par l’Etat qui a pour vocation de collecter et valoriser le mobilier usagé en lui offrant une 2ème vie, en le recyclant ou en l’utilisant comme source d’énergie. Ce montant varie selon le produit et le type de traitement qu'il nécessite.
                </#assign>
            <#elseif (showPriceInformations.ecoPart.type)?? && showPriceInformations.ecoPart.type?string == "2">
                <#assign labelEcoPart ="éco-part au recyclage des DDS" />
                <#assign titleEcoPart>Éco-participations Déchets Diffus Spécifiques</#assign>
                <#assign textEcoPart>
                    Les produits chimiques pouvant présenter un risque significatif pour la santé et l’environnement sont soumis à l’éco-participation DDS (Déchets Diffus Spécifiques ménagers). Celle-ci est reversée à EcoDDS, un éco-organisme chargé de collecter et traiter les DDS.
                </#assign>
            <#else>
                <#assign labelEcoPart ="éco-participation" />
                <#assign titleEcoPart>Éco-participations</#assign>
                <#assign textEcoPart>
                    L'éco-participation est un montant ajouté au prix de vente du produit. Ce montant est reversé à un éco-organisme agréé par l'Etat, et permet de financer la collecte, le recyclage et la dépollution des meubles et des équipements électriques et électroniques.
                </#assign>
            </#if>

            <#assign confPopin = {
                "title": "${titleEcoPart}",
                "footerHTML": "",
                "cssClass": {
                    "popin": "js-popin-deee"
                },
                "desktopSize": "m",
                "fullscreen": true,
                "blocked": false,
                "role": "dialog"
            }>

            <div class="km-price__eco-part">
                dont ${formatPrice(showPriceInformations.ecoPart.price, showPriceInformations.currency.value)}
                <button class="ka-link km-price__eco-part-link js-popin-deee__button">
                    ${labelEcoPart}
                    <@icons.icon iconPath="Navigation_Notification_Information_24px" class="km-price__eco-part-link-icon" />
                </button>
                <@macros.popin confPopin>
                    ${textEcoPart}
                </@macros.popin>
            </div>
        </#if>

        <#-- Capsule -->
        <#if (showPriceInformations.refundsOfferLabel)??>
            <div class="km-price__tag-label">
                ${showPriceInformations.refundsOfferLabel}
            </div>
        </#if>
    </div>
</#macro>
