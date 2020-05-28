## Introduction

BEM was created by **Yandex**, the "Russian Google" in 2009.

> It is a **component based architecture** and naming convention that stand for **Block / Element / Modifier** and relies **only on classes** to create meaningful scalables architectures.

We will explain the basics here, but we recommend developers on learning BEM : read the full documentation.

_Note that in the following examples, the prefixes are symbolised by `pr` in front of the classes._

![BEM Principles](http://getbem.com/assets/github_captions.jpg)

## Blocks

> You can think of them as components, they are reusable pieces of interface.

* ✔️ Blocks can be nested in one another
* ✔️ Blocks can be moved between pages and projects
* ✔️ An interface can contain mulitple instances of the same block

---

**_Syntax_**

```scss
.pr-block-name {
    // ...;
}
```

<br/>
<br/>

## Elements

> A constituant of a block, or children

* ❌ An element can't be used outside of his block.

---

**_Syntax_**

```scss
.pr-block-name {
    // ...;
    &__element-name {
       //  ...;
    }
}
```

<br/>
<br/>

## Modifiers

> A BEM entity that defines a variation in appearance and behavior of a block or an element.

* ❌ A modifier can't be apply to an other modifier.
* ✔️ A modifier class can be cumulate with an other one

---

**_Syntax_**

```scss
.pr-block-name{
    &--modifier-name {
        // ...;
    }
    &__element-name {
        &--modifier-name {
            // ...;
        }
    }
}
```

### Responsive modifiers
Responsive modifiers are classes that apply theire styles only at a certain breakpoint.

they have a sufix `@` follwed by the name of the viewport they apply to `from-xl`

example: `.ku-hidden@from-m`

to be able to work, the @ character need to be escaped in the css files `.ku-hidden\@from-m` but can be called without the backslash on the dom : `<span class="ku-hidden@from-m"> hide me at M screens </span>`

---

[http://getbem.com/introduction/](http://getbem.com/introduction/)
