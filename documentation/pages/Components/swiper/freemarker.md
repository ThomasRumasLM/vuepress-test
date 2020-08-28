> To generate a swiper without having to think about HTML semantic, accessibility, you can use **freemarker macros**.

## File to import

```ftl
<#import "../../macros/common/swiper.ftl" as swipers>
```

## The swiper macro

```html
<@swipers.swiper>
    // Your content following the grid system
</@swipers.swiper>
``` 

## The swiper slider macro 

```html
<@swiper.swiperSlider options = swiperOptions >
    <li class="kl-swiper__slider-item l-slider__item">
        <div>item</div>
    </li>
    <li class="kl-swiper__slider-item l-slider__item">
        <div>item</div>
    </li>
    <li class="kl-swiper__slider-item l-slider__item">
        <div>item</div>
    </li>
    <li class="kl-swiper__slider-item l-slider__item">
        <div>item</div>
    </li>
    <li class="kl-swiper__slider-item l-slider__item">
        <div>item</div>
    </li>
</@swiper.swiperSlider>
```

### Specific options

```ftl
<#assign swiperOptions = {
    "navSize":"l",
    "cssClass" : {
        "container" : "mySwiperSlider",
        "swiperContainer": "kl-container"
    }
}/>
```
<br />
