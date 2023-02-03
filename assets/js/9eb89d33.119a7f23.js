"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[148],{3905:(t,e,n)=>{n.d(e,{Zo:()=>u,kt:()=>k});var a=n(7294);function r(t,e,n){return e in t?Object.defineProperty(t,e,{value:n,enumerable:!0,configurable:!0,writable:!0}):t[e]=n,t}function l(t,e){var n=Object.keys(t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(t);e&&(a=a.filter((function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable}))),n.push.apply(n,a)}return n}function i(t){for(var e=1;e<arguments.length;e++){var n=null!=arguments[e]?arguments[e]:{};e%2?l(Object(n),!0).forEach((function(e){r(t,e,n[e])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(n)):l(Object(n)).forEach((function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(n,e))}))}return t}function o(t,e){if(null==t)return{};var n,a,r=function(t,e){if(null==t)return{};var n,a,r={},l=Object.keys(t);for(a=0;a<l.length;a++)n=l[a],e.indexOf(n)>=0||(r[n]=t[n]);return r}(t,e);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(t);for(a=0;a<l.length;a++)n=l[a],e.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(t,n)&&(r[n]=t[n])}return r}var p=a.createContext({}),d=function(t){var e=a.useContext(p),n=e;return t&&(n="function"==typeof t?t(e):i(i({},e),t)),n},u=function(t){var e=d(t.components);return a.createElement(p.Provider,{value:e},t.children)},m={inlineCode:"code",wrapper:function(t){var e=t.children;return a.createElement(a.Fragment,{},e)}},c=a.forwardRef((function(t,e){var n=t.components,r=t.mdxType,l=t.originalType,p=t.parentName,u=o(t,["components","mdxType","originalType","parentName"]),c=d(n),k=r,s=c["".concat(p,".").concat(k)]||c[k]||m[k]||l;return n?a.createElement(s,i(i({ref:e},u),{},{components:n})):a.createElement(s,i({ref:e},u))}));function k(t,e){var n=arguments,r=e&&e.mdxType;if("string"==typeof t||r){var l=n.length,i=new Array(l);i[0]=c;var o={};for(var p in e)hasOwnProperty.call(e,p)&&(o[p]=e[p]);o.originalType=t,o.mdxType="string"==typeof t?t:r,i[1]=o;for(var d=2;d<l;d++)i[d]=n[d];return a.createElement.apply(null,i)}return a.createElement.apply(null,n)}c.displayName="MDXCreateElement"},7743:(t,e,n)=>{n.r(e),n.d(e,{assets:()=>p,contentTitle:()=>i,default:()=>m,frontMatter:()=>l,metadata:()=>o,toc:()=>d});var a=n(7462),r=(n(7294),n(3905));const l={sidebar_position:3},i="Button",o={unversionedId:"components/button",id:"components/button",title:"Button",description:"Example",source:"@site/docs/components/button.md",sourceDirName:"components",slug:"/components/button",permalink:"/headlessui/docs/components/button",draft:!1,editUrl:"https://github.com/headlessuigm/headlessui/blob/main/docs/docs/components/button.md",tags:[],version:"current",sidebarPosition:3,frontMatter:{sidebar_position:3},sidebar:"tutorialSidebar",previous:{title:"Label",permalink:"/headlessui/docs/components/label"},next:{title:"Checkbox",permalink:"/headlessui/docs/components/checkbox"}},p={},d=[{value:"Example",id:"example",level:3},{value:"State reference",id:"state-reference",level:3},{value:"Methods",id:"methods",level:3},{value:"set_text(text, sep, max_width)",id:"set_texttext-sep-max_width",level:4},{value:"Events",id:"events",level:3},{value:"Enums",id:"enums",level:3}],u={toc:d};function m(t){let{components:e,...n}=t;return(0,r.kt)("wrapper",(0,a.Z)({},u,n,{components:e,mdxType:"MDXLayout"}),(0,r.kt)("h1",{id:"button"},"Button"),(0,r.kt)("h3",{id:"example"},"Example"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-js"},'var button = new UiButton(0, 0, 100, 30);\nwith (button.state) {\n    text = "My Button";\n    on_click = function() {\n        show_message("Button clicked!");\n    }\n}\n')),(0,r.kt)("h3",{id:"state-reference"},"State reference"),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Variable"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"),(0,r.kt)("th",{parentName:"tr",align:null},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Default"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"text"),(0,r.kt)("td",{parentName:"tr",align:null},"Button displayed text"),(0,r.kt)("td",{parentName:"tr",align:null},"String"),(0,r.kt)("td",{parentName:"tr",align:null})),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"status"),(0,r.kt)("td",{parentName:"tr",align:null},"Current status of the button"),(0,r.kt)("td",{parentName:"tr",align:null},"Real"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("inlineCode",{parentName:"td"},"ui_enum_button_status.idle"))),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"type"),(0,r.kt)("td",{parentName:"tr",align:null},"Button type"),(0,r.kt)("td",{parentName:"tr",align:null},"Real"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("inlineCode",{parentName:"td"},"ui_enum_variants.primary"))),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"text_sep"),(0,r.kt)("td",{parentName:"tr",align:null},"Distance in px between each line"),(0,r.kt)("td",{parentName:"tr",align:null},"Real"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("inlineCode",{parentName:"td"},"-1")," (default spacing)")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"text_max_width"),(0,r.kt)("td",{parentName:"tr",align:null},"Row max width before going on a newline"),(0,r.kt)("td",{parentName:"tr",align:null},"Real"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("inlineCode",{parentName:"td"},"-1")," (no newlines by default)")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"padding_horizontal"),(0,r.kt)("td",{parentName:"tr",align:null},"Horizontal button padding (in px)"),(0,r.kt)("td",{parentName:"tr",align:null},"Real"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("inlineCode",{parentName:"td"},"40"))),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"padding_vertical"),(0,r.kt)("td",{parentName:"tr",align:null},"Vertical button padding (in px)"),(0,r.kt)("td",{parentName:"tr",align:null},"Real"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("inlineCode",{parentName:"td"},"20"))),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"enabled"),(0,r.kt)("td",{parentName:"tr",align:null},"When disabled, the button is hidden and unclickable"),(0,r.kt)("td",{parentName:"tr",align:null},"Bool"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("inlineCode",{parentName:"td"},"true"))),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"click_button"),(0,r.kt)("td",{parentName:"tr",align:null},"Which button to check for the click"),(0,r.kt)("td",{parentName:"tr",align:null},"Real"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("inlineCode",{parentName:"td"},"mb_left"))),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"click_type"),(0,r.kt)("td",{parentName:"tr",align:null},"Which mouse event to check for the click"),(0,r.kt)("td",{parentName:"tr",align:null},"Real"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("inlineCode",{parentName:"td"},"ui_enum_click_type.released"))))),(0,r.kt)("h3",{id:"methods"},"Methods"),(0,r.kt)("h4",{id:"set_texttext-sep-max_width"},"set_text(text, sep, max_width)"),(0,r.kt)("p",null,"Set the text of the button, auto-resizing the container, according to the button padding"),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Param"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"),(0,r.kt)("th",{parentName:"tr",align:null},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Default"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"text"),(0,r.kt)("td",{parentName:"tr",align:null},"Button text"),(0,r.kt)("td",{parentName:"tr",align:null},"String"),(0,r.kt)("td",{parentName:"tr",align:null})),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"sep"),(0,r.kt)("td",{parentName:"tr",align:null},"Distance between each character (in px)"),(0,r.kt)("td",{parentName:"tr",align:null},"Real"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("inlineCode",{parentName:"td"},"-1"))),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"max_width"),(0,r.kt)("td",{parentName:"tr",align:null},"Max row width"),(0,r.kt)("td",{parentName:"tr",align:null},"Real"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("inlineCode",{parentName:"td"},"-1"))))),(0,r.kt)("h3",{id:"events"},"Events"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-js"},"on_click(component)\n")),(0,r.kt)("p",null,"Called when clicking on the button. The passed argument is the component itself"),(0,r.kt)("h3",{id:"enums"},"Enums"),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},"Enum"),(0,r.kt)("th",{parentName:"tr",align:null},"Values"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"ui_enum_button_status"),(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("inlineCode",{parentName:"td"},"idle"),"/",(0,r.kt)("inlineCode",{parentName:"td"},"clicked"),"/",(0,r.kt)("inlineCode",{parentName:"td"},"hover"))))))}m.isMDXComponent=!0}}]);