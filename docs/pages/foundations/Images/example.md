<showHtml>
    <div class="ratio-container">
    <div class="example">
    <div class="ku-ratio ku-ratio--16by9">
        <img src="/images/ratio/16_9.png" class="ku-ratio__content"/>
    </div>
    </div>
    <div class="example">
    <div class="ku-ratio ku-ratio--3by2">
        <img src="/images/ratio/3_2.png" class="ku-ratio__content"/>
    </div>
    </div>
    <div class="example">
    <div class="ku-ratio ku-ratio--4by3">
        <img src="/images/ratio/4_3.png" class="ku-ratio__content"/>
    </div>
    </div>
    <div class="example">
    <div class="ku-ratio ku-ratio--1by1">
        <img src="/images/ratio/1_1.png" class="ku-ratio__content"/>
    </div>
    </div>
    <div class="example">
    <div class="ku-ratio ku-ratio--3by4">
        <img src="/images/ratio/3_4.png" class="ku-ratio__content"/>
    </div>
    </div>
    <div class="example">
    <div class="ku-ratio ku-ratio--2by3">
        <img src="/images/ratio/2_3.png" class="ku-ratio__content"/>
    </div>
    </div>
    </div>
</showHtml>

<style lang="scss" scoped>
@import 'node_modules/integration-web-core--socle/css/assets/sass/_common/01-setting-tools/_all-settings.scss';
@import 'node_modules/integration-web-core--socle/css/assets/sass/_common/09-utilities/_ratio.utility.scss';

.ratio-container {
    display: flex;
    flex-wrap: wrap;
}

.example {
    margin: 1rem;
    max-width: 200px;
    height: 100%;
    width: 100%;
}
</style>

<script>
export default {
}
</script>