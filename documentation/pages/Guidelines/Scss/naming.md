## 1. A SCSS file use the same name as the class its contains

A file named `_button.scss` should content a block class like `.mc-button`

```scss
// File path : 04-atoms/_button.scss

.mc-button {
    // ...
}
```

❌ Never add an other class into a file that doesn't have the same name<br/>
```scss
.km-card {
  background: grey;

  .mc-button {
    padding: 1rem;
  }
}
```

✔️ Create a new class to add contextual style to an other block
```html
<div class="km-card">
    <button type="button" class="mc-button km-card__button">My button</button>
</div>
```

```scss
.km-card {
  background: grey;

  &__button {
    // The class allow you to understand that the padding of 
    // the button is override ONLY in the context of these card molecule
    padding: 1rem;
  }
}
```

## 2. A SCSS file have a suffix

Except the `.scss` extension, a file name should have a suffix which mention the ITCSS category even if the file is already stored in the directory corresponding to this same category.

```tree
_common_/
├── 05-atoms/
│   ├── _button.atom.scss
│   ├── ...
├── 06-molecules/
│   └── _menu.molecule.scss
├── ...
```

## 3. A SCSS classname have a prefix

The first rule is to **add a prefix to every classes** you will create. 

The reason is the need to **make a difference between LMF Core classes and MOZAIC classes** and assign as well as possible run and enhancement if needed.

> **The prefixe is composed of 2 elements** `k` which identify LMF Core classes and a letter that identify the ITCSS category

| **ITCSS Category** | Classname |
| ------------------ | ------- |
| Layout             | `kl-[classname]` |
| Atom               | `ka-[classname]` |
| Molecule           | `km-[classname]` |
| Organism           | `ko-[classname]` |
| Utility            | `ku-[classname]` |
| **Mozaic Category** | Mozaic |
| Component          | `mc-[classname]` |
| Layout             | `ml-[classname]` |
| Utility            | `mu-[classname]` |
| Typography         | `mt-[classname]` |

### Exceptions

> In some case prefixe is still necessary but doesn't respect the same naming convention

1. **States classes**

States classes starts with an auxilary verb **be** (or **have** in fiew cases) like `.is-open` or `.has-no-results`

States classes can only be used in combination with another BEM entity :

```css
.km-accordion.is-open {
  /* ...; */
}

.km-search__results.has-none {
  /* ...; */
}
```

A state can be defined by the fact that it may change due to user interactions or server response. Modifiers are a variations of an element. For example, a button can have modifiers to be a loader button, with a spinning icon `.mc-button--loader`, but a sate in witch it is waiting for a server response, like `.mc-button--loader.is-loading`.


2. **Javascript classes**

Javascript classes starts with a specific prefixe not matter the origin of the project (LMF Core or Mozaic) **js-** like `js-add-to-cart` or `js-open-popin`

**Javascript classes don't have to be used in a scss file** but only in javascript file as a selector

```js
let addToCartButtons = document.querySelectorAll('.js-add-to-cart');
```

## 4. A SCSS classname is as generic as possible

To be consider as generic and common to all project, a css class should be generic respecting some rules :
* no size mention
* no color mention
* no display or position mention
* no abbreviation to be as understandable as possible

## 5. A SCSS classname use the BEM semantics

![BEM Semantics](/images/classname.jpg)

* ✔️ A modifier can be apply to a block entity
```scss
.ka-block {
  color: red;

  &--blue-modifier {
    color: blue;
  }
}
```

✔️ A modifier can be apply to an element
```scss
.ka-block {
  color: red;

  &__element {
    font-size: 1rem;

    &--light {
      font-weight: light;
    }
  }
}
```

❌ A modifier can't be combine to an other one
```scss
.ka-block {
    color: red;

    &__element {
        font-size: 1rem;

        &--light {
            font-weight: light;

            &--green {
                color: green;
            }
        }
    }
}
```

<br/>

✔️ An element is a child of a block entity
```scss
.ka-block {
    color: red;

    &__element {
        font-size: 1rem;
    }
}
```

❌ A block entity **doesn't have more than one level of children**
```scss
.ka-block {
    color: red;

    &__element {
        font-size: 1rem;

        &__second-element { // Forbidden
            margin-top: 1rem;
        }
    }
}
```

✔️ **All elements are at the same level** of cascading (no matter the HTML structure)
```scss
.ka-block {
    color: red;

    &__element {
        font-size: 1rem;
    }

    &__second-element {
        margin-top: 1rem;
    }
}
```

## 6. Utility classes should be use well

> Utility classes are recognizable thanks to its prefixe `mu-[classname]`.<br/> They are distributed by MOZAIC.

Its allow you to apply some style **without need to write some css but only adding a css class into your html** BUT you have to remember that every pattern is independant and autonomous and **should not be dependant of external CSS.**

Utility classes a**re only available for spacing**.

Here some rules and examples to help you to understand how to use utility the best way you can

❌ A utlity class **should not be combine to an other class**
```html
<div class="kl-my-layout mu-mt-100">
    <!-- My layout content -->
</div>
```
In the example, the margin-top is part of the layout and should be define directly by `kl-my-layout`.

✔️ A utlity class **can be use to build a layout**
```html
<div class="mu-mt-100">
    <article class="km-article">
        <!-- My article content -->
    </article>
    <article class="km-article">
        <!-- My article content -->
    </article>
    <article class="km-article">
        <!-- My article content -->
    </article>
</div>
```

✔️ Instead of using utility class, **you can use utility variable**<br/>
Each utility class have a SCSS variable equivalence<br/>
[See Mozaic variable](http://mozaic.adeo.cloud/Foundations/MagicUnit/)
