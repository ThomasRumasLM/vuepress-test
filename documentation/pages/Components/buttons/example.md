<template>
<ShowHtml>
<div class="example">
    <p class="subtitle">Default</p>
    <button type="button" class="mc-button">
        <span class="mc-button__label">Default</span>
    </button>
    <button type="button" class="mc-button mc-button--bordered">
        <span class="mc-button__label">Default Bordered</span>
    </button>
</div>
<div class="example">
    <p class="subtitle">Campus</p>
    <button type="button" class="mc-button mc-button--solid-primary-02">
        <span class="mc-button__label">Campus</span>
    </button>
    <button type="button" class="mc-button mc-button--bordered-primary-02">
        <span class="mc-button__label">Campus bordered</span>
    </button>
</div>
<div class="example">
    <p class="subtitle">Neutral</p>
    <button type="button" class="mc-button mc-button--solid-neutral">
        <span class="mc-button__label">Neutral</span>
    </button>
    <button type="button" class="mc-button mc-button--bordered-neutral">
        <span class="mc-button__label">Neutral bordered</span>
    </button>
</div>
<div class="example">
    <p class="subtitle">Danger</p>
    <button type="button" class="mc-button mc-button--solid-danger">
        <span class="mc-button__label">Danger</span>
    </button>
    <button type="button" class="mc-button mc-button--bordered-danger">
        <span class="mc-button__label">Danger bordered</span>
    </button>
</div>
<div class="example">
    <p class="subtitle">Sizes</p>
    <button type="button" class="mc-button mc-button--s">
        <span class="mc-button__label">Button small</span>
    </button>
    <button type="button" class="mc-button">
        <span class="mc-button__label">Button medium</span>
    </button>
    <button type="button" class="mc-button mc-button--l">
        <span class="mc-button__label">Button large</span>
    </button>
</div>
<div class="example">
    <p class="subtitle">Icons</p>
    <button type="button" class="mc-button">
        <svg class="ku-icon-24 mc-button__icon"><use href="#Media_Camera_24px"></use></svg>
        <span class="mc-button__label">Button icon default</span>
    </button>
    <button type="button" class="mc-button">
        <svg class="ku-icon-24 mc-button__icon"><use href="#Media_Camera_24px"></use></svg>
        <span class="mc-button__label">Button icon left</span>
    </button>
    <button type="button" class="mc-button">
        <span class="mc-button__label">Button icon right</span>
        <svg class="ku-icon-24 mc-button__icon"><use href="#Media_Camera_24px"></use></svg>
    </button>
</div>

<div class="example">
    <p class="subtitle">Width</p>
    <button type="button" class="mc-button mc-button--solid-primary-02 mc-button--full"">
        <span class="mc-button__label">Button full width</span>
    </button>
</div>

<div class="example">
    <p class="subtitle">Icons & sizes</p>
    <button type="button" class="mc-button mc-button--s">
        <svg class="ku-icon-24 mc-button__icon"><use href="#Media_Camera_24px"></use></svg>
        <span class="mc-button__label">Button small</span>
    </button>
    <button type="button" class="mc-button">
        <svg class="ku-icon-24 mc-button__icon"><use href="#Media_Camera_24px"></use></svg>
        <span class="mc-button__label">Button medium</span>
    </button>
    <button type="button" class="mc-button mc-button--l">
        <svg class="ku-icon-24 mc-button__icon"><use href="#Media_Camera_24px"></use></svg>
        <span class="mc-button__label">Button large</span>
    </button>
</div>
<div class="example">
    <p class="subtitle">Icon only</p>
    <button type="button" class="mc-button mc-button--square">
        <svg class="ku-icon-24 mc-button__icon"><use href="#Media_Camera_24px"></use></svg>
    </button>
    <button
        type="button"
        class="mc-button mc-button--bordered mc-button--square"
    >
        <svg class="ku-icon-24 mc-button__icon"><use href="#Media_Camera_24px"></use></svg>
    </button>
</div>
<div class="example">
    <p class="subtitle">Custom CSS class</p>
    <button type="button" class="mc-button myClass">
        <span class="mc-button__label">Button myClass</span>
    </button>
</div>
<div class="example">
    <p class="subtitle">Type</p>
    <button type="submit" class="mc-button">
        <span class="mc-button__label">Button Type Submit</span>
    </button>
</div>
<div class="example">
    <p class="subtitle">DATA</p>
    <button
        type="button"
        class="mc-button"
        data-tagco="{'titi' : 'tata', 'tutu' : 'toto'}"
        data-tcevent="tc-event-example"
        data-cerberus="BTN_addtocart"
        data-truc="valeur de truc"
        data-truc2="valeur de truc 2"
    >
        <span class="mc-button__label">Button Data</span>
    </button>
</div>

<div class="example">
    <p class="subtitle">Button as link</p>
    <button type="button" class="mc-link">
        <svg class="ku-icon-24 mc-link__icon mc-link__icon--left"><use href="#Media_Camera_24px"></use></svg>
        <span class="">Button link</span>
    </button>
    <button type="button" class="mc-link mc-link--danger">
        <span class="">Button link danger</span>
    </button>
</div>

</ShowHtml>
</template>
