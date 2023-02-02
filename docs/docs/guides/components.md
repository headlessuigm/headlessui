---
sidebar_position: 2
---

# Components

Every piece of the UI is a component, with its own surface and its own data contained in a struct called `state`.

### State

A component may need to store some data to control its behaviour or draw, e.g. if the button is currently pressed. When the state changes, the component and its parents are also scheduled for the re-render.

The state can be easily manipulated in the function constructor by using the `with` statement.

```js
function Button() : UiBaseComponent() constructor {
    with (state) {
      status = "clicked";
    }
}
```

but if you need to change the state in the step function, then you can use the `set()` function, which is available to all components and it will correctly trigger the re-rendering.

```js
function Button() : UiBaseComponent() constructor {
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
function Notification() : UiBaseComponent() constructor {
    add_item = function(text) {
        // Code here
    }
}
```

### Events

Some components may trigger events as a result of a user action. 

Events can be defined in the state and consequently called from the component step:

```js
var button = new UiButton(0, 0, 100, 30);
with (button.state) {
    on_click = function() {
        show_message("Button clicked!");
    }
}
```
