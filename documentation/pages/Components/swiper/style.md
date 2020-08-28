## File to import

> You have to **use the layout file** to import swiper SCSS.

```scss
@import 'node_modules/integration-web-core--socle/assets/sass/_common/04-layouts/swiper.layout';
```

### Use mixins to generate size 

A SCSS mixin exist to generate automatically the number of swiper element and the gutter you want for each breakpoint, specify on a map

```scss
$myMap: (
  's': (1.5, 16),
  'm': (2.5, 16),
  'l': (4, 24),
  'xl': (5, 24),
  'xxl': (6, 24)
)
@include generateSwiperItems($myMap);
```
