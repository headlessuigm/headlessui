"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[765],{3905:(t,e,a)=>{a.d(e,{Zo:()=>m,kt:()=>k});var n=a(7294);function l(t,e,a){return e in t?Object.defineProperty(t,e,{value:a,enumerable:!0,configurable:!0,writable:!0}):t[e]=a,t}function r(t,e){var a=Object.keys(t);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(t);e&&(n=n.filter((function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable}))),a.push.apply(a,n)}return a}function i(t){for(var e=1;e<arguments.length;e++){var a=null!=arguments[e]?arguments[e]:{};e%2?r(Object(a),!0).forEach((function(e){l(t,e,a[e])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(a)):r(Object(a)).forEach((function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(a,e))}))}return t}function o(t,e){if(null==t)return{};var a,n,l=function(t,e){if(null==t)return{};var a,n,l={},r=Object.keys(t);for(n=0;n<r.length;n++)a=r[n],e.indexOf(a)>=0||(l[a]=t[a]);return l}(t,e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(t);for(n=0;n<r.length;n++)a=r[n],e.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(t,a)&&(l[a]=t[a])}return l}var p=n.createContext({}),d=function(t){var e=n.useContext(p),a=e;return t&&(a="function"==typeof t?t(e):i(i({},e),t)),a},m=function(t){var e=d(t.components);return n.createElement(p.Provider,{value:e},t.children)},u={inlineCode:"code",wrapper:function(t){var e=t.children;return n.createElement(n.Fragment,{},e)}},s=n.forwardRef((function(t,e){var a=t.components,l=t.mdxType,r=t.originalType,p=t.parentName,m=o(t,["components","mdxType","originalType","parentName"]),s=d(a),k=l,c=s["".concat(p,".").concat(k)]||s[k]||u[k]||r;return a?n.createElement(c,i(i({ref:e},m),{},{components:a})):n.createElement(c,i({ref:e},m))}));function k(t,e){var a=arguments,l=e&&e.mdxType;if("string"==typeof t||l){var r=a.length,i=new Array(r);i[0]=s;var o={};for(var p in e)hasOwnProperty.call(e,p)&&(o[p]=e[p]);o.originalType=t,o.mdxType="string"==typeof t?t:l,i[1]=o;for(var d=2;d<r;d++)i[d]=a[d];return n.createElement.apply(null,i)}return n.createElement.apply(null,a)}s.displayName="MDXCreateElement"},7153:(t,e,a)=>{a.r(e),a.d(e,{assets:()=>p,contentTitle:()=>i,default:()=>u,frontMatter:()=>r,metadata:()=>o,toc:()=>d});var n=a(7462),l=(a(7294),a(3905));const r={sidebar_position:1,sidebar_label:"Base"},i="Base component (UihComponent)",o={unversionedId:"components/base",id:"components/base",title:"Base component (UihComponent)",description:"This is the base internal component that all other components extend. It defines variables and methods that are widely used.",source:"@site/docs/components/base.md",sourceDirName:"components",slug:"/components/base",permalink:"/headlessui/docs/components/base",draft:!1,editUrl:"https://github.com/headlessuigm/headlessui/blob/main/docs/docs/components/base.md",tags:[],version:"current",sidebarPosition:1,frontMatter:{sidebar_position:1,sidebar_label:"Base"},sidebar:"tutorialSidebar",previous:{title:"Children and parents",permalink:"/headlessui/docs/guides/children-and-parents"},next:{title:"Button",permalink:"/headlessui/docs/components/button"}},p={},d=[{value:"Variables",id:"variables",level:3},{value:"State reference",id:"state-reference",level:3},{value:"Methods",id:"methods",level:3},{value:"set(partial_state)",id:"setpartial_state",level:4},{value:"update()",id:"update",level:4},{value:"click()",id:"click",level:4},{value:"remove()",id:"remove",level:4},{value:"x_abs()",id:"x_abs",level:4},{value:"y_abs()",id:"y_abs",level:4},{value:"resize(width, height)",id:"resizewidth-height",level:4},{value:"add_child(component)",id:"add_childcomponent",level:4},{value:"Globals",id:"globals",level:3}],m={toc:d};function u(t){let{components:e,...a}=t;return(0,l.kt)("wrapper",(0,n.Z)({},m,a,{components:e,mdxType:"MDXLayout"}),(0,l.kt)("h1",{id:"base-component-uihcomponent"},"Base component (UihComponent)"),(0,l.kt)("p",null,"This is the base internal component that all other components extend. It defines variables and methods that are widely used. "),(0,l.kt)("p",null,"It is not meant for direct usage but this page acts as reference."),(0,l.kt)("h3",{id:"variables"},"Variables"),(0,l.kt)("table",null,(0,l.kt)("thead",{parentName:"table"},(0,l.kt)("tr",{parentName:"thead"},(0,l.kt)("th",{parentName:"tr",align:null},"Variable"),(0,l.kt)("th",{parentName:"tr",align:null},"Description"),(0,l.kt)("th",{parentName:"tr",align:null},"Type"),(0,l.kt)("th",{parentName:"tr",align:null},"Default"))),(0,l.kt)("tbody",{parentName:"table"},(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"parent"),(0,l.kt)("td",{parentName:"tr",align:null},"Parent component"),(0,l.kt)("td",{parentName:"tr",align:null},"Real"),(0,l.kt)("td",{parentName:"tr",align:null},(0,l.kt)("inlineCode",{parentName:"td"},"global.uih_root_component"))),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"step"),(0,l.kt)("td",{parentName:"tr",align:null},"Function called each tick to handle the component logic"),(0,l.kt)("td",{parentName:"tr",align:null},"Function"),(0,l.kt)("td",{parentName:"tr",align:null})),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"draw"),(0,l.kt)("td",{parentName:"tr",align:null},"Function called each tick to render the component"),(0,l.kt)("td",{parentName:"tr",align:null},"Function"),(0,l.kt)("td",{parentName:"tr",align:null})),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"skip_layer_checks"),(0,l.kt)("td",{parentName:"tr",align:null},"When this component should skip the parent layer hovering checks"),(0,l.kt)("td",{parentName:"tr",align:null},"Bool"),(0,l.kt)("td",{parentName:"tr",align:null},(0,l.kt)("inlineCode",{parentName:"td"},"false"))),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"disable_surface"),(0,l.kt)("td",{parentName:"tr",align:null},"If to disable the component surface"),(0,l.kt)("td",{parentName:"tr",align:null},"Bool"),(0,l.kt)("td",{parentName:"tr",align:null},(0,l.kt)("inlineCode",{parentName:"td"},"false"))),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"children"),(0,l.kt)("td",{parentName:"tr",align:null},"List of the children components"),(0,l.kt)("td",{parentName:"tr",align:null},"Array<Struct",">"),(0,l.kt)("td",{parentName:"tr",align:null},(0,l.kt)("inlineCode",{parentName:"td"},"[]"))),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"state"),(0,l.kt)("td",{parentName:"tr",align:null},"Component state"),(0,l.kt)("td",{parentName:"tr",align:null},"Struct"),(0,l.kt)("td",{parentName:"tr",align:null},(0,l.kt)("a",{parentName:"td",href:"#state-reference"},"See below"))))),(0,l.kt)("h3",{id:"state-reference"},"State reference"),(0,l.kt)("table",null,(0,l.kt)("thead",{parentName:"table"},(0,l.kt)("tr",{parentName:"thead"},(0,l.kt)("th",{parentName:"tr",align:null},"Variable"),(0,l.kt)("th",{parentName:"tr",align:null},"Description"),(0,l.kt)("th",{parentName:"tr",align:null},"Type"),(0,l.kt)("th",{parentName:"tr",align:null},"Default"))),(0,l.kt)("tbody",{parentName:"table"},(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"x"),(0,l.kt)("td",{parentName:"tr",align:null},"Component X"),(0,l.kt)("td",{parentName:"tr",align:null},"Real"),(0,l.kt)("td",{parentName:"tr",align:null})),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"y"),(0,l.kt)("td",{parentName:"tr",align:null},"Component Y"),(0,l.kt)("td",{parentName:"tr",align:null},"Real"),(0,l.kt)("td",{parentName:"tr",align:null})),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"width"),(0,l.kt)("td",{parentName:"tr",align:null},"Component width"),(0,l.kt)("td",{parentName:"tr",align:null},"Real"),(0,l.kt)("td",{parentName:"tr",align:null})),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"height"),(0,l.kt)("td",{parentName:"tr",align:null},"Component height"),(0,l.kt)("td",{parentName:"tr",align:null},"Real"),(0,l.kt)("td",{parentName:"tr",align:null})),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"scroll_x"),(0,l.kt)("td",{parentName:"tr",align:null},"Current X scroll position"),(0,l.kt)("td",{parentName:"tr",align:null},"Real"),(0,l.kt)("td",{parentName:"tr",align:null},"0")),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"scroll_y"),(0,l.kt)("td",{parentName:"tr",align:null},"Current Y scroll position"),(0,l.kt)("td",{parentName:"tr",align:null},"Real"),(0,l.kt)("td",{parentName:"tr",align:null},"0")),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"on_click"),(0,l.kt)("td",{parentName:"tr",align:null},"Component state"),(0,l.kt)("td",{parentName:"tr",align:null},"Function"),(0,l.kt)("td",{parentName:"tr",align:null},(0,l.kt)("inlineCode",{parentName:"td"},"function() {}"))))),(0,l.kt)("h3",{id:"methods"},"Methods"),(0,l.kt)("h4",{id:"setpartial_state"},"set(partial_state)"),(0,l.kt)("p",null,"Updates the state and sets the component and its ancestors as updated"),(0,l.kt)("table",null,(0,l.kt)("thead",{parentName:"table"},(0,l.kt)("tr",{parentName:"thead"},(0,l.kt)("th",{parentName:"tr",align:null},"Param"),(0,l.kt)("th",{parentName:"tr",align:null},"Description"),(0,l.kt)("th",{parentName:"tr",align:null},"Type"),(0,l.kt)("th",{parentName:"tr",align:null},"Default"))),(0,l.kt)("tbody",{parentName:"table"},(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"partial_state"),(0,l.kt)("td",{parentName:"tr",align:null},"State variables to update"),(0,l.kt)("td",{parentName:"tr",align:null},"Struct"),(0,l.kt)("td",{parentName:"tr",align:null})))),(0,l.kt)("h4",{id:"update"},"update()"),(0,l.kt)("p",null,"Directly sets the component and its ancestors as updated. Useful when manually updating the state"),(0,l.kt)("h4",{id:"click"},"click()"),(0,l.kt)("p",null,"Executes the ",(0,l.kt)("em",{parentName:"p"},"on_click")," handler defined for this component. Syntax sugar for ",(0,l.kt)("inlineCode",{parentName:"p"},"state.on_click(self);")),(0,l.kt)("h4",{id:"remove"},"remove()"),(0,l.kt)("p",null,"Removes this component from the parent's children list and destroys the component surface"),(0,l.kt)("h4",{id:"x_abs"},"x_abs()"),(0,l.kt)("p",null,"Returns the X absolute coordinate of the component, according to the X scroll position"),(0,l.kt)("h4",{id:"y_abs"},"y_abs()"),(0,l.kt)("p",null,"Returns the X absolute coordinate of the component, according to the Y scroll position"),(0,l.kt)("h4",{id:"resizewidth-height"},"resize(width, height)"),(0,l.kt)("p",null,"Resizes the component surface"),(0,l.kt)("table",null,(0,l.kt)("thead",{parentName:"table"},(0,l.kt)("tr",{parentName:"thead"},(0,l.kt)("th",{parentName:"tr",align:null},"Param"),(0,l.kt)("th",{parentName:"tr",align:null},"Description"),(0,l.kt)("th",{parentName:"tr",align:null},"Type"),(0,l.kt)("th",{parentName:"tr",align:null},"Default"))),(0,l.kt)("tbody",{parentName:"table"},(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"width"),(0,l.kt)("td",{parentName:"tr",align:null},"New width"),(0,l.kt)("td",{parentName:"tr",align:null},"Real"),(0,l.kt)("td",{parentName:"tr",align:null})),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"height"),(0,l.kt)("td",{parentName:"tr",align:null},"New height"),(0,l.kt)("td",{parentName:"tr",align:null},"Real"),(0,l.kt)("td",{parentName:"tr",align:null})))),(0,l.kt)("h4",{id:"add_childcomponent"},"add_child(component)"),(0,l.kt)("p",null,"Manually adds a component to the children list"),(0,l.kt)("table",null,(0,l.kt)("thead",{parentName:"table"},(0,l.kt)("tr",{parentName:"thead"},(0,l.kt)("th",{parentName:"tr",align:null},"Param"),(0,l.kt)("th",{parentName:"tr",align:null},"Description"),(0,l.kt)("th",{parentName:"tr",align:null},"Type"),(0,l.kt)("th",{parentName:"tr",align:null},"Default"))),(0,l.kt)("tbody",{parentName:"table"},(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"component"),(0,l.kt)("td",{parentName:"tr",align:null},"Child component to add"),(0,l.kt)("td",{parentName:"tr",align:null},"Struct"),(0,l.kt)("td",{parentName:"tr",align:null})))),(0,l.kt)("hr",null),(0,l.kt)("h3",{id:"globals"},"Globals"),(0,l.kt)("p",null,"Global variables defined in the script"),(0,l.kt)("table",null,(0,l.kt)("thead",{parentName:"table"},(0,l.kt)("tr",{parentName:"thead"},(0,l.kt)("th",{parentName:"tr",align:null},"Variable"),(0,l.kt)("th",{parentName:"tr",align:null},"Description"),(0,l.kt)("th",{parentName:"tr",align:null},"Type"),(0,l.kt)("th",{parentName:"tr",align:null},"Default"))),(0,l.kt)("tbody",{parentName:"table"},(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"ui_mouse_x"),(0,l.kt)("td",{parentName:"tr",align:null},"GUI Mouse X. Updated from ui_step()"),(0,l.kt)("td",{parentName:"tr",align:null},"Real"),(0,l.kt)("td",{parentName:"tr",align:null},"device_mouse_x_to_gui(0)")),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"ui_mouse_y"),(0,l.kt)("td",{parentName:"tr",align:null},"GUI Mouse Y. Updated from ui_step()"),(0,l.kt)("td",{parentName:"tr",align:null},"Real"),(0,l.kt)("td",{parentName:"tr",align:null},"device_mouse_y_to_gui(0)")))))}u.isMDXComponent=!0}}]);