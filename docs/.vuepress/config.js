const { nav, sidebar } = require("vuepress-bar")(`${__dirname}/..`);
const path = require('path');
const dirPath = path.join(process.cwd(), 'docs/pages/');

module.exports = {
    title: 'Core documentation',
    description: 'Just playing around',
    base: '/vuepress-test/',
    markdown: {
        lineNumbers: true,
        plugins: [
          ['markdown-it-include', {
            root: dirPath,
            includeRe: /\<\'\s*\s*(.+?)\s*\'\>/i // pattern : <'path/to/file'>
          }]
        ]
    },
    themeConfig: {
        nav: [
            { text: 'Home', link: '/' },
            { text: 'Documentation', link: '/pages/' },
            { text: 'Github', link: 'https://github.com/adeo/integration-web-core--socle' }
        ],
        // displayAllHeaders: true,
        smoothScroll: true,
        sidebar: [
          '/pages/long_time_support/',
          {
            title: 'Foundations',
            path: '/pages/foundations/',
            children: [
              '/pages/foundations/Borders/',
              '/pages/foundations/Breakpoints/',
              '/pages/foundations/Colors/',
              '/pages/foundations/Container/',
              '/pages/foundations/Icons/',
              '/pages/foundations/Images/',
              '/pages/foundations/MagicUnit/',
              '/pages/foundations/Shadows/',
              '/pages/foundations/Spaces/',
              '/pages/foundations/Typography/'
            ]
          },
          {
            title: 'Components',
            path: '/pages/components/',
            children: [
              '/pages/components/buttons/'
            ]
          },
          {
            title: 'Freemarker helpers',
            path: '/pages/Freemarker_helpers/',
            children: [
              '/pages/Freemarker_helpers/escape-string/',
              '/pages/Freemarker_helpers/not-empty/'
            ]
          },
          {
            title: 'Javascript helpers',
            path: '/pages/JS_helpers/',
            children: [
              '/pages/JS_helpers/closest/',
              '/pages/JS_helpers/cookie/',
              '/pages/JS_helpers/delegateEvent/',
              '/pages/JS_helpers/fetch/',
              '/pages/JS_helpers/foreach/',
              '/pages/JS_helpers/genericalLoader/'
            ]
          },
          {
            title: 'SCSS helpers',
            path: '/pages/SCSS_helpers/',
            children: [
              '/pages/SCSS_helpers/Font/',
              '/pages/SCSS_helpers/ResetMixin/',
              '/pages/SCSS_helpers/Separator/',
              '/pages/SCSS_helpers/Space/',
              '/pages/SCSS_helpers/Unit/'
            ]
          },
          {
            title: 'Guidelines',
            path: '/pages/guidelines/',
            children: [
              '/pages/guidelines/Browsers/',
              '/pages/guidelines/Javascript/',
              '/pages/guidelines/Mobile_first/',
              '/pages/guidelines/Scss/'
            ]
          },
          {
            title: 'Workflows',
            path: '/pages/workflows/',
            children: [
              '/pages/workflows/Contributing/',
              '/pages/workflows/Git_conventions/',
              '/pages/workflows/Migration/',
              '/pages/workflows/R&D/',
              '/pages/workflows/Releasing/'
            ]
          },
          {
            title: 'Best practices',
            path: '/pages/best_practices/',
            children: [
              '/pages/best_practices/A11y/',
              '/pages/best_practices/CSS_SASS/',
              '/pages/best_practices/Freemarker/',
              '/pages/best_practices/GreenIT/',
              '/pages/best_practices/HTML/',
              '/pages/best_practices/Javascript_back/',
              '/pages/best_practices/Javascript_front/',
              '/pages/best_practices/Unit_tests/',
              '/pages/best_practices/Web_performance/'
            ]
          },
          '/pages/architectures/',
          {
            title: 'Tools',
            path: '/pages/tools/',
            children: [
              '/pages/tools/Validators/',
              '/pages/tools/Webpagetest/'
            ]
          },
          '/pages/kobi/',
          '/pages/contributing/'
        ],
        plugins: [
            '@vuepress/active-header-links'
        ]
    },
    plugins: [
        'vuepress-plugin-element-tabs'
    ]
}