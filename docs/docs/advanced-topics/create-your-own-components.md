---
sidebar_position: 1
---

# Create your own components

Since components are splitted into a logic function and a render function, you just need to create two functions with the name you like.

This is the basic logic code. This function extends the core Headless component

```js
function YourLogicComponent(_x, _y, _width, _height, _parent = undefined) : UihComponent(_x, _y, _width, _height, _parent) constructor {
    with (state) {
        // Your initial component's state here
    }

    step = function() {
        // Your component's step code here
    }
}
```

This is the basic render code:
```js
function YourRenderComponent(_x, _y, _width, _height, _parent = undefined) : YourLogicComponent(_x, _y, _width, _height, _parent) constructor {	
    draw = function() {
        // Your draw code here
    }
}
```

Finally you will be able to create an instance with: `new YourRenderComponent(x, y, width, height);`

---

### Info

Inside a function you have full access to the component's scope and you can also add variables and methods.

If you want to check if the mouse is hovering the component, just use the function `parent.is_hovered(self)` (assuming that the component's parent is a _Layer_).

Instead, to change a state value and re-render the component, use the function `set()` by passing a struct of the data to update, for example:

```js
step = function() {
    if (mouse_check_button_pressed(mb_left)) {	
        set({ status: "clicked" });
    }
}
```
