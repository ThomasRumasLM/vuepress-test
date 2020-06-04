// const { nav, sidebar } = require("vuepress-bar")(`${__dirname}/..`);
const path = require('path');
const dirPath = path.join(process.cwd(), 'docs/pages/');
const sidebarMenu = require('./sidebarMenu');

module.exports = {
    title: 'Core documentation',
    description: 'Just playing around',
    base: '/vuepress-test/',
    head: [
      ['link', { rel: 'icon', href: '/images/favicon.png' }]
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
        // displayAllHeaders: true,
        smoothScroll: true,
        sidebarDepth: 0,
        sidebar: sidebarMenu,
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