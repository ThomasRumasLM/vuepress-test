---
title: 'Rating Stars'
order: 1
---

> **The Evaluations component** provide insights into opinions and experiences. It also allows users to give their own evaluation.

**WARNING** : Mozaic buttons are available, so LMFR buttons are now considered legacy.
> You can find the rating stats usages on the [Mozaic Documentation](http://mozaic.adeo.cloud/Components/RatingStars/)

2 rating stars variations are availabe:
- Rating stars result to display the global score
- Rating stars input to fill or amend an opinion

## Display
This allows the user to rate a product or a service. The user can only give an integer rate from 0 to 5 by clicking the corresponding star.

<'Components/rating-stars/example-display.md'>

## Input
This use case is made to display notes from 0 to 5. This case allows half values, like 2,5 stars for example. This case shows the results of user rated products or services.

<'Components/rating-stars/example-input.md'>

#### Depreciated
> Long time support of former button classes will end on **10th september 2020**.

:::: tabs

::: tab Freemarker
<'Components/rating-stars/freemarker.md'>
:::

::: tab SCSS
<'Components/rating-stars/style.md'>
:::

::::