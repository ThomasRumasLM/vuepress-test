---
title: 'Browsers support'
order: 7
---

# Browsers support

## Browsers list

> **The golden rule** is to support only the 2 last version for each browser

| Browser           | Desktop | Mobile device (tablet, smartphone) |
| ----------------- | ------- | ---------------------------------- |
| EDGE              | ✅     | ❌                                |
| Google chrome     | ✅     | ✅                                |
| Firefox           | ✅     | ✅                                |
| Safari            | ✅     | ✅                                |
| Native android    | ❌     | ❌                                |
| Opera             | ❌     | ❌                                |

## Browsers version

As all rules, we have some exceptions:
* **Firefox v52.0.0**<br/>_In France, physical store operators use a fixed version of Firefox_.
* **Internet explorer v11**<br/>_In France, traffic is still important on this version instead of EDGE development_.

<br/>
<br/>

## Code compatibility

To be as compatible as possible, we provide you some tools to adapt your code automatically for oldest browsers.
* **SCSS** : autoprefixer
* **Javascript** : babel

> Those tools use the `.browserslistrc` file, which follow the rules mentioned above.
> ```json
> # Browsers that we support (used for autoprefixer and babel)
> last 2 versions
> firefox >= 45
> IE >= 11
> ```
