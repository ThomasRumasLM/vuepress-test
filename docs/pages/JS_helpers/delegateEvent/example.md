<template>
<ShowHtml>
<section>
    <div class="parent">
        <ul>
            <li><button class="js-action">click here</button></li>
            <li><button class="js-action">click here</button></li>
            <li><button class="js-action">click here</button></li>
            <li><button class="js-action">click here</button></li>
            <li><button class="js-action">click here</button></li>
        </ul>
    </div>
</section>
</ShowHtml>
</template>

<script>
export default {
    mounted() {
        document.querySelector('.parent').delegateEvent('click', 'button.js-action', event => {
        console.log( event.target );
        // Return "<button class="js-action">click here</button>"
        });
    }
}
</script>