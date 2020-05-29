---
title: 'HTML'
order: 1
---

## 1 - Style
---

The html tags for styling like `<center>` `<b>` or `<font>` are **forbiden**. In addition you cannot use style attribute on the tags, the style must come only from the css files, and call them at the beginning of the page via the `<link>` tag.

**Verification condition:** No inline style presence in the html code

**Sources:** <Link text="html best practices (paragraph 4 and 7)" blank="true" href="https://blog.tbhcreative.com/2015/08/10-best-practices-in-html.html"></Link>
**Criticality:** Blocking


## 2 - Hierarchy
---

Respect the titles hierarchy : every page should start with a `<h1>`. **Never break a title hierarchy** : a `<h2>` cannot be followed by a `<h4>`.

**Verification condition** : Use on of this extension : <Link text="headingMap" blank="true" href="https://chrome.google.com/webstore/detail/headingsmap/flbjommegcjonpdmenkdiocclhjacmbi"></Link>

**Sources:** <Link text="Heading w3c" blank="true" href="https://www.w3schools.com/html/html_headings.asp"></Link>
**Criticality:** Blocking


## 3 - HTML 5
---

You must give strong semantics to the code, using maximum html 5 tags.

**Verification condition** : 
- Use W3C validator : <Link text="LM w3c Validator" blank="true" href="https://adeo.github.io/integration-web-core--socle/Tools/Validators/"></Link>
- Give coherence in the semantics: no div with a background just to display an image for example

**Sources:** <Link text="Listing html 5 tag" blank="true" href="https://buzut.net/101-balises-html5-exemples/"></Link>
**Criticality:** Blocking