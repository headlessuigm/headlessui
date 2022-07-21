# HEADLESS UI

This project aims to create a library of UI components with a clear separation between logic (eg. management of clicks on a button) and design of the component itself, in order to integrate the UI with your own style in a game.

Each component has its own small surface, which is re-rendered only if the component undergoes a change in its state.

The state is a struct that you can modify to your liking, e.g. if the button has been pressed, you will want to draw an effect on the button to make it clear that it is in fact pressed at that moment `if (state.clicked) { draw_sprite(etc..`

---

### EXAMPLE USAGE

```gml
// Create event

/** Button */
new UiButton("PrimaryButton", { 
  x: 10, 
  y: 10, 
  width: 190, 
  height: 40, 
  text: "Primary Button", 
  onClick: function(elem) {
    // do something
  })
});
```

```gml
// Draw GUI event

/** Re-render the elements if updated, and draw their surfaces */
ui_draw();
```
---

### CONTRIBUTING

Contributions are always appreciated! In order to do so, please fork the repository and push your changes there. 

Then create a Pull Request from your branch to the `main` branch.

---

### LICENSE 

MIT
