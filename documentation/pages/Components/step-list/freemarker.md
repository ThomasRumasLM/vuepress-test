## How to use

>  Build a **macro wich generate step**, based on list. 

## File to import

```ftl
<#import "../../macros/common/step.ftl" as step>
```

## The StepsList macro

This has been planned for a minimum of **2 steps** and maximum of **4 steps**, in agreement with the ui/ux designer

```ftl
<#assign unit = [
    {
        "title": "Sélection du produit", //STRING, optional
        "text": "Choisissez une des 3 familles de bois ci-dessous puis sélectionnez votre produit à découper en ligne"  //STRING, mandatory
    },
    {
        "title": "Retrait en magasin", //STRING, optional
        "text": "Rendez-vous en magasin pour retirer votre commande sous 24h" //STRING, mandatory
    }
]>
<@step.stepsList value=unit />

//optional attribute: heading - default="h4" to set title element
<@step.stepsList value=unit heading="h3"/>
```

