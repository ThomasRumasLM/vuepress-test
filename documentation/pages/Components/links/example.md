<template>
<ShowHtml>
<div class="example">
    <a href="#" class="mc-link">Default</a>
    <br />
    <a href="#" class="mc-link mc-link--light bg-dark">Light</a>
    <br />
    <a href="#" class="mc-link mc-link--primary">
        Primary
    </a>
    <br />
    <a href="#" class="mc-link mc-link--primary-02">
        Primary-02
    </a>
    <br />
    <a href="#" class="mc-link mc-link--danger">
        Danger
    </a>
</div>

<div class="example">
    <a href="#" class="mc-link" target="_blank">
        Target_blank
    </a>
</div>

<div class="example">
    <a href="#" class="mc-link mc-link--s">
        Small link
    </a>
    <br />
    <a href="#" class="mc-link mc-link--m">
        Medium link
    </a>
</div>

<div class="example">
    <a href="#" class="mc-link">
        <svg class="ku-icon-24 mc-link__icon mc-link__icon--left"><use href="#Media_Camera_24px"></use></svg>
        Link icon left
    </a>
    <br />
    <a href="#" class="mc-link">
        Link icon right
        <svg class="ku-icon-24 mc-link__icon mc-link__icon--right"><use href="#Media_Camera_24px"></use></svg>
    </a>
    <br />
    <a href="#" class="mc-link mc-link--primary">
        <svg class="ku-icon-24 mc-link__icon "><use href="#Media_Camera_24px"></use></svg>
    </a>
</div>

<div class="example">
    <a href="#" class="mc-link" data-tagco="{'titi' : 'tata', 'tutu' : 'toto'}" data-tcevent="tc-event-example"
        data-cerberus="BTN_addtocart" data-truc="valeur de truc" data-truc2="valeur de truc 2">
        link Data
    </a>
</div>

<div class="example">
    <a href="#" class="mc-button mc-button--bordered">
        <svg class="ku-icon-24 mc-button__icon mc-button__icon--"><use href="#Media_Camera_24px"></use></svg>
        <span class="">link button</span>
    </a>
    <a href="#" class="mc-button mc-button--solid-primary-02">
        <span class="">Choisir un magasin</span>
    </a>
</div>
</ShowHtml>
</template>

<style lang="scss" scoped>
.example {
  text-align: center;
  margin: 2rem auto;

  .bg-dark {
    background-color: #000;
  }
}

</style>