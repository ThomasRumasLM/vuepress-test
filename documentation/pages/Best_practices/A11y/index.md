---
title: 'Accessibility'
order: 1
---

# Accessibility

## Table of Contents
1. [What is accessibility?](#presentation)
2. [Guidelines](#guidelines)
3. [Useful elements](#useful)
4. [Screenreaders](#screenreaders)
5. [Tools](#tools)
6. [Useful links](#links)

---

## What is accessibility? 

Web accessibility means making the contents of a site **accessible to any user whatever his context** (hardware or software, network infrastructure, mother tongue, culture, geographical location, age, physical or mental aptitudes. )

There are accessibility guidelines (RGAA, WCAG) which list precise criteria to be respected in order to make the site accessible. It is impossible to meet every criterion of these standards but at Leroy Merlin we will focus on concrete points that we can easily apply to the front-end perimeter and respond to 2 accessibility issues:

1. The integration of the pages allows the use of keyboard navigation: the main functionalities of each component are accessible with the keyboard.
2. Screen readers can browse the pages and the path is understandable.

> **Referrals for all questions on accessibility :** <florence.mcdonagh@ext.leroymerlin.fr>, <matthieu.castier@ext.leroymerlin.fr>

## Guidelines 

**The evaluation grid is available [here](https://docs.google.com/spreadsheets/d/1Gl2EIwU2iw6qN5nPUaeW5oUIsuZ_trS-nsTYF7te5ec/edit#gid=1386834576)**

**Duplicate the sheet to create your evaluation grid.**

Tick the criteria you meet, it increases your score.

If you are not concerned by a criterion, check it anyway so that you don't have to go through it again.

If a criterion does not concern your perimeter but prevents you from validating the criterion, talk to the team concerned. For example, for an item in the base or a feature that has not been developed by your team.

## Useful elements 

- To hide an element visually but still make it readable by screen readers use the `.kl-hidden-accessibility` class.    
- When reading the page, avoid repetition of items. To do this, use the `aria-hidden="true"` attribute    
- **Focus state:** focus-ring-color allows to reuse the default color of the browser focus. This way the user is not disturbed.
```scss
&:focus {
  outline: 1px  dotted  $black;
  outline: 5px  auto -webkit-focus-ring-color;
}
```
- To navigate on the keyboard use the tab and arrow keys.
- To select an element use SPACE or ENTER.
    
## Screenreaders 

### On Mac :
Voice-over (Mac native)
To launch : `cmd + fn + F5`
Read the whole page : `control + option + A`

### On Windows :
NVDA [https://www.nvda-fr.org/cat.php?id=2](https://www.nvda-fr.org/cat.php?id=2)

Summary of shortcuts: [https://www.nvda-fr.org/doc/keyCommands.html](https://www.nvda-fr.org/doc/keyCommands.html)

## Tools 

Here are some plugins to help you identify accessibility points to improve.

- **AXE** : A new tab in the console  
    [https://chrome.google.com/webstore/detail/axe/lhdoppojpmngadmnindnejefpokejbdd](https://chrome.google.com/webstore/detail/axe/lhdoppojpmngadmnindnejefpokejbdd)
- The Chrome Audits tab    
- On Chrome, Web Developer tool bar : [https://chrome.google.com/webstore/detail/web-developer/bfbameneiokkgbdmiekhjnmfkcnldhhm?hl=fr](https://chrome.google.com/webstore/detail/web-developer/bfbameneiokkgbdmiekhjnmfkcnldhhm?hl=fr)
- On Firefox : [https://addons.mozilla.org/fr/firefox/addon/web-developer/?src=search](https://addons.mozilla.org/fr/firefox/addon/web-developer/?src=search)
This will launch WAVE: It provides visual information about the accessibility of the content by injecting icons and indicators into the page. No automated tool can tell you if your page is accessible, but WAVE facilitates human evaluation and informs about accessibility issues.
- The plugin HeadingMap on Firefox : [https://addons.mozilla.org/fr/firefox/addon/headingsmap/](https://addons.mozilla.org/fr/firefox/addon/headingsmap/)
- The plugin HeadingMap on Chrome : [https://chrome.google.com/webstore/detail/headingsmap/flbjommegcjonpdmenkdiocclhjacmbi](https://chrome.google.com/webstore/detail/headingsmap/flbjommegcjonpdmenkdiocclhjacmbi)<br>
This plugin generates a sitemap from the titles found in the page. It identifies title tags that are not in the right order or misused.

## Useful links : 

- [https://www.accede-web.com/notices/](https://www.accede-web.com/notices/)
- [https://www.atalan.fr/agissons/fr/](https://www.atalan.fr/agissons/fr/)
- [https://a11y-style-guide.com/style-guide/](https://a11y-style-guide.com/style-guide/)
- [https://a11yproject.com/](https://a11yproject.com/)
- [https://www.numerique.gouv.fr/publications/rgaa-accessibilite/](https://www.numerique.gouv.fr/publications/rgaa-accessibilite/)
- [https://dequeuniversity.com/library/](https://dequeuniversity.com/library/)

