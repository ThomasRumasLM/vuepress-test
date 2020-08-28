<template>
<ShowHtml>
<ul class="js-characters">
	<li>Bob</li>
	<li>Patrick</li>
	<li>Carlo</li>
	<li>Gary</li>
</ul>
</ShowHtml>
</template>

<script>
export default {
    updated() {
        const output = document.querySelectorAll('.js-characters li');
        lm.forEach(output, (item, i) => {
        console.log(`&bull; ${item.innerHTML}`);
        });
        /*  >
            • Bob
            • Patrick
            • Carlo
            • Gary 
        */

    }
}
</script>