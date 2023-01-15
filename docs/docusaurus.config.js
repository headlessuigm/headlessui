// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'Headless UI',
  tagline: 'UI for GameMaker Studio',
  url: 'https://headlessuigm.github.io',
  baseUrl: '/headlessui/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  deploymentBranch: 'gh-pages',
  favicon: 'img/favicon.png',
  organizationName: 'headlessuigm',
  projectName: 'headlessui',
  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl:
            'https://github.com/headlessuigm/headlessui/blob/main/docs/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      navbar: {
        title: 'Headless UI',
        logo: {
          alt: 'Headless UI Logo',
          src: 'img/logo.png',
        },
        items: [
          {
            type: 'doc',
            docId: 'intro',
            position: 'left',
            label: 'Docs',
          },
          {
            href: 'https://github.com/headlessuigm/headlessui',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        //   links: [
        //     {
        //       title: 'Docs',
        //       items: [
        //         {
        //           label: 'Docs',
        //           to: '/docs/intro',
        //         },
        //       ],
        //     },
        //     {
        //       title: 'Community',
        //       items: [
        //         {
        //           label: 'Stack Overflow',
        //           href: 'https://stackoverflow.com/questions/tagged/docusaurus',
        //         },
        //         {
        //           label: 'Discord',
        //           href: 'https://discordapp.com/invite/docusaurus',
        //         },
        //         {
        //           label: 'Twitter',
        //           href: 'https://twitter.com/docusaurus',
        //         },
        //       ],
        //     },
        //     {
        //       title: 'More',
        //       items: [
        //         {
        //           label: 'GitHub',
        //           href: 'https://github.com/headlessuigm/headlessui',
        //         },
        //       ],
        //     },
        //   ],
        copyright: `Copyright © ${new Date().getFullYear()} Headless UI`,
      },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
      },
    }),
};

module.exports = config;
