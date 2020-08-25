---
title: 'HTML'
order: 1
---

# HTML

## 1 - Style

The html tags for styling like `<center>` `<b>` or `<font>` are **forbiden**. In addition you cannot use style attribute on the tags, the style must come only from the css files, and call them at the beginning of the page via the `<link>` tag.

**Verification condition:** No inline style presence in the html code

**Sources:** [html best practices (paragraph 4 and 7)](https://blog.tbhcreative.com/2015/08/10-best-practices-in-html.html)

**Criticality:** Blocking

## 2 - Hierarchy

Respect the titles hierarchy : every page should start with a `<h1>`. **Never break a title hierarchy** : a `<h2>` cannot be followed by a `<h4>`.

**Verification condition** : Use on of this extension : [headingMap](https://chrome.google.com/webstore/detail/headingsmap/flbjommegcjonpdmenkdiocclhjacmbi)

**Sources:** [Heading w3c](https://www.w3schools.com/html/html_headings.asp)

**Criticality:** Blocking

## 3 - HTML 5

You must give strong semantics to the code, using maximum html 5 tags.

**Verification condition** : 
- Use W3C validator : [LM w3c Validator](https://adeo.github.io/integration-web-core--socle/Tools/Validators/)
- Give coherence in the semantics: no div with a background just to display an image for example

**Sources:** [Listing html 5 tag](https://buzut.net/101-balises-html5-exemples/)

**Criticality:** Blocking