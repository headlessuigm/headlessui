---
sidebar_position: 1
sidebar_label: "What's headless"
---

# What's headless?

Headless means that the components step and draw are isolated and are fully customizable by the developer.

Components are splitted in two lightweight functions: logic and render. For example, a button behaviour like if the mouse is hovering it, is controlled in the logic function, while its drawing in the render function.

Example of a logic function:

```js
function Button() : UiBaseComponent() constructor {
    step = function() {
        // Check something every step
    }
}
```

and its related render function:

```js
function UiButton() : Button() constructor {
    draw = function() {
        // Re-draw the button when its state changes
    }
}
```

The logic function extends the core UiBaseComponent and the render extends the logic one, so to instantiate this button, you only need to get an instance of UiButton().


```js
var myButton = new UiButton();
```
