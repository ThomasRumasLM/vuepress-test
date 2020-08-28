'use strict';
const mozaicRules = require('@mozaic-ds/css-dev-tools/styleLintConfig.js');

const customExtends = ['stylelint-config-sass-guidelines'];
const customRules = {
  // Need to be fixed
  'value-no-vendor-prefix': [true, {'severity': 'warning'}],
  'property-no-vendor-prefix': [
    true,
    {
      'ignoreProperties': [
        'clip-path', 'appearance'
      ],
      'severity': 'warning'
    }
  ],

  // Needed at the moment
  'at-rule-blacklist': null,
  'declaration-property-value-blacklist': null,
  'function-url-quotes': null,
  'max-nesting-depth': null,
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

const stylelintConfig = mozaicRules;
stylelintConfig.extends = [...mozaicRules.extends, ...customExtends];
stylelintConfig.rules = { ...mozaicRules.rules, ...customRules };

module.exports = stylelintConfig;