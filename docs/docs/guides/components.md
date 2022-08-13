---
sidebar_position: 1
---

# Components

Every piece of the UI is a component, with its own surface and its own data contained in a struct called `state`.

### What's headless?

Headless means that the components step and draw are isolated and are fully customizable from the developer.

Components are splitted in two lightweight functions: logic and render. For example, a button behavior like if the mouse is hovering it, is controlled in the logic function, while its drawing in the render function.

Example of a logic function:

```js
function UihButton() : UihComponent() constructor {
    step = function() {
        // Check something every step
    }
}
```

and its related render function:

```js
function UiButton() : UihButton() constructor {
    draw = function() {
        // Re-draw the button when its state changes
    }
}
```

The logic function extends the core UihComponent and the render extends the logic one, so to instantiate this button, you only need to get an instance of UiButton().


```js
var myButton = new UiButton();
```

### State

A component may need to store some data to control its behavior or draw, e.g. if the button is currently pressed. When the state changes, the component and its parents are also scheduled for the re-render.

The state can be easily manipulated in the function constructor by using the `with` statement.

```js
function UihButton() : UihComponent() constructor {
    with (state) {
      status = "clicked";
    }
}
```

but if you need to change the state in the step function, then you can the `set()` function, which is available to all components and it will correctly trigger the re-rendering.

```js
function UihButton() : UihComponent() constructor {
    step = function() {
        if (mouse_check_button_pressed(mb_left)) {	
            set({ status: "clicked" });
        }
    }
}
```

### Methods

Other than the state, you may also want to add some methods to a component.

For example, the notification component has an add_item() method to add new notifications:

```js
var notification_elem = new UiNotification(0, 0, 500, 500);
notification_elem.add_item("My notification");
```

Methods are defined directly inside the functions constructor:

```js
function UihNotification() : UihComponent() constructor {
    add_item = function(text) {
        // Code here
    }
}
```
