---
sidebar_position: 3
---

# Children and parents

Every component has a parent and a list of children. By default all components have the root [layer](/docs/components/layer) as parent.

![Components tree](/img/components-tree.png "Components tree")

This structure helps to organize the hierarchy of your UI and create composable blocks. 

For example, you may want to create a component which is composed of various inner components, like a draggable and a scrollbar, or simply a child layer.

### Usage

The fifth argument of the components is always the parent

```js
var myLayer = new UihLayer(0, 0, 500, 500);

// Then use this new layer as parent of another component:
new UiButton(0, 0, 100, 40, myLayer);
```

Parents can also dinamically add new children components with the method `add_child(component)`, which will remove the child from the old parent's children list.
