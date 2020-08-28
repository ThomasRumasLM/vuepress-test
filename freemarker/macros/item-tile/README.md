# Macro item tile product/service

<br/>

> Find here how to use the macro item tile

## File structure

```bash
└── macros
    └── item-tile
        └── item-tile.ftl
        └── item-tile--brand.ftl
        └── item-tile--delivrance.ftl
        └── item-tile--designation.ftl
        └── item-tile--discount-price-flag.ftl
        └── item-tile--duration.ftl
        └── item-tile--flag.ftl
        └── item-tile--image__default.ftl
        └── item-tile--image__carousel.ftl
        └── item-tile--price.ftl
        └── item-tile--quantity.ftl
        └── item-tile--reflm.ftl
        └── item-tile--refund-wll.ftl
        └── item-tile--reviews-content.ftl
        └── item-tile--reviews-summary.ftl
```
## Item tile structure 

An item tile can be horizontal or vertical. It's composed of blades, some of them are specific to services and others to products but we can't have conditions based on the tile type in the code (a blade is displayed or not).
 
Blades can be ordered as we want with the table `bladesOrder` in the configuration object of the macro. 

If a blade has to be displayed (desk only, mobile only or desk and mobile) the name of the blade has to be present in `bladesOrder`. We use responsive utility classes to hide a blade depending on the device. 

An item tile can be in 3 different orientation : horizontal, vertical or horizotal to vertical (from mobile to desk device). The orientation is set in `orientation` in the configuration object of the macro.
The value can be `v`, `h` or `h-to-v`.

In horizontal orientation, blades can be grouped by column. This will be done automaticly depending on the order in `bladesOrder`. The first blade is IMAGE_DEFAULT.

To fix a button to the bottom of the tile, set `hasBottomButton` to `true`. The last blade will be fix at the bottom of the blade. (Ex: Add to cart button in the cross-sell carousel)

To fit the designation on 2 lines, set `twoLineClamp` to `true` (`3` by default)

## Nomenclature

Here is how to name the blades :  
`item-tile--long-blade-name[__variant].ftl`

The name file has to respect de following rules :  
- all in lowercase  
- prefix by `item-tile--`  
- the name of the blade can contain `-`  
- the variant is prefixed by `__`


Examples :
- The blade "designation" has no variant, name is `item-tile--designation.ftl`
- The blade "image". It's possible to have only an image or only a carousel. Files are named : `item-tile--image__default.ftl` and `item-tile--image__carousel.ftl`.

## Configuration and installation

The macro needs an object config to parameter the item tile.

### Configuration object :

```json
  <#assign defaultConfig = {
    "bladesOrder" : {
      "0": [ "IMAGE__DEFAULT" ],
      "1": [ "BRAND", "FLAG"],
      "2": [ "DESIGNATION", "REVIEWS-SUMMARY", "DURATION", "REVIEWS-CONTENT" ],
      "3": [ "DISCOUNT-PRICE-FLAG", "PRICE", "REFUND-WLL", "DELIVRANCE", "REFLM", "QUANTITY"]
    },
    "bladesConfig" : {
        "1": {
          "display" : "inline"
        }
    },
    "orientation" : "v",
    "lazyload"    : false,
    "quantity"    : true,
    "crossSell"   : false,
    "location"    : "LOREM",
    "hasBottomButton" : false,
    "twoLineClamp"   : false,
    "dataAttributesItemTile" : [
      {
        "name" : "merch-pos",
        "value" : "merch pos value"
      },
      {
        "name" : "merch-name",
        "value" : "merch name value"
      }
    ],
    "dataAttributesAddToCart" : [
      {
        "name" : "cs-override-id",
        "value" : "Content square override id value"
      }
    ]
  }>
```

### Install

To instantiate a macro, import the macro you need. Set the product object and the config object in parameter.

```json
    <#import "../../macros/item-tile/item-tile.ftl" as tile>

    <#assign customConfig = {
      "bladesOrder" : {
        "0": [ "IMAGE__DEFAULT" ],
        "1": [ "BRAND", "FLAG"],
        "2": [ "DESIGNATION", "REVIEWS-SUMMARY" ],
        "3": [ "DISCOUNT-PRICE-FLAG", "PRICE", "REFUND-WLL", "DELIVRANCE" ]
      },
      "bladesConfig" : {
          "1": {
            "display" : "inline"
          }
      },
      "orientation" :  "h-to-v"
    }>

  <@tile.itemtileMacro item=productDatas config=customConfig dataAttributes=dataAttributes/>
```
### Import SCSS

Import the item-tile bundle in your component :

```json
@import "node_modules/integration-web-core--socle/css/assets/sass/_common/10-bundles/_item-tile.bundle.scss";
```

### How to add a link on the tile

To add a link on all the tile you need to have the DESIGNATION blade. Then in your data object :

```json
<#assign productDatas = {
  "designation" : (product.productInfos.designation)!"",
  "url"         : (product.productInfos.url)!""}> 
  ```

### Object Datas example (product)

```json
<#assign productDatas = {
  "designation" : (product.productInfos.designation)!"",
  "url"         : (product.productInfos.url)!"",
  "refLM"       : (product.productInfos.code)!"",
  "image"       : (product.productInfos.media[0].url)!"",
  "brand"       :
    { "label" : (product.productInfos.brand.name)!"",
      "image" : (product.productInfos.brand.url)!""
    },
  "price"       :
  {
    "defaultPrice"              : (product.deliveryInfos.productPrice.price)!"",
    "formattedDiscount"         : (product.deliveryInfos.productPrice.formattedDiscount)!"",
    "formattedPrice"            : (product.deliveryInfos.productPrice.formattedPrice)!"",
    "formattedPriceWithoutOffer": (product.deliveryInfos.productPrice.formattedPriceWithoutOffer)!""
  },
  "quantity" : (product.productInfos.quantity)!1,
  "addToCartStatus" : (product.productInfos.addToCartStatus)!"",
  "pricePolicy" : (product.productInfos.pricePolicy)!"",
  "discount"    : (product.productInfos.discount)!"",
  "flag"        : (product.productInfos.flag)!"",
  "totalReviewCount" : (product.reviewStatisticsInfos.totalReviewCount)!"0"
}>
```

Values for addToCartStatus : "" || "success" || "partiallyOutOfStock" || "outOfStock"
