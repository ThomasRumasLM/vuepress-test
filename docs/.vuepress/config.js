const { nav, sidebar } = require("vuepress-bar")(`${__dirname}/..`);

module.exports = {
    title: 'Core documentation',
    description: 'Just playing around',
    themeConfig: {
        nav: [
            { text: 'Home', link: '/' },
            { text: 'Documentation', link: '/components/' },
            { text: 'Github', link: 'https://github.com/adeo/integration-web-core--socle' }
        ],
        sidebar
    },
    plugins: [
        'vuepress-plugin-element-tabs'
    ]
}