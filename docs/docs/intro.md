---
sidebar_position: 1
sidebar_label: Introduction
hide_title: true
---

![Headless UI](/img/logo.png "Headless UI")

<!-- # HEADLESS UI -->

This project aims to create a library of UI components with a clear separation between logic (eg. management of clicks on a button) and design of the component itself, in order to integrate the UI with your own style in a game.

Each component has its own small surface, which is re-rendered only if the component undergoes a change in its state.

The state is a struct that you can modify to your liking, e.g. if the button has been pressed, you will want to draw an effect on the button to make it clear that it is in fact pressed at that moment `if (state.clicked) { draw_sprite(etc..`

---

### Example usage

```js
// Create event
var btn = new UiButton(10, 10, 190, 40);
with (btn.state) {
  text = "My Button";
  on_click = function(elem) {
    // do something
  });
}
```
