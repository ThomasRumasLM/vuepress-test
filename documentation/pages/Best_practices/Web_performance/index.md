---
title: 'Web performances'
order: 1
---

# Web performances

## Think different, CSS is powerful 

The first reflexion you need to have when you want to improve yourself in webperformance during your development, it's to think different than you do as usual. 

For example, you're a great javascript developer but not really good at CSS. By default, you will apply all your skins develop in javascript to doing stuff needed, but that's not the good reflexion you need to have, make search if it's possible to do it in CSS first. 

For example you can see other the web for a horizontal scrolling or vertical scrolling, people will often use javascript to do it, but in fact, CSS do fully the job. You can create a HTML section with an `overflow` to deal with scroll. 

In LMFR website, the great exemple about this point of view it's the usage of our carousel based on tiny-slider (that's not tiny at all) for just a horizontal products scrolling. We remake it in pure CSS for scrolling gestion, and we win in all web performance metrics : 

Gain on : 
* FCP
* DOMReady
* DOMLoaded
* Size 
* Speed Index
* ...

So to resume this section, CSS is really powerful, don't forget it and try to do it in CSS first before any other language. 

## Be smart on events

The second point to have the most efficient effort to increase web performance in your development, it's to init functions in the good event. For example, it's not necessary to load in DOMReady all functions that init an event (click, scroll, submit...) if your section is after the waterline in the browser, prefer to init them when the load event is triggered or better, you can use an [intersection observer](https://developer.mozilla.org/fr/docs/Web/API/Intersection_Observer_API) to wait your section is in waterline to init it. 

Also, when you need to follow a scroll or a resize can use huge performance issus on certain browsers. So you must use a debounce to avoid executing your code statement X times event is triggered, [see this article](https://gomakethings.com/debouncing-your-javascript-events/).

With using debounce for your event that need it, the reflow and repaint inside browser will be reduce drasticaly and give an amelioration for user who visit our website. 

Gain on : 
* Reflow 
* Repaint


##### Forbidden 

```javascript
window.addEventListener('scroll', function() {
	var element = document.querySelector('#main-container');
	var position = element.getBoundingClientRect();

	// checking for partial visibility
	if(position.top < window.innerHeight && position.bottom >= 0) {
		console.log('Element is partially visible in screen');
	}
});
```

##### Must do

```javascript
var observer = new IntersectionObserver(function(entries) {
	// isIntersecting is true when element and viewport are overlapping
	// isIntersecting is false when element and viewport don't overlap
	if(entries[0].isIntersecting === true)
		console.log('Element has just become visible in screen');
}, { threshold: [0] });

observer.observe(document.querySelector("#main-container"));
```


## Mobile first to rule them all

All of you know that we need to do mobile first, but we don't see it in each page of our website. Don't forget to declare mobile rules at first inside your CSS, why we need to do this ? Because actually the amount of people who navigate on website with a mobile increase each month, actually it's represent 60% of website traffic around the world. So by declaring mobile first rules, we will be able to optimize website for 60% of people. 

Also, CSS isn't the only part of your code that need to be on mobile site, your HTML too. We see a lot that `picture` tag isn't use enough on our side. It's the easiest way to optimize web performance of your webpage. By example, if in mobile the viewport for your image has a width of 300px, why don't load a picture with 300px therefore the one in 1000px that's necessary only when we trigger the desktop responsive breakpoint ? 

And to finish, you can decrease the image quality by 25% minimum, this will reduce the size of your picture and save bandwidth. 

Don't forget to **lazy load** all static ressources that not critical for users comprehension. 

Gain on : 
* Images size
* Network bandwidth

##### Forbidden

```CSS
p {
  font-family: sans-serif;
  font-size: 21px;
}

@media screen and (max-width: 640px) {
  p {
    font-size: 16px;
  }
}
```

```HTML
<img src="/media/examples/painted-hand-298-332.jpg" />
```

##### Must do 

```CSS
p {
  font-family: sans-serif;
  font-size: 16px;
}

@media screen and (min-width: 640px) {
  p {
    font-size: 21px;
  }
}
```

```HTML
<picture>
    <source srcset="/media/examples/surfer-240-200.jpg"
            media="(min-width: 800px)">
    <img src="/media/examples/painted-hand-298-332.jpg" />
</picture>
```

## Your HTML need only a proper DOM 

We will repeat it again, but by with a proper semantical and hierarchical DOM will permit to increase web performance. 

Gain on : 
* DOMReady 
* Page's size

##### Forbidden

```HTML
<div>
    <a href="#">my link</a>
</div>
```

##### Must do 

```HTML
<a href="#" class="displayBlock">my link</a>
```
