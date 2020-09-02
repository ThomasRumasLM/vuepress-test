## CSS cascade must be respected
It is worth understanding the benefits of the CSS cascade rather than working against it.   
There is rarely a need to declare every style in every component   

* Using **!important** to override the cascade is **forbidden**
* inline styles in HTML
* Using ID to target elements is forbidden   


* **Sources:**  <Link text="CSS cascade" blank=true href="https://developer.mozilla.org/en-US/docs/Web/CSS/Cascade"></Link>
* **What to check:** no **!important** is present in the code.
* **Criticality:** Required

## Optimize CSS Code
The smaller your stylesheet, the quicker it will download and parse
* Simplify Selectors :
    * Even the most complex CSS selectors take milliseconds to parse, but reducing complexity will reduce file sizes and aid browser parsing
    * we set the maximum length of a generated selector to **70 characters**   
    
* Be Wary of Expensive Properties : Browser performance will vary but, in general, anything which causes a recalculation before painting will be more costly in terms of performance ( border-radius, box-shadow, opacity, transform, filter, position: fixed, ...)


## Use Modern Layout Techniques
The use of CSS **float** requires lots of code and margin/padding tweaking to ensure layouts work. Even then, floats will break at smaller screen sizes unless media queries are added.

The modern alternatives:

* **CSS Flexbox** for one-dimensional layouts which (can) wrap to the next row according to the widths of each block. Flexbox is ideal for menus, image galleries, cards, etc.   
* **CSS Grid** for two-dimensional layouts with explicit rows and columns. Grid is ideal for page layouts.  
 
Both options are simpler to develop, use less code, can adapt to any screen size, and render faster than floats because the browser can natively determine the optimum layout.

### Sources:

* [CSS flexbox](https://developer.mozilla.org/en-US/docs/Glossary/Flexbox)
* [CSS Grid](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout)

**Criticality:** Required