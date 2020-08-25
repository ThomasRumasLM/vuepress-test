---
title: 'Escape string'
order: 1
---

# Escape string

## Presentation

Escape simple quotes and double quotes from string   
Replace double quotes with html special character &amp;quot;

## Why
Some products or services contain quotes or double quotes in their label and some components (commanders act, json-ld,...) get these labels directly from html data-attributes.
The problem is that double quotes (even escaped) close the data-attribute before the string is finished.
An other problem is that simple quote can be considered as part of js object format, and lead to js errors.   

It is necessary to have a function which solves this problem in freemarker before it is interpreted by javascript

:::: tabs

::: tab Specs
<'Freemarker_helpers/escape-string/specs.md'>
:::

::::