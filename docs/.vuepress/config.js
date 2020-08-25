// const { nav, sidebar } = require("vuepress-bar")(`${__dirname}/..`);
const path = require('path');
const dirPath = path.join(process.cwd(), 'documentation/pages/');
const sidebarMenu = require('./sidebarMenu');

module.exports = {
    title: 'Core documentation',
    description: 'CDP Documentation',
    base: '/integration-web-core--socle/',
    head: [
      ['link', { rel: 'icon', href: '/images/favicon.png' }],
      ['script', {}, `
        (function (i, s, o, g, r, a, m) {
          i['GoogleAnalyticsObject'] = r
          i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
          }
          i[r].l = 1 * new Date()
          a = s.createElement(o)
          m = s.getElementsByTagName(o)[0]
          a.async = 1
          a.src = g
          m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga')
    
        ga('create', 'A-173226665-1', 'auto')
        ga('set', 'anonymizeIp', true)
    
        ga('send', 'pageview')
      `],
      ['script', {}, `
        let commonJs = document.createElement('script');
        commonJs.setAttribute('src', '/javascript/common.js');
        document.head.appendChild(commonJs);
      `]
    ],
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
        smoothScroll: true,
        sidebarDepth: 0,
        sidebar: sidebarMenu,
        lastUpdated: 'Last Updated', // string | boolean
        plugins: [
            '@vuepress/active-header-links'
        ]
    },
    plugins: [
        'vuepress-plugin-element-tabs',
        [
          'mermaidjs',
          {
            theme:'forest',
            themeCSS: ".section { fill: transparent; } .tick text { font-size: 1rem;}",
            gantt: {
              barHeight: 40,
              barGap: 20,
              fontSize: 24,
              fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif'
            }
          }
        ]
    ],
    configureWebpack: {
      module: {
        rules: [
          {
            test: /\.txt$/i,
            use: 'raw-loader',
          },
        ],
      }
    }
}