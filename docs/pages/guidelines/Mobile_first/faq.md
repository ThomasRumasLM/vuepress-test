## FAQ

> Here you can find asked questions at the beggining of the mobile first at LMF. <br/> 

**_If you don't find the answer, feel free to ask it on the slack channel #lmfr-int-core-support_**, the core team will be happy to help you and you question(s) will be added to this page to benefit to others.

### Can i still use the CSS Grid ?

Of course, you can.
<br/>
I would like to say you have to but there is some exceptions

<br/>

**✔️ You have to use the CSS Grid available in all pages** if you don't have to re-organize your content for each device

**❌ You can decide to use flex or anything else you want** if you have to re-organize your content, change hierarchy depending on device or if CSS Grid doesn't fits your responsive needs because it could happen

**⚠️ You can also decide to use the MOZAIC flexy grid** but be careful about your page performance because it could cause a raise of your css ressource's weight


### How to add images ?

**The best solution is to display images on all your device**

**✔️ Prefer usage of `<picture />` HTML tag** to add image to your project. The Freemarker macro `<@image.picture>` allows you to add images easily and serve the good size depending on the device screen size.
**✔️ Use `<img />` HTML tag** if your image always has the same size on every devices, and add a lazy loading css class.

**✔️ Don't forget to use CDN image profiling**

**⚠️ Don't forget to use lazyloading** which allow to load images and content depending on scroll position and first load position
