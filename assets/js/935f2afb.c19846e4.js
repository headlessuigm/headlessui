"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[197],{1109:e=>{e.exports=JSON.parse('{"pluginId":"default","version":"current","label":"Next","banner":null,"badge":false,"className":"docs-version-current","isLast":true,"docsSidebars":{"tutorialSidebar":[{"type":"link","label":"Introduction","href":"/headlessui/docs/intro","docId":"intro"},{"type":"category","label":"Getting Started","collapsible":true,"collapsed":false,"items":[{"type":"link","label":"Quick start","href":"/headlessui/docs/getting-started/quick-start","docId":"getting-started/quick-start"}]},{"type":"category","label":"Guides","collapsible":true,"collapsed":true,"items":[{"type":"link","label":"What\'s headless","href":"/headlessui/docs/guides/whats-headless","docId":"guides/whats-headless"},{"type":"link","label":"Components","href":"/headlessui/docs/guides/components","docId":"guides/components"},{"type":"link","label":"Children and parents","href":"/headlessui/docs/guides/children-and-parents","docId":"guides/children-and-parents"}]},{"type":"category","label":"Components","collapsible":true,"collapsed":true,"items":[{"type":"link","label":"Base","href":"/headlessui/docs/components/base","docId":"components/base"},{"type":"link","label":"Label","href":"/headlessui/docs/components/label","docId":"components/label"},{"type":"link","label":"Button","href":"/headlessui/docs/components/button","docId":"components/button"},{"type":"link","label":"Checkbox","href":"/headlessui/docs/components/checkbox","docId":"components/checkbox"},{"type":"link","label":"Notification","href":"/headlessui/docs/components/notification","docId":"components/notification"},{"type":"link","label":"Slider","href":"/headlessui/docs/components/slider","docId":"components/slider"},{"type":"link","label":"Scrollbar","href":"/headlessui/docs/components/scrollbar","docId":"components/scrollbar"},{"type":"link","label":"Scrollable Container","href":"/headlessui/docs/components/scrollable-container","docId":"components/scrollable-container"},{"type":"link","label":"Draggable","href":"/headlessui/docs/components/draggable","docId":"components/draggable"},{"type":"link","label":"Layer","href":"/headlessui/docs/components/layer","docId":"components/layer"},{"type":"link","label":"Select with Arrows","href":"/headlessui/docs/components/selectArrows","docId":"components/selectArrows"},{"type":"link","label":"Tooltip","href":"/headlessui/docs/components/tooltip","docId":"components/tooltip"}]},{"type":"category","label":"Advanced Topics","collapsible":true,"collapsed":true,"items":[{"type":"link","label":"Create your own components","href":"/headlessui/docs/advanced-topics/create-your-own-components","docId":"advanced-topics/create-your-own-components"},{"type":"link","label":"Batched rendering","href":"/headlessui/docs/advanced-topics/batched-rendering","docId":"advanced-topics/batched-rendering"}]}]},"docs":{"advanced-topics/batched-rendering":{"id":"advanced-topics/batched-rendering","title":"Batched rendering","description":"In order to optimize the components rendering, they are drawn onto their own surfaces only when their state changes, e.g. if a button is pressed. The surfaces are then drawn on the parent surfaces, all way up to the Application Surface.","sidebar":"tutorialSidebar"},"advanced-topics/create-your-own-components":{"id":"advanced-topics/create-your-own-components","title":"Create your own components","description":"Since components are splitted into a logic function and a render function, you just need to create two functions with the name you like.","sidebar":"tutorialSidebar"},"components/base":{"id":"components/base","title":"Base component (UihComponent)","description":"This is the base internal component that all other components extend. It defines variables and methods that are widely used.","sidebar":"tutorialSidebar"},"components/button":{"id":"components/button","title":"Button","description":"Example","sidebar":"tutorialSidebar"},"components/checkbox":{"id":"components/checkbox","title":"Checkbox","description":"Example","sidebar":"tutorialSidebar"},"components/draggable":{"id":"components/draggable","title":"Draggable","description":"A draggable is a renderless component that can be dragged around, moving its children components with it.","sidebar":"tutorialSidebar"},"components/label":{"id":"components/label","title":"Label","description":"Example","sidebar":"tutorialSidebar"},"components/layer":{"id":"components/layer","title":"Layer","description":"A layer is a renderless component that handles the z-order of its children components.","sidebar":"tutorialSidebar"},"components/notification":{"id":"components/notification","title":"Notification","description":"This component displays a list of notifications that are automatically removed in a short time, useful e.g. to notify the player of a in-game event.","sidebar":"tutorialSidebar"},"components/scrollable-container":{"id":"components/scrollable-container","title":"Scrollable Container","description":"This is a basic component to handle a container with a scrollable area and the related scrollbar.","sidebar":"tutorialSidebar"},"components/scrollbar":{"id":"components/scrollbar","title":"Scrollbar","description":"Example","sidebar":"tutorialSidebar"},"components/selectArrows":{"id":"components/selectArrows","title":"Select with Arrows","description":"Example","sidebar":"tutorialSidebar"},"components/slider":{"id":"components/slider","title":"Slider","description":"Example","sidebar":"tutorialSidebar"},"components/tooltip":{"id":"components/tooltip","title":"Tooltip","description":"Example","sidebar":"tutorialSidebar"},"getting-started/quick-start":{"id":"getting-started/quick-start","title":"Quick start","description":"To add Headless UI to your game, let\'s download the latest stable package from the Github releases page.","sidebar":"tutorialSidebar"},"guides/children-and-parents":{"id":"guides/children-and-parents","title":"Children and parents","description":"Every component has a parent and a list of children. By default all components have the root layer as parent.","sidebar":"tutorialSidebar"},"guides/components":{"id":"guides/components","title":"Components","description":"Every piece of the UI is a component, with its own surface and its own data contained in a struct called state.","sidebar":"tutorialSidebar"},"guides/whats-headless":{"id":"guides/whats-headless","title":"What\'s headless?","description":"Headless means that the components step and draw are isolated and are fully customizable by the developer.","sidebar":"tutorialSidebar"},"intro":{"id":"intro","title":"intro","description":"Headless UI","sidebar":"tutorialSidebar"}}}')}}]);