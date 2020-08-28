## How to use

>  Show **block price for a product** (product page, tile product in family page...). 

## File to import

```ftl
<#import "../../macros/common/prices.ftl" as prices>
```

## The Price macro

```ftl
<@prices.price priceInformations = priceInformations isLight = false />
```

### Options

To chose full or light presentation, use `isLight` parameter (Boolean).

```ftl
<#assign priceInformations ={
    "price" : 9999.9, //sell price
    "priceWithoutOffer" : 199.99, //price without offer
    "formattedDiscount" : "-50%", //only if offer
    "priceEndDate" : "1565740800000", //only if offer - java format date
    "currency" :
        {
            "label" : "EUR",
            "value" : "€"
        },
    "unitSale" : "Litre", //expected values : "m²" || "litre" || "unité"...
    "packagingPrice" : 4.66, //only if product have conditionning
    "packagingUnitSale" : "m²", //only if product have conditionning
    "refundsOfferLabel" : "20€ remboursés", //"ODR"
    "type": "GOOD_PURCHASE" //expected values : "FIRST_PRICE", "GOOD_PURCHASE", "STAR_PRODUCT", "DESTOCKING", "OPE_COM", ""
}>
```
