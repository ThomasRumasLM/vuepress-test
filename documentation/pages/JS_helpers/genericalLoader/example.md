<template>
<ShowHtml>
<div>
    <div class="myLoaderContainer"></div>
</div>

</ShowHtml>
</template>

<script>
import GenericalLoader from '../../../../js/assets/modules/_genericalLoader.class.js'

export default {
    updated() {
        import('../../../../js/assets/modules/_genericalLoader.class.js')
        .then(m => {
            //Object instanciation
            const loaderObj = new m.default('https://lmfr-site.prod.leroymerlin.fr/static/images/common/loader.svg');
    
            //Append loader on DOM 
            loaderObj.append(document.querySelector('div.myLoaderContainer'));
    
            //Remove loader on DOM
            //loaderObj.remove(document.querySelector('div.myLoaderContainer'));
        })
        .catch(error => {
            console.log(error)
        });
    }
}
</script>