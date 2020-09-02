---
title: New documentation is here!
date: 2020-09-02
description: We just released the new documentation, please read this article to know the new feature.
---

# New documentation is here!

We just released the new Core documentation. It is now based on [Vuepress](https://vuepress.vuejs.org/) and it come with a bunch of new features.

### Search field
On the top bar you  will find a searchbar to help you find what you need.

Page titles and subtitles will appear in the suggestion results.

### Dependencies dashboard
You can now monitor Kobi and Core modules versions throught this <a :href="$withBase('/pages/Dashboard')">Dashboard</a>.

### Tree structure
Here is the new tree structure of the documentation:

```java
📦 pages
 ┣ 📂 Long_time_support
      // Timeline to follow the legacy migrations
 ┣ 📂 Design Foundations
      // Mozaic foundations
 ┣ 📂 Components
      // All the components available with Core (forms, cards, buttons, tags etc.)
 ┣ 📂 Tokens_helpers
      // How to work with tokens for SCSS, JS and Freemarker
 ┣ 📂 Freemarker_helpers
 ┣ 📂 SCSS_helpers
 ┣ 📂 JS_helpers
      // Functions and mixins to ease your work
 ┣ 📂 Guidelines
      // How to work in line with CDP code quality standards (naming, app structure, values etc.)
 ┣ 📂 Workflows
      // Git conventions, R&D workflow etc.
 ┣ 📂 Best_practices
      // best practices and recommandations about langages, unit tests, web performance etc.
 ┣ 📂 Architectures
      // visual representation of Core components interaction
 ┣ 📂 Tools
      // Available tools (Sentry, Validators, Webpagetest)
 ┣ 📂 Kobi
      // Informations to properly set your app (descriptors, i18n)
 ┣ 📂 Contributing
      // How to contribute to Core and this documentation
 ┣ 📂 Dashboard
      // To monitor Kobi and Core app versions
 ┣ 📂 Newcomer_guide
      // Basics about Kobi, Maropolo and useful links for newcomers
```

### Blogging
This very section, to give you informations about this documentation major evolutions.