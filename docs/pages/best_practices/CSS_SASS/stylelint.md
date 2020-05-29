## SCSS linter

> A **SCSS linter** is a tool to help you keeping your SCSS files clean and readable by running it against a collection of configurable linter rules.
You can run it manually from the command line `npm run stylelint`, and it's also integrated as a pre-commit hook.

## Mozaix stylelint presets
[Mozaic](http://mozaic.adeo.cloud/) SCSS linter is based on `stylelint`, with its `stylelint-config-standard` settings. It also uses `stylelint-scss`.
These settings provide a strong foundation, but wee need to extend and improve it.

## Core base settings
Based on [sass guidelines](https://sass-guidelin.es/), the [stylelint-config-sass-guidelines](https://github.com/bjankord/stylelint-config-sass-guidelines) preset is a good start to impove our stylelint rules section.

It includes [stylelint-scss](https://github.com/kristerkari/stylelint-scss) and [stylelint-order](https://github.com/hudochenkov/stylelint-order) plugins

> Take a look a these settings, you will learn a lot about best SCSS practices

## Core specific settings
The previous rules are a goal we tend to reach, but LMF has legacy, and specific needs and constraints. So we had to set our own rules, and they need to be discussed and improved.

```js
const customRules = {
  // Need to be fixed
  'value-no-vendor-prefix': [true, {'severity': 'warning'}],
  'property-no-vendor-prefix': [true, {'severity': 'warning'}],

  // Needed at the moment
  'at-rule-blacklist': null,
  'declaration-property-value-blacklist': null,
  'function-url-quotes': [
    'always',
    {except: ['empty']}
  ],
  'max-nesting-depth': [
    1,
    {
      'ignoreAtRules': ['each','media','supports','include'],
      'severity': 'warning'
    }
  ],
  'selector-class-pattern': [
    '^[a-z0-9-_]+$',
    {'message': 'Selector should be written in lowercase (selector-class-pattern)'}
  ],
  'selector-no-qualifying-type': [
    true,
    {ignore: ['attribute', 'class']}
  ],
  'scss/at-mixin-pattern': [
    '^[A-z]+([A-z0-9-]+[A-z0-9]+)?$',
    { 'severity': 'warning' }
  ],
  'scss/dollar-variable-pattern': [
    '^[_]?[A-z]+([A-z0-9-]+[A-z0-9]+)?$',
    { 'severity': 'warning' }
  ],
  'order/properties-alphabetical-order': null

  // Has been fixed
  // 'string-quotes': null,
  // 'scss/dollar-variable-colon-space-after': null,
  // 'shorthand-property-no-redundant-values': null,
  // 'scss/at-import-no-partial-leading-underscore': null,
  // 'scss/at-import-partial-extension-blacklist': null,
  // 'scss/dollar-variable-colon-space-before': null,
  // 'order/order': null,
};
```

## Make the linter great again
As you can see above, some rules had been added to avoid useless warnings, and we added regex and patterns that fit our current needs.
You can discuss them and challenge them of course, to provide a better tool !