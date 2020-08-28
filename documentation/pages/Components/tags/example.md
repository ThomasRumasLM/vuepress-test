<template>
<ShowHtml>
<div class="example">
    <p class="subtitle">4 Types :</p>
    <span class="mc-tag-text">
        <span class="mc-tag-text__label">Default text</span>
    </span>
    <br />
    <a class="mc-tag-link">
        <span class="mc-tag-link__label">Type link</span>
    </a>
    <br />
    <span class="mc-tag-selectable">
        <input class="mc-tag-selectable__input" type="checkbox" name="" id="Tags996" />
        <label class="mc-tag-selectable__pill" for="Tags996">
            <span class="mc-tag-selectable__label">Type selectable</span>
        </label>
    </span>
    <br />
    <span class="mc-tag-removable">
        <span class="mc-tag-removable__label">Type removable</span>
        <button class="mc-tag-removable__remove" aria-label="delete tag Type removable"></button>
    </span>
</div>
<div class="example">
    <p class="subtitle">2 themes for all</p>
    <span class="mc-tag-text">
        <span class="mc-tag-text__label">Text light (default)</span>
    </span>
    <br />
    <span class="mc-tag-text mc-tag-text--dark">
        <span class="mc-tag-text__label">Text dark</span>
    </span>
    <br />
    <p class="subtitle">1 custom theme only for type text or link</p>
    <span class="mc-tag-text mc-tag-text--danger">
        <span class="mc-tag-text__label">Text danger</span>
    </span>
    <br />
</div>
<div class="example">
    <p class="subtitle">2 sizes for all</p>
    <span class="mc-tag-text mc-tag-text">
        <span class="mc-tag-text__label">Text medium (default)</span>
    </span>
    <br />
    <span class="mc-tag-text mc-tag-text--s">
        <span class="mc-tag-text__label">Text small</span>
    </span>
    <br />
</div>
<div class="example">
    <p class="subtitle">Type link:</p>
    <a class="mc-tag-link">
        <span class="mc-tag-link__label">Link </span>
    </a>
    <a class="mc-tag-link mc-tag-link--dark">
        <span class="mc-tag-link__label">Link dark</span>
    </a>
</div>
<div class="example">
    <p class="subtitle">Types selectable:</p>
    <span class="mc-tag-selectable">
        <input class="mc-tag-selectable__input" type="checkbox" name="" id="Tags988" />
        <label class="mc-tag-selectable__pill" for="Tags988">
            <span class="mc-tag-selectable__label">Selectable </span>
        </label>
    </span>
    <br />
    <span class="mc-tag-selectable">
        <input class="mc-tag-selectable__input" type="checkbox" name="" disabled id="Tags987" />
        <label class="mc-tag-selectable__pill" for="Tags987">
            <span class="mc-tag-selectable__label">
                Selectable disabled
            </span>
        </label>
    </span>
</div>
<div class="example">
    <p class="subtitle">Types removable:</p>
    <span class="mc-tag-removable">
        <span class="mc-tag-removable__label">Removable </span>
        <button class="mc-tag-removable__remove" aria-label="delete tag Type removable"></button>
    </span>
</div>

<div class="example">
    <p class="subtitle">Custom class and dataAtributes</p>
    <span class="mc-tag-text myCustomClass" data-cerberus="moncerberus" id="myId">
        <span class="mc-tag-text__label">Custom tag</span>
    </span>
</div>

<div class="example">
    <p class="subtitle">List component</p>
    <ul class="mc-tag-list customClassList" id="myId" data-toto="toto">
        <li class="mc-tag-list__item">
            <span class="mc-tag-selectable mycustomClassItem " data-toto="tata">
                <input class="mc-tag-selectable__input" type="checkbox" name="Tags974-input" id="Tags974"
                    disabled="disabled" />
                <label class="mc-tag-selectable__pill" for="Tags974">
                    <span class="mc-tag-selectable__label">item regular 1 </span>
                </label>
            </span>
        </li>
        <li class="mc-tag-list__item">
            <span class="mc-tag-selectable mycustomClassItem " data-toto="toto">
                <input class="mc-tag-selectable__input" type="checkbox" name="Tags973-input" id="Tags973" />
                <label class="mc-tag-selectable__pill" for="Tags973">
                    <span class="mc-tag-selectable__label">item regular 2</span>
                </label>
            </span>
        </li>
        <li class="mc-tag-list__item">
            <span class="mc-tag-selectable mycustomClassItem " data-toto="yoyo">
                <input class="mc-tag-selectable__input" type="checkbox" name="Tags972-input" id="Tags972" />
                <label class="mc-tag-selectable__pill" for="Tags972">
                    <span class="mc-tag-selectable__label">item regular 3</span>
                </label>
            </span>
        </li>
        <li class="mc-tag-list__item">
            <span class="mc-tag-selectable mycustomClassItem " data-toto="yolo">
                <input class="mc-tag-selectable__input" type="checkbox" name="Tags971-input" id="Tags971" />
                <label class="mc-tag-selectable__pill" for="Tags971">
                    <span class="mc-tag-selectable__label">item regular 4</span>
                </label>
            </span>
        </li>
    </ul>
</div>
</ShowHtml>
</template>

<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/05-atoms/tags.atoms';

.example {
  margin: 2rem;

  > * {
    margin-bottom: 1rem;
  }
}
</style>