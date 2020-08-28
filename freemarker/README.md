# Socle des templates freemarker

## Utilité 
 - Partager le code commun freemarker entre les applications Kobi sous forme de macro
 - Mettre à dispo l'icon-kit et les outils pour l'utiliser
 - Mettre en commun le gitignore des applications

## Postinstall 
 Dans une application KOBI où le socle freemarker est déclaré comme dépendance, après l'installation de la dépendance, le script `postinstall.js` est exécuté.  
 Il copie un certain nom de fichier / dossier dans l'application.  
 La plupart de ces fichiers sont dans le fichier `.gitignore` et ne sont pas commité.  
 L'exception à cette règle st le fichier gitignore lui-même, qui devra donc être commité lors d'une montée en version du socle.

## Contenu

### Icon-kit  
 Il s'agit de l'ensemble des icônes produits pour le design system rangé dans un seul dossier.  
 Ils sont présent dans le socle sous forme de symbole et sont optimisé en amont.
 Les icônes sont au format SVG. Chaque icône peut être décliné en 5 format différents :  
  * 16px
  * 24px
  * 32px
  * 48px
  * 64px

### Gitignore  
 Le gitignore des applications pouvant être amené à changer après des évolutions dans les socles, il est distribué par ce socle à chaque application.
 S'il s'avére nécessaire dans une application d'ajouter des éléments spécifiques, une évolution est possible.

### Macro  
 Afin d'assurer une uniformité des macros globales, une collection de macros communes est distribuée via ce socle.
 Le socle contient les macros suivantes :
  - **cerberus**  
  Cette macro génére un attribut HTML `<data-cerberus="...">`  
  Elle est prévue pour pouvoir n'afficher l'attribut qu'au seul robot / sonde et alléger le code retourné à une internaute. *Cette fonctionnalité est en attente de développement par l'équipe qualité*  
  *Params :*
	 * {String} attributeValue : C'est la valeur de l'attribut à créer  

  Cette macro est disponible dans le fichier `common-macro.ftl`

  *Exemples d'utilisation :*  
  ```freemarker
    <#import "../../macros/common/common-macro.ftl" as macros>
    <a href="" class="-text-grey-light" <@macros.cerberus "LIEN_mentionsLegalesFooter" />>
	    Link label
	</a>
  ```
  ___

  - **Normalize**  
  Cette function transforme une chaîne de caractère pour la normaliser
  *Params :*
   * {String} str : C'est la valeur de l'attribut à créer  
   * {Object} options : Les options de normalisation : 
    - {Bool} spaces : Conserver ou non les espaces (default : false)
    - {Bool/String} punctuation : Conserver, remplacer ou supprimer la ponctuation (default : false)
    - {Bool} accents : Conserver ou non les accents (default : false)
    - {Bool} lowercase : Conserver ou non la casse (default : true)

  Cette macro est disponible dans le fichier `common-macro.ftl`

  *Exemples d'utilisation :*  
  ```freemarker
    <#import "../../macros/common/common-macro.ftl" as macros>
    
    ${macros.normalize("!Salut les pseudo-fêtards, vous êtes à l'heure d'été !")}
        >> salut_les_pseudo_fetards_vous_etes_a_l_heure_d_ete 

    ${macros.normalize("!Salut les pseudo-fêtards, vous êtes à l'heure d'été !", {"spaces": true })}
        >> salut les pseudo_fetards_ vous etes a l_heure d_ete 

    ${macros.normalize("!Salut les pseudo-fêtards, vous êtes à l'heure d'été !", {"punctuation": true })}
        >> !salut_les_pseudo-fetards,_vous_etes_a_l’heure_d’ete_! 

    ${macros.normalize("!Salut les pseudo-fêtards, vous êtes à l'heure d'été !", {"punctuation": "remove" })}
        >> salut_les_pseudofetards_vous_etes_a_lheure_dete

    ${macros.normalize("!Salut les pseudo-fêtards, vous êtes à l'heure d'été !", {"accents": true })}
        >> salut_les_pseudo_fêtards_vous_êtes_à_l_heure_d_été 

    ${macros.normalize("!Salut les pseudo-fêtards, vous êtes à l'heure d'été !", {"lowercase": false })}
        >> Salut_les_pseudo_fetards_vous_etes_a_l_heure_d_ete 

  ```
  ___

  - **svgOuImg**  
  Cette macro permet dans le cas d'images provenant d'un référenciel *(Ex: Eboc)* de vérifier son type afin d'afficher une balise `<img>` si l'image est un JPG, GIF, PNG ou une basise `<svg>` dans le cas d'un SVG.  
  *Params :*
	 * {Object} visuel : Un objet retourné par le model java qui contient les information concernant l'image  
	 * {String} profilImage : Un ensemble de paramètre à ajouter après l'URL de l'image *(Utilisé uniquement s'il s'agit d'une image)*  
	 * {String} alt : Un texte alternatif pour la balise image *(Utilisé uniquement s'il s'agit d'une image)*  
	 * {String} class : Une classe css à ajouter à la balise image *(Utilisé uniquement s'il s'agit d'une image)*  

	 Cette macro est disponible dans le fichier `common-macro.ftl`  

  *Exemples d'objets visuel :*
  ```json
 	{
 		"extension": "SVG", 
 		"href": "/svg/assets/picto-acces._r084a5be45169_.svg", 
 		"content" : "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 48 48'> <title>Pictogramme de géolocation magasin</title> <path d='M24,4A16.5,16.5,0,0,0,7.5,20.5c0,7.3,10.7,18.7,14.8,22.8a2.4,2.4,0,0,0,3.4,0c4.1-4.1,14.8-15.5,14.8-22.8A16.5,16.5,0,0,0,24,4Zm0,36.7c-8.3-8.4-13.5-16.1-13.5-20.2a13.5,13.5,0,0,1,27,0C37.5,24.6,32.3,32.3,24,40.7Z'></path> <path d='M30.2,18.7l-3.3-3.3-2.1-2.1a1.2,1.2,0,0,0-1.6,0l-2,2.1-3.4,3.3-1.4,1.5a1.1,1.1,0,0,0,.8,1.9H30.9a1.1,1.1,0,0,0,.8-1.9Z'></path> </svg>" 
 	}
  ```
  ```json
 	{
 		"extension": "PNG", 
 		"href": "/multimedia/bf1500889014/13bfb5b978a59/produits/cuisine/03_cuisine.png"
 	}
  ```

  *Exemples d'utilisation :*  
  ```freemarker
    <#import "../../macros/common/common-macro.ftl" as macros>
    <@macros.svgOuImg visuel=myModel.secondaryImage />
    <@macros.svgOuImg visuel=myModel.visuel alt=myModel.designation class="a-image" />
  ```
  ___

  - **icon**  
  Cette macro insére un icône provenant du design system dans le DOM.  
  Les SVG ainsi inclus disposent d'une classe qui leur assigne le format prévu dans le design system.   
  Les SVG ainsi inclus utilisent la déclaration `<use>` afin de ne pas répéter le DOM du SVG inutilement.  
  Si l'icône n'a jamais été inclus dans le composant, alors un `<symbol>` sera inclus juste avant la balise SVG. 
  *Params :* 
	 * {String} iconPath : Le nom de l'icône à inclure, sans extension *(Ex: Device_Laptop_48px)*
	 * {String} class : Une classe css à ajouter à la balise svg
   * {Boolean} symbolOnly : Si l'icone doit etre inséré uniquement en tant que symbol pour être réutilisé plus tard. Défaut : false

  Cette macro est disponible dans le fichier `icons.ftl`  

  *Exemples d'utilisation :*  
  ```freemarker
    <#import "../../macros/common/icons.ftl" as icons>
    <@icons.icon iconPath="Navigation_Display_Setting_48px" />
    <@icons.icon iconPath="Navigation_Publish_Edit_48px" class="-bgBrand01" />
    <@icons.icon iconPath="Navigation_Display_Setting_48px" symbolOnly=true />
  ```
  ___

  - **iconset**  
  Cette macro insére un icône responsive provenant du design system dans le DOM.  
  Il est ainsi possible de modifier le tracé de l'icône en fonction du breakpoint du viewport.  
  Les icônes sont utilisé du plus petit au plus grand, jusqu'à ce qu'un nouvel icône soit déclaré :
  *Si on déclare un icône pour les breakpoint S et XL, l'icône S sera visible sur les breakpoints S, M, et L et l'icône XL sera visible sur les breakpoints XL et XXL*
  Les SVG ainsi inclus disposent d'une classe qui leur assigne le format prévu dans le design system et qui n'affiche que l'icône prévu pour ce breakpoint.  
  Les SVG ainsi inclus utilisent la déclaration `<use>` afin de ne pas répéter le DOM du SVG inutilement.  
  Si un ou des icônes n'ont jamais été inclus dans le composant, alors un ou des `<symbol>` seront inclus juste avant la balise SVG. 
  *Params :* 
	 * {Object} iconsMap : Un objet qui contient des couples breakpoint/icône
	 * {String} class : Une classe css à ajouter à la balise svg

  Cette macro est disponible dans le fichier `icons.ftl`  

  *Exemples d'utilisation :*  
  ```freemarker
    <#import "../../macros/common/icons.ftl" as icons>
    <@icons.iconset iconsMap={'S': 'Device_Mobile_48px', 'M': 'Device_Tablet_48px'} />
    <@icons.iconset iconsMap={'M': 'Device_Tablet_48px', 'L': 'Device_Laptop_48px', 'XXL': 'Device_Desktop_48px'} />
    <@icons.iconset iconsMap={'S': 'Device_Mobile_48px', 'M': 'Device_Tablet_48px'} />
  ```

  ___

  - **addVar** 
  Cette macro ajoute un variable au tc_vars du module en cours.
  Elle ne génère aucune sortie HTML, voir `tcVars` pour injecter le contenu.


  *Params :* 
   * name {String} : Le nom de la variable à ajouter au datalayer
   * value {String|String} : La valeur de la variable à ajouter au datalayer
   * mergeable {Bool}

  Cette macro est disponible dans le fichier `data_layer.ftl`  

  *Exemples d'utilisation :*  
  ```freemarker
    <#import "../../macros/common/data_layer.ftl" as tc>
    <@tc.addVar name="number" value=155813697 />
    <@tc.addVar name="string" value="Label de ma page" />
  ```

  Il est compliqué en freemarker de créer directement un objet complexe pour l'ajouter dans un attribut, néanmoins, il est possible d'utiliser cette syntaxe pour ajouter des formats de données complexes :
  ```freemarker
    <#assign testArrayStr>
      [{'list_product_quantity':'1','list_product_id':'79796885','list_product_trademark':'equation','list_product_position':'1','list_product_name':'radiateur_electrique_double_systeme_chauffant_equation_sorali_connect_1000w','list_product_unitprice_ati':'509.00','product_unitprice_ati':'509.00','product_unitprice_tf':'424.17','product_discount_ati':'0.0','product_discount_tf':'0.0','list_product_currency':'EUR','list_product_url_page':'/v3/p/produits/radiateur-electrique-double-systeme-chauffant-equation-sorali-connect-1000w-e1501610064','list_product_breadcrumb_id':['3000012','3000021','3000142'],'list_product_breadcrumb_label':['chauffage_plomberie','radiateur_seche_serviette_chaudiere_regulation_climatiseur','radiateur_electrique'],'list_product_rating':'','list_product_instock_web':'','list_product_instock_mag':''},{'list_product_quantity':'1','list_product_id':'80150980','list_product_trademark':'equation','list_product_position':'2','list_product_name':'kit_complet_de_produits_connectes_universels__avec_box_enki','list_product_unitprice_ati':'343.29','product_unitprice_ati':'343.29','product_unitprice_tf':'286.08','product_discount_ati':'0.0','product_discount_tf':'0.0','list_product_currency':'EUR','list_product_url_page':'/v3/p/produits/kit-complet-de-produits-connectes-universels-avec-box-enki-e1501337720','list_product_breadcrumb_id':['3000016','3009708','1401059676','1401059684'],'list_product_breadcrumb_label':['electricite_domotique','domotique_et_objets_connectes','domotique','box_domotique_et_kit_complet'],'list_product_rating':'','list_product_instock_web':'','list_product_instock_mag':''}]
    </#assign>
    <@tc.addVar name="testArrayStr" value=testArrayStr />

    <#assign testObjectStr>
      {'list_product_quantity':'1','list_product_id':'79796885','list_product_trademark':'equation','list_product_position':'1','list_product_name':'radiateur_electrique_double_systeme_chauffant_equation_sorali_connect_1000w','list_product_unitprice_ati':'509.00','product_unitprice_ati':'509.00','product_unitprice_tf':'424.17','product_discount_ati':'0.0','product_discount_tf':'0.0','list_product_currency':'EUR','list_product_url_page':'/v3/p/produits/radiateur-electrique-double-systeme-chauffant-equation-sorali-connect-1000w-e1501610064','list_product_breadcrumb_id':['3000012','3000021','3000142'],'list_product_breadcrumb_label':['chauffage_plomberie','radiateur_seche_serviette_chaudiere_regulation_climatiseur','radiateur_electrique']}
    </#assign>
    <@tc.addVar name="testObjectStr" value=testObjectStr />
  ```

  ___

  - **tcVars** 
  Cette macro injecte l'attribut data-tcvars dans le DOM

  *Params :* 
   * aucun

  Cette macro est disponible dans le fichier `data_layer.ftl`  

  *Exemples d'utilisation :*  
  ```freemarker
    <#import "../../macros/common/data_layer.ftl" as tc>

    <section id="module-mymodule" <@tc.tcVars/>>
    </section>
  ```
 ---
 
 ### Json Ld
 
  - **show** 
  Cette macro est disponible dans le fichier `jsonld.ftl`  
  Elle injecte la variable "data" passé en argument dans un data-jsonld normalisé

  *Params :* 
   * data {any} : La valeur de la variable à ajouter au json ld
   

  *Exemples d'utilisation :*  
  ```freemarker
    <#import "../../macros/common/jsonld.ftl" as jsonld>

    <#assign productInfo>
    {
        'url': 'https://www.leroymerlin.fr/v3/p/produits/scie-egoine-de-charpentier-dexter-550-mm-e87016',
        'name': 'Scie égoïne De charpentier DEXTER 550 mm',
        'image': 'http://s1.lmcdn.fr/multimedia/1e4267755/produits/scie-egoine-de-charpentier-dexter-550-mm.jpg',
        'description': 'Voici une 17" desc\'ription'
    }
    </#assign>

    <section id="my-component" <@jsonld.show data=productInfo />>
      my awesome feature
    </section>
  ```

   - **carousel** 
   
   Cette macro crée une carousel à partir d'un groupe d'élements (images, textes,etc..)
    
  *Params :* 
  
     * options un objet de params
     
  *Exemples d'objets de params :*
  
    ```json
    {
        "id":"js-my-carousel",
        "navSize":"l",
        "showOnHoverNav":true,
        "bevel":"left-s",
        "cerberusBtnPrev": "",
        "cerberusBtnNext" : "",
        "cssClass" : {
          "container":"classCssContainer",
          "navButtons":"classCssNavButton"          
        },
        "arrowPosition" : "inside"
        
   	}
    ```
    
  *Exemples d'utilisation :*  
   Pour le bon fonctionnement du carousel  :
     * les items doivent être que des li avec la classe "km-carousel__item"
     * Dans le cas ou on a des images, mettre sur les images afficher au chargement de la pages 
       la classe "lazy" et pour le reste "tns-lazy-img"
          
  
  ```freemarker
    <#import "../../macros/common/carousel.ftl" as genericalCarousel>
    <#assign carouselOptions = {
            "id":"js-my-carousel",
            "navSize":"l",
            "showOnHoverNav":true,
            "bevel":"left-s", 
            "cssClass" : {
              "container":"classCssContainer",
              "navButtons":"classCssNavButton"              
            },
            "arrowPosition" : "inside"
    }/>

    <@genericalCarousel.carousel options = carouselOptions >
        <li class="km-carousel__item">
            Your element
        </li>
    </@genericalCarousel.carousel>
  ```
  The param `arrowPosition` define the position of the left and right arrows: `outside` or `inside` the carousel.


- **Pagination** 

*Exemples d'utilisation :*  
   
       Pour avoir une pagination "light" mettre a "true"
       hiddenList correspond à l'affichage de la pagination pour le seo   
  
  ```freemarker
    <#import "../../macros/pagination.ftl" as pagination>
    <#assign configPagination = {
        "jsClass": "js-pagination",
        "currentPage": resultsWrapper.getCurrentPage(),
        "maxPage": resultsWrapper.getNumberOfPages(),
        "light": false,
        "hiddenList" : false
    }>

    <@pagination config=configPagination />
  ```
       
   - **tooltip** 
   
   Cette macro crée une tooltip avec différents paramètres associés
    
  *Params :* 
  
     * options un objet de params
     
  *Exemples d'objets de params :*
  
    ```json
    {
        "jsClass":"js-tooltips1",
        "text":"Sed maximum est in amicitia parem esse inferiori",
        "position":"bottom",
        "theme":"dark",
        "customClass":"m-mon-context",
        "content": ""       
        }
        
   	}
    ```
    
  * Exemples d'utilisation :

   * Pour le bon fonctionnement de la tooltip :  
     * l'objet lié au paramètre jsClass permet de faire fonctionner la tooltip sur son ouverture et fermeture. Vous pouvez par consequant repéter en nombre illimité la tooltip sur une même page du site en précisant bien dans le lm.DOMReady de votre fichier source js ex : let TooltipsModule1 = new Tooltip(".js-tooltip1", () => { console.log('open') }, () => { console.log('close') });

     * l'objet lié au paramètre text permet d'indiquer le contenu qui sera lié au button tooltip

     * il existe 4 positions (top, right, bottom, left) pour la tooltip. La position right est une position par défaut si vous n'indiquez aucun objet

     * deux choix sont proposés dans le paramètre thème celle par défaut qui indique une tooltip en blanc avec contenu et fermeture en noir. Dark pour une tooltip au fond sombre et fermeture en fond blanc

     * l'objet lié au paramètre customClass permet de customiser intégralement le contenu dans le content de la tooltip 
       
  
  ```freemarker
    <#import "../../macros/common/tooltip.ftl" as tooltips>
    <#assign tooltipOptions = {
        "jsClass":"js-tooltips1",
        "text":"Sed maximum est in amicitia parem esse inferiori",
        "position":"bottom",
        "theme":"dark",
        "customClass":"m-mon-context",
        "content": ""
    }/>

    <@tooltips.tooltip options = tooltipOptions >
        On appelle combles perdus des combles qu'on ne peut ou ne veut pas aménager à cause d’une hauteur libre moyenne insuffisante, ou d’une mauvaise disposition des bois de la charpente.
    </@tooltips.tooltip>
  ```

   - **Rating stars** 
   Build a macro that generate a five stars row, with the icon macro.
   You can send a number as parameter, the macro will check during the loop if the number matches with the loop count, and will add fullstar or halfstar class to the nearest star.

   The default icon size is 24px, but you can override this sending a second parameter with the wanted size.

  *Examples*  

  ```freemarker
    <#import "../../macros/common/ratingstars.ftl" as ratingstars>

    <@ratingstars.ratingstars 3 />
    <@ratingstars.ratingstars 2 "16px" />
  ```
You can also loop in a number sequence.

  ```freemarker
    <#import "../../macros/common/ratingstars.ftl" as ratingstars>
    
    <#assign ratings = [2, 2.3, 3, 3.5, 4, 4.75, 5] >

    <#list ratings as rating>
      <@ratingstars.ratingstars rating />
    </#list>
  ```
  ___

 - **Tags**
    Build a macro that generate a tag, based on a type with 2 themes and sizes available.

    4 types are available: `text`, `link`, `selectable` and `removable`.

    *Example*  

    ```freemarker
        <#import "../../macros/common/icons.ftl" as icons>
        <#import "../../macros/common/tags.ftl" as tags>

        <#assign tagTextDark = {"type": "text", "theme":"dark"}/>
        <@tags.tagMozaic tagTextDark >Tag type text dark</@tags.tagMozaic>

         <#assign tagLinkSmall = {"type": "link", "link": {"href": "monUrl","targetBlank": true}, "size":"s"}/>
        <@tags.tagMozaic tagLinkSmall >Tag type link small</@tags.tagMozaic>
    ```
   - **Toasters** 
   Build a macro that generate a toaster, based on a type, with the right icon.

   4 types are available: `sucess`, `info`, `warning` and `danger`.


  *Example*  

  ```freemarker
    <#import "../../macros/common/icons.ftl" as icons>
    <#import "../../macros/common/toaster.ftl" as toasters>

    <#assign toasterSuccessOpt = {
        "type":"success"
    }/>
    <@toasters.toaster configToaster = toasterSuccessOpt >
        Success <br>
        TEST
    </@toasters.toaster>
  ```
  ___

  - **productDelivery**
  Cette macro génère le bloc avec les informations de livraison du produit. Elle est utilisée sur le composant Megaboost de la page famille ainsi que sur la fiche produit.

    *Params :*
    * {Array[Object]} deliveryInfos - required : Objet portant les données nécessaire à l'affichage des informations de livraison.
    
      *ex* :
      ```
      ParamsDeliveryInfos = [
          {
              "deliveryType" : "storeDelivery",    // Possible values : storeDelivery || homeDelivery || relayDelivery
              "formatedDeliveryPromise" : "2h",    // Formatted delivery time : 2h || 5 jours || 48h || 3 semaines...
              "formatedCostFrom" : "gratuit",      // Formatted price : 3.99€ || 9.99€ || gratuit
              "storeLabel" : "Villeneuve d'Ascq",  // Store name (if context) (only for "storeDelivery")
              "urlContext" : "#"                  // Store context url  (only for "storeDelivery")
          }
      ]
      ```
  
    * {string} cssClass - optional : cssClass for some styles

    *Exemples d'utilisation :*  
    ```
    <#import "../../macros/common/product_delivery.ftl" as delivery>
    <@delivery.productDelivery deliveryInfos = ParamsDeliveryInfos cssClass = "my-class" />
    ```

  ___

  - **Price** :
   /!\ DEPRECATED, use showPrice instead
   show block price for a product (product page, tile product in family page...)

    *Params :*
    * @param priceInformations
    * ```JSON
        "priceInformations" : {
            "price" : 9999.9,					                //sell price
            "priceWithoutOffer" : 199.99,                       //price without offer
            "priceEndDate" : "1565740800000",                   //only if offer - java format date
            "currency" :
                {
                    "label" : "EUR",
                    "value" : "€"
                },
            "displayDiscount":                                  // discount value
                {
                    "type": "PERCENTAGE",
                    "value": 14
                },
            "unitSale" : "Litre",					            //expected values : "m²" || "litre" || "unité"...
            "packagingPrice" : 4.66,		                    //only if product have conditionning
            "packagingUnitSale" : "m²",			                //only if product have conditionning
            "refundsOfferLabel" : "20€ remboursés",	            //"ODR"
            "type": "GOOD_PURCHASE", 		                    //expected values : "FIRST_PRICE", "GOOD_PURCHASE", "STAR_PRODUCT", "DESTOCKING", "OPE_COM", ""
            "ecoPart" : 
                {
                    "type": 1,                                  //type of DEEE
                    "price": 0.2                                //amount of DEEE
                }
        }
        ```

    * @param isLight{Boolean} - If full or light presentation

    *Exemples d'utilisation :*  
    ```
    <#import "../../macros/common/prices.ftl" as productMacros>
    <@productMacros.price priceInformations = priceInformations isLight = false />
    ```
 ___

  - **showPrice** :
   show block price for a product with new opus'datas (product page, tile product in family page...)

    *Params :*
    * @param showPriceInformations
    * ```JSON
        "showPriceInformations" : {
            "mainPrice" : 9999.9,					            //sell price
            "mainPriceUnit" : "Litre",					        //expected values : "m²" || "litre" || "unité"...
            "priceWithoutOffer" : 199.99,                       //price without offer
            "formattedDiscount" : "-50%",                       //only if offer
            "priceEndDate" : "1565740800000",                   //only if offer - java format date
            "currency" :
                {
                    "label" : "EUR",
                    "value" : "€"
                },
            "secondaryPrice" : 4.66,		                    //only if product have conditionning
            "secondaryPriceUnit" : "m²",			            //only if product have conditionning
            "refundsOfferLabel" : "20€ remboursés",	            //"ODR"
            "type": "GOOD_PURCHASE", 		                    //expected values : "FIRST_PRICE", "GOOD_PURCHASE", "STAR_PRODUCT", "DESTOCKING", "OPE_COM", "DISCOUNT", ""
            "ecoPart" : 
                {
                    "type": 1,                                  //type of DEEE
                    "price": 0.2                                //amount of DEEE
                },
                "displayDiscount": {
                    "type": "PERCENTAGE",                       
                    "value": 14
                }
        }
        ```

    * @param isLight{Boolean} - If full or light presentation

    *Exemples d'utilisation :*  
    ```
    <#import "../../macros/common/prices.ftl" as productMacros>
    <@productMacros.showPrice showPriceInformations = showPriceInformations isLight = false />
    ```
___


  - **Sort** :
   show block sort  (families pages, services pages...)

    *Params :*
    * @param config
    * ```JSON
        "config" : {
            "label" : "produit(s) trié(s) par",
            "total" : 20,                      
            "sortList" : [{applied: true,code: "relevance",label: "Pertinence"},{applied: false,code: "price-asc",label: "Prix croissant"}],
            "cerberus" : "ELEM_NombreProduitsPage"               
        }
        ```

    *

    *Exemples d'utilisation :*  
    ```
    <#import "../../../macros/common/list/_sort/sort.ftl" as sortMacros>
    <#assign sortList = [{applied: true,code: "relevance",label: "Pertinence"},{applied: false,code: "price-asc",label: "Prix croissant"}] >
    <#assign configSort = {"label": "produit(s) trié(s) par","total" :40,"sortList" : results.sorts,"cerberus" : "ELEM_NombreProduitsPage"}>
    <@sortMacros.sorting configSort />
    ```
    ___
    
      - **SelectedFilters** :
       show list of selected filters  above differents page list 
           
        *Params :*
        * @param values 
        * ```JSON
            "values" : [
                               {applied: true
                               code: "type-de-produit"
                               label: "Type de produit"
                               max: null
                               maxApplied: null
                               min: null
                               minApplied: null
                               numberValuesToDisplay: 6
                               selected: false
                               type: "standard"
                               values: [{type: "standard", value: "Abrasif Delta", total: 2, applied: true, code: "Abrasif_Delta"},{type: "standard", value: "Bande de ponçage", total: 1, applied: false, code: "Bande_de_poncage"}
                               ]},
                               {applied: true
                               code: "prices"
                               label: "Prix"
                               max: "900"
                               maxApplied: "900"
                               min: "2.9"
                               minApplied: "2.9"
                               numberValuesToDisplay: null
                               selected: false
                               type: "range"
                               values: null}
                           ]
            ```
    
        *
    
        *Exemples d'utilisation :*  
        ```
        <#import "../../../macros/common/list/_filters/selected-filters.ftl" as selectedFiltersMacro>
        <#assign values = [{applied: true code: "type-de-produit" label: "Type de produit" max: null maxApplied: null min: null minApplied: null numberValuesToDisplay: 6 selected: false type: "standard" values: [{type: "standard", value: "Abrasif Delta", total: 2, applied: true, code: "Abrasif_Delta"},{type: "standard", value: "Bande de ponçage", total: 1, applied: false, code: "Bande_de_poncage"} ]}, {applied: true code: "prices" label: "Prix" max: "900" maxApplied: "900" min: "2.9" minApplied: "2.9" numberValuesToDisplay: null selected: false type: "range" values: null} ] >
        <@selectedFiltersMacro.selectedFilter values />
        ```
    ___
    
      - **filters** :
       show all types of filters in differents page list 
           
        *Params :*
        * @param configFilters 
        * ```JSON
            "configFilters" : {
                        "typeElements":"produit",
                        "numbersElements":"30",
                        "values":[
                                {applied: true,
                                code: "type-de-produit",
                                label: "Type de produit",
                                max: null,
                                maxApplied: null,
                                min: null,
                                minApplied: null,
                                numberValuesToDisplay: 6,
                                selected: false,
                                type: "standard",
                                values: [{type: "standard", value: "Abrasif Delta", total: 2, applied: true, code: "Abrasif_Delta"},{type: "standard", value: "Bande de ponçage", total: 1, applied: false, code: "Bande_de_poncage"}
                                ]},
                                {applied: true,
                                code: "prices",
                                label: "Prix",
                                max: "900",
                                maxApplied: "900",
                                min: "2.9",
                                minApplied: "2.9",
                                numberValuesToDisplay: null,
                                selected: false,
                                type: "range",
                                values: null}
                                  ]    
                      }
            ```
    
        *
    
        *Exemples d'utilisation :*  
        
                ```
                <#import "../../../macros/common/list/_filters/filters.ftl" as filtersMacros>
                <#assign values = { "typeElements":"produit", "numbersElements":"30", "values":[ {applied: true, code: "type-de-produit", label: "Type de produit", max: null, maxApplied: null, min: null, minApplied: null, numberValuesToDisplay: 6, selected: false, type: "standard", values: [{type: "standard", value: "Abrasif Delta", total: 2, applied: true, code: "Abrasif_Delta"},{type: "standard", value: "Bande de ponçage", total: 1, applied: false, code: "Bande_de_poncage"} ]}, {applied: true, code: "prices", label: "Prix", max: "900", maxApplied: "900", min: "2.9", minApplied: "2.9", numberValuesToDisplay: null, selected: false, type: "range", values: null} ] }  >
                <@filtersMacros.filters configFilters />
                ```
  
  - **Function formatPrice** :
   Return a formatted price

    *Params :*
    * @param price<number> (ex : 9999.9)
    * @param currency<string> (ex : "€")
    ```
    <#include "tools/_format-price.function.ftl" />
    ${formatPrice(9999.9, "€"}
    ```
    *Result :* 
    ```
    9 999.90 €
    ```

## Workflow

### TL;DR  
**Développement**

- L'intégrateur tire une branche de `master` sous cette nomenclature :
    `feature_[nom de la feature / périmètre]_[libellé]`
- Il crée ensuite une merge request en WIP sur `master` pour la soumettre au gouverneur. Cette merge request contiendra dans le commentaire du premier commit l'intention de modifications du socle commun, ce qui permettra une première validation de la part du gouverneur.
- Le gouverneur fait un retour sous 24 heures max en soumettant les intentions au reste de la tribu avec les pouces vers le haut vers le bas.
- Si cette WIP est validée, le développement des évolutions du socle peut commencer.
- L'intégrateur s'assurera de mettre à jour ses merge requests de façon régulière pour valider itérativement son travail.

**Qualification (à valider)**

- Une branche de qualif peut être intéressante pour merger plusieurs features du socle commun

**Préproduction / production**

- Une ultime merge request non flaggée en WIP est envoyée sur master.
- Si celle-ci est validée par le gouverneur, elle est mergée sur master.
- Le gourverneur va alors tagguer le commit suivant le versionning suivant :  
    v0.0.X : hotfix / correctifs - rétrocompatibilité assurée  
    v0.X.0 : évolutions  - rétrocompatibilité assurée  
    vX.0.0 : version majeure - rétrocompatibilité non assurée
- Le gouverneur met à jour le doc de suivi des versions et en informe le reste de la tribu
 
## img & picture

### Image tag

File : `/macros/image.ftl`

```
@param alt      : string :: image description
@param class    : string :: class for img element
@param src      : string :: url of image resource
@param loading  : string :: loading behavior : auto, lazy, eager (optional)
```

Generate :

```html
<img alt="" class="" src="" /> 
```
Or if loading param is set to lazy :  
```html
<img alt="" class="" data-src="" /> 
```

How to use it :

1) Call the helper :

```html
<#import "RELATIVE_PATH/macros/image.ftl" as image>
```

2) Set your informations :

```html
<#assign altImg="My description">
<#assign classImg="my-class my-class__another-class">
<#assign srcImg="${itemShowcase.mainImage.href}?width=640&crop=11:6,smart">
<#assign loading="lazy">
```

3) Call the macro :

```html
<@image.image alt="${altImg}" class="${classImg}" src="${srcImg}" loading="${loading}" />
```

### Picture tag

Picture macro need to have their source image call by CDN.

Static images can't use this helper.

Generate : 

```html
<picture class="maclasse">
    <source srcset="you-pict.xxx?width=320" media="(max-width: 320px)">
    <source srcset="you-pict.xxx?width=640" media="(max-width: 320px) and (-webkit-min-device-pixel-ratio: 2)">
    <source srcset="you-pict.xxx?width=960" media="(max-width: 320px) and (-webkit-min-device-pixel-ratio: 3)">
    <source srcset="you-pict.xxx?width=640" media="(max-width: 640px)">
    <source srcset="you-pict.xxx?width=1280" media="(max-width: 640px) and (-webkit-min-device-pixel-ratio: 2)">
    <source srcset="you-pict.xxx?width=1920" media="(max-width: 640px) and (-webkit-min-device-pixel-ratio: 3)">
    <source srcset="you-pict.xxx?width=960" media="(max-width: 960px)">
    <source srcset="you-pict.xxx?width=1280" media="(max-width: 960px) and (-webkit-min-device-pixel-ratio: 2)">
    <source srcset="you-pict.xxx?width=1280" media="(max-width: 1280px)">
    <source srcset="you-pict.xxx?width=1920" media="(max-width: 1920px)">
    <img src="you-pict.xxx?width=640" alt="Alternative text">
</picture>
```

Or with lazy load :

```html
<picture class="maclasse lazy-loaded" data-iesrc="you-pict.xxx" data-alt="Alternatve text">
    <source srcset="you-pict.xxx?width=320" media="(max-width: 320px)">
    <source srcset="you-pict.xxx?width=640" media="(max-width: 320px) and (-webkit-min-device-pixel-ratio: 2)">
    <source srcset="you-pict.xxx?width=960" media="(max-width: 320px) and (-webkit-min-device-pixel-ratio: 3)">
    <source srcset="you-pict.xxx?width=640" media="(max-width: 640px)">
    <source srcset="you-pict.xxx?width=1280" media="(max-width: 640px) and (-webkit-min-device-pixel-ratio: 2)">
    <source srcset="you-pict.xxx?width=1920" media="(max-width: 640px) and (-webkit-min-device-pixel-ratio: 3)">
    <source srcset="you-pict.xxx?width=960" media="(max-width: 960px)">
    <source srcset="you-pict.xxx?width=1280" media="(max-width: 960px) and (-webkit-min-device-pixel-ratio: 2)">
    <source srcset="you-pict.xxx?width=1280" media="(max-width: 1280px)">
    <source srcset="you-pict.xxx?width=1920" media="(max-width: 1920px)">
    <img alt="Alternatve text">
</picture>
```

```
@param alt      : string :: image description
@param class    : string :: class for img element
@param src      : string :: url of image resource
```

How to use it :

1) Call the helper :

```html
<#import "PATH/macros/image.ftl" as image>
```

2) Set your informations :

```html
<#assign altImg="My description">
<#assign classImg="lazy my-class my-class__another-class">
<#assign srcImg="${itemShowcase.mainImage.href}">
```

3) Call the macro :

```html
<@image.picture alt="${altImg}" class="${classImg}" src="${srcImg}"/>
```

## Buttons 

### Add to cart

Display add to cart button

```java
  @param {String} type                  : Submit by default (Can be button)
  @param {String} wrapperCustomClass    : Class use only for wrapper html tag
  @param {String} customClass           : Unique class for both button and icon  /!\ IF YOU NEED MULTIPLE CLASSES USE wrapperCustomClass
  @param {Boolean} displayIcon          : Display Basket icon, by default true
  @param {String} textContent           : Text of button, by default "Ajouter au panier"
  @param {Object} dataTagco             : data tag commander object
  @param {String} dataTcevent           : data tc-event
  @param {String} cerberus              : data cerberus
  @param {Array[Object]} dataAttributes : list of data attributes
```

How to use it :

Default :
```html
<#import "RELATIVE_PATH/macros/common/button.ftl" as addToCart>  
<@button.addToCart />
```

Will generate :

```html
<button type="submit" class="ka-button js-cart-add">
<svg class="ku-icon-48 ka-button__icon"><use href="#Product_Basket_Add_48px"></use></svg>
Ajouter au panier
</button>
```

Custom :

```html
<#import "RELATIVE_PATH/macros/common/button.ftl" as addToCart>  

 <#assign myCustomConfig = {
    "type"               : "button",
    "wrapperCustomClass" : "parent classes" //multiple classes,
    "customClass"        : "my-class" //unique classe,
    "textContent"        : "",
    "dataTagco"          : "{'titi' : 'tata', 'tutu' : 'toto'}", //optional
    "dataTcevent"        : "tc-event-example", //optional
    "cerberus"           : "BTN_addtocart", //optional
    "dataAttributes      : [
        {
        "name" : "truc",
        "value" : "valeur de truc"
        }
    ]
  } />

<@button.addToCart myCustomConfig />
```

Will generate :
```html
  <button type="button" class="ka-button js-cart-add  parent classes my-class js-tagGA" data-tagco="{'titi' : 'tata', 'tutu' : 'toto'}" data-tcevent="tc-event-example" data-cerberus="BTN_addtocart" data-truc="valeur de truc">
    <svg class="ku-icon-48 ka-button__icon my-class__icon"><use href="#Product_Basket_Add_48px"></use></svg>
  </button>
```


## Layer

Allows to inject a layer in the DOM

```java
@param options : object
    * content: String                   (required)
    * title : String                    (optionnal)
    * icon : String                     (optionnal)
    * cssClass : Object                 (optionnal)
    * footer : Object                   (optionnal)
```

How to use it :
```java
<#import "../../macros/common/layer.ftl" as layers>
<@layers.layer options=layerOptions>
    LAYER CONTENT  
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nulla voluptas reiciendis, voluptatum, consequuntur officia assumenda esse placeat earum commodi nostrum, ratione magni dolorum ad voluptates, magnam excepturi odit iste iure.
</@layers.layer>
```

Custom :
```java
<#assign layerOptions = {
    "content": "js-layer-name"
    "title": "My title",
    "icon": "id-icon", //optional
    "cssClass": {
        "layer": "", //optional
        "header": "", //optional
        "body": "", //optional
        "footer": "" //optional
    },
    "footer": {
        "firstButton": { //optional
            "label": "Button label",
            "config": {}  // Use same config as macros/common/button.ftl
        },
        "secondButton": { //optional
            "label": "Button label 2",
            "config": {} // Use same config as macros/common/button.ftl
        }
    }
}>
```
