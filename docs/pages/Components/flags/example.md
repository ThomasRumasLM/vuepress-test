<template>
<ShowHtml>
<div class="example">
    <div class="mc-flag mc-flag--solid-primary-02 myFlag" data-toto="toto">
        <span>My flag</span>
    </div>
</div>
<div class="example">
    <div class="mc-flag">
        <span>Primary</span>
    </div>
    <div class="mc-flag mc-flag--bordered">
        <span>Secondary</span>
    </div>
</div>
<div class="example">
    <div class="mc-flag mc-flag--solid-primary-02">
        <span>Primary</span>
    </div>
    <div class="mc-flag mc-flag--bordered-primary-02">
        <span>Secondary</span>
    </div>
</div>
<div class="example">
    <div class="mc-flag mc-flag--solid-danger">
        <span>Primary</span>
    </div>
    <div class="mc-flag mc-flag--bordered-danger">
        <span>Secondary</span>
    </div>
</div>
<div class="example l-background--grey">
    <div class="mc-flag mc-flag--solid-light">
        <span>Primary</span>
    </div>
    <div class="mc-flag mc-flag--bordered-light">
        <span>Secondary</span>
    </div>
</div>
<div class="example l-background--grey">
    <div class="mc-flag mc-flag--solid-dark">
        <span>Primary</span>
    </div>
    <div class="mc-flag mc-flag--bordered-dark">
        <span>Secondary</span>
    </div>
</div>
</ShowHtml>
</template>

<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/05-atoms/flag.atoms';

.example {
  text-align: center;
  margin: 1rem auto;
}

.l-background--grey {
  background: #d3d2d6;
  padding: 1rem;
}
</style>