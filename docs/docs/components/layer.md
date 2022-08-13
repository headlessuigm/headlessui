---
sidebar_position: 8
---

# Layer

A layer is a renderless component that handles the z-order of its children components. 

It is used to understand which component is on top of another, by simply checking which one is the latest in the list.

By default every component is a child of the root layer component, but you can also create other layers in order to have a better control of the depth ordering.

### Example

```js
var myLayer = new UihLayer(0, 0, 500, 500);

// Then use this new layer as parent of another component:
new UiButton(0, 0, 100, 40, myLayer);
```

### Methods

#### is_hovered(child_component)

Check if the specified component is the most higher (on top) element, that is also intersecting the mouse

| Param           | Description        | Type              | Default |
|-----------------|--------------------|-------------------|---------|
| child_component | Component to check | Function instance |         |

#### focus(child_component)

Set the specified component as focused (if not already). Will bring the component on top

| Param           | Description        | Type              | Default |
|-----------------|--------------------|-------------------|---------|
| child_component | Component to focus | Function instance |         |
