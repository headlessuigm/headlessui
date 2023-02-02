"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[933],{3905:(e,t,n)=>{n.d(t,{Zo:()=>c,kt:()=>u});var r=n(7294);function a(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function l(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function i(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?l(Object(n),!0).forEach((function(t){a(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):l(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function s(e,t){if(null==e)return{};var n,r,a=function(e,t){if(null==e)return{};var n,r,a={},l=Object.keys(e);for(r=0;r<l.length;r++)n=l[r],t.indexOf(n)>=0||(a[n]=e[n]);return a}(e,t);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(r=0;r<l.length;r++)n=l[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(a[n]=e[n])}return a}var o=r.createContext({}),p=function(e){var t=r.useContext(o),n=t;return e&&(n="function"==typeof e?e(t):i(i({},t),e)),n},c=function(e){var t=p(e.components);return r.createElement(o.Provider,{value:t},e.children)},m={inlineCode:"code",wrapper:function(e){var t=e.children;return r.createElement(r.Fragment,{},t)}},d=r.forwardRef((function(e,t){var n=e.components,a=e.mdxType,l=e.originalType,o=e.parentName,c=s(e,["components","mdxType","originalType","parentName"]),d=p(n),u=a,h=d["".concat(o,".").concat(u)]||d[u]||m[u]||l;return n?r.createElement(h,i(i({ref:t},c),{},{components:n})):r.createElement(h,i({ref:t},c))}));function u(e,t){var n=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var l=n.length,i=new Array(l);i[0]=d;var s={};for(var o in t)hasOwnProperty.call(t,o)&&(s[o]=t[o]);s.originalType=e,s.mdxType="string"==typeof e?e:a,i[1]=s;for(var p=2;p<l;p++)i[p]=n[p];return r.createElement.apply(null,i)}return r.createElement.apply(null,n)}d.displayName="MDXCreateElement"},5178:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>o,contentTitle:()=>i,default:()=>m,frontMatter:()=>l,metadata:()=>s,toc:()=>p});var r=n(7462),a=(n(7294),n(3905));const l={sidebar_position:10},i="Select with Arrows",s={unversionedId:"components/selectArrows",id:"components/selectArrows",title:"Select with Arrows",description:"Example",source:"@site/docs/components/selectArrows.md",sourceDirName:"components",slug:"/components/selectArrows",permalink:"/headlessui/docs/components/selectArrows",draft:!1,editUrl:"https://github.com/headlessuigm/headlessui/blob/main/docs/docs/components/selectArrows.md",tags:[],version:"current",sidebarPosition:10,frontMatter:{sidebar_position:10},sidebar:"tutorialSidebar",previous:{title:"Layer",permalink:"/headlessui/docs/components/layer"},next:{title:"Tooltip",permalink:"/headlessui/docs/components/tooltip"}},o={},p=[{value:"Example",id:"example",level:3},{value:"State reference",id:"state-reference",level:3},{value:"Methods",id:"methods",level:3},{value:"set_items(items)",id:"set_itemsitems",level:4},{value:"next()",id:"next",level:3},{value:"previous()",id:"previous",level:3},{value:"Events",id:"events",level:3}],c={toc:p};function m(e){let{components:t,...n}=e;return(0,a.kt)("wrapper",(0,r.Z)({},c,n,{components:t,mdxType:"MDXLayout"}),(0,a.kt)("h1",{id:"select-with-arrows"},"Select with Arrows"),(0,a.kt)("h3",{id:"example"},"Example"),(0,a.kt)("p",null,"This example includes also the children buttons that are necessary for the behavior of this component. In the future, this piece will be wrapped in a single function"),(0,a.kt)("pre",null,(0,a.kt)("code",{parentName:"pre",className:"language-js"},'var selectArrows = new UiSelectArrows(300, 360, 200, 30);\nselectArrows.set_items([{ key: "item0", label: "Item 0" }, { key: "item1", label: "Item 1" }, { key: "item2", label: "Item 2"} ]);\n\nvar selectArrowsBtnPrev = new UiButton(0, 0, 30, 30, selectArrows);\nvar selectArrowsBtnNext = new UiButton(170, 0, 30, 30, selectArrows);\n\nwith (selectArrowsBtnPrev.state) {\n    text = "<";\n    if (!selectArrows.state.wrap_selection) {\n        enabled = false;    \n    }\n    \n    on_click = method({ select: selectArrows, prevBtn: selectArrowsBtnPrev, nextBtn: selectArrowsBtnNext }, function() {\n        var select = self.select;\n        select.previous();\n        \n        if (!select.state.wrap_selection && !self.nextBtn.state.enabled) {\n            with (self.nextBtn) {\n                set({ enabled: true });\n            }\n        }\n        \n        if (!select.state.index && !select.state.wrap_selection) {\n            with (self.prevBtn) {\n                set({ enabled: false });\n            }\n        }\n    });\n}\n\nwith (selectArrowsBtnNext.state) {\n    text = ">";\n    on_click = method({ select: selectArrows, prevBtn: selectArrowsBtnPrev, nextBtn: selectArrowsBtnNext }, function() {\n        var select = self.select;\n        select.next();\n        \n        if (!select.state.wrap_selection && !self.prevBtn.state.enabled) {\n            with (self.prevBtn) {\n                set({ enabled: true });\n            }\n        }\n        \n        if (select.state.index == array_length(select.state.items)-1 && !select.state.wrap_selection) {\n            with (self.nextBtn) {\n                set({ enabled: false });\n            }\n        }\n    });\n}\n')),(0,a.kt)("h3",{id:"state-reference"},"State reference"),(0,a.kt)("table",null,(0,a.kt)("thead",{parentName:"table"},(0,a.kt)("tr",{parentName:"thead"},(0,a.kt)("th",{parentName:"tr",align:null},"Variable"),(0,a.kt)("th",{parentName:"tr",align:null},"Description"),(0,a.kt)("th",{parentName:"tr",align:null},"Type"),(0,a.kt)("th",{parentName:"tr",align:null},"Default"))),(0,a.kt)("tbody",{parentName:"table"},(0,a.kt)("tr",{parentName:"tbody"},(0,a.kt)("td",{parentName:"tr",align:null},"type"),(0,a.kt)("td",{parentName:"tr",align:null},"Button type"),(0,a.kt)("td",{parentName:"tr",align:null},"Real"),(0,a.kt)("td",{parentName:"tr",align:null},(0,a.kt)("inlineCode",{parentName:"td"},"ui_enum_variants.primary"))),(0,a.kt)("tr",{parentName:"tbody"},(0,a.kt)("td",{parentName:"tr",align:null},"index"),(0,a.kt)("td",{parentName:"tr",align:null},"Index of the currently selected item"),(0,a.kt)("td",{parentName:"tr",align:null},"Real"),(0,a.kt)("td",{parentName:"tr",align:null},(0,a.kt)("inlineCode",{parentName:"td"},"0"))),(0,a.kt)("tr",{parentName:"tbody"},(0,a.kt)("td",{parentName:"tr",align:null},"selected"),(0,a.kt)("td",{parentName:"tr",align:null},"Selected item"),(0,a.kt)("td",{parentName:"tr",align:null},"{ key: String, label: String }"),(0,a.kt)("td",{parentName:"tr",align:null})),(0,a.kt)("tr",{parentName:"tbody"},(0,a.kt)("td",{parentName:"tr",align:null},"wrap_selection"),(0,a.kt)("td",{parentName:"tr",align:null},"If to wrap the items when reaching the end of the selection"),(0,a.kt)("td",{parentName:"tr",align:null},"Bool"),(0,a.kt)("td",{parentName:"tr",align:null},(0,a.kt)("inlineCode",{parentName:"td"},"false"))),(0,a.kt)("tr",{parentName:"tbody"},(0,a.kt)("td",{parentName:"tr",align:null},"items"),(0,a.kt)("td",{parentName:"tr",align:null},"Array of items to display"),(0,a.kt)("td",{parentName:"tr",align:null},"Array<{ key: String, label: String }>"),(0,a.kt)("td",{parentName:"tr",align:null},(0,a.kt)("inlineCode",{parentName:"td"},"[]"))))),(0,a.kt)("h3",{id:"methods"},"Methods"),(0,a.kt)("h4",{id:"set_itemsitems"},"set_items(items)"),(0,a.kt)("p",null,"Set the items in the state, by also pre-selecting the first item in the list"),(0,a.kt)("table",null,(0,a.kt)("thead",{parentName:"table"},(0,a.kt)("tr",{parentName:"thead"},(0,a.kt)("th",{parentName:"tr",align:null},"Param"),(0,a.kt)("th",{parentName:"tr",align:null},"Description"),(0,a.kt)("th",{parentName:"tr",align:null},"Type"),(0,a.kt)("th",{parentName:"tr",align:null},"Default"))),(0,a.kt)("tbody",{parentName:"table"},(0,a.kt)("tr",{parentName:"tbody"},(0,a.kt)("td",{parentName:"tr",align:null},"items"),(0,a.kt)("td",{parentName:"tr",align:null},"Array of items to display"),(0,a.kt)("td",{parentName:"tr",align:null},"Array<{ key: String, label: String }>"),(0,a.kt)("td",{parentName:"tr",align:null},(0,a.kt)("inlineCode",{parentName:"td"},"[]"))))),(0,a.kt)("h3",{id:"next"},"next()"),(0,a.kt)("p",null,"Select the next item in the list. If the index has reached the end of the array, it will be wrapped with the initial one."),(0,a.kt)("h3",{id:"previous"},"previous()"),(0,a.kt)("p",null,"Select the previous item in the list. If the index has reached the start of the array, it will be wrapped with the final one."),(0,a.kt)("h3",{id:"events"},"Events"),(0,a.kt)("pre",null,(0,a.kt)("code",{parentName:"pre",className:"language-js"},"on_change(component, selected)\n")),(0,a.kt)("p",null,"Called when selecting an item. The first argument is the component itself and the second argument is the selected item"))}m.isMDXComponent=!0}}]);