---
sidebar_position: 2
---

# Batched rendering

In order to optimize the components rendering, they are drawn onto their own surfaces only when their state changes, e.g. if a button is pressed. The surfaces are then drawn on the parent surfaces, all way up to the Application Surface.

But the redraw phase does not happen right away when you change something (eg. by calling the `set()` or `update()` functions), instead the components are marked as _updated_ and will be redrawn in the Draw GUI event once.

With this little difference, you can make as many updates as you want to your components, without affecting the draw performance.

Also, to simplify and optimize further, the `set()` function will only mark the component as updated if the variable's value is different from the current value.
