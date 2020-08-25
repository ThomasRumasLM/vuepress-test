<template>
<ShowHtml>
</ShowHtml>
</template>

<script>
export default {
    mounted() {
        lm.cookie.set('name', 'value', 'expireDays');
        lm.cookie.get('name');
        // return "value"

        lm.cookie.get('doesNotExist');
        // return ""

        lm.cookie.delete('name');
        lm.cookie.get('name');
        // return ""
    }
}
</script>