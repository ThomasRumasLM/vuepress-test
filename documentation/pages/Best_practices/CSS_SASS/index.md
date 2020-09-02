---
title: 'CSS / SCSS'
order: 1
---

# CSS / SCSS

## No css style in the html code

All styles must be called **at the top** of the template using `<link>` or `<style>` HTMLtags.

The closer the call is to the bottom of the page, the more the display will be delayed in the page

## All the css must be written using SASS, then the css is minified

* **Sources:**  <Link text="Documentation SASS" blank=true href="https://sass-lang.com/documentation"></Link>
* **What to check:** is the CSS minified ? No css file in the sources.
* **Criticality:** Required

:::: tabs

::: tab SCSS naming convention
<'Best_practices/CSS_SASS/sassNaming.md'>
:::

::: tab Writing best practices
<'Best_practices/CSS_SASS/writing.md'>
:::

::: tab Stylelint
<'Best_practices/CSS_SASS/stylelint.md'>
:::

::::
