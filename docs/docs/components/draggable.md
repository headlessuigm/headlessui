---
sidebar_position: 8
---

# Draggable

A draggable is a renderless component that can be dragged around, moving its children components with it.

### Example

```js
var draggable = new UihDraggable(0, 0, 100, 100);

var dragged_button = new UiButton(0, 0, 100, 100, draggable);
with (dragged_button.state) {
	text = "Drag me!";
}
```

### State reference

| Variable | Description                                                                                                                                                                                      | Type   | Default                        |
|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|--------------------------------|
| status   | Current status of the draggable                                                                                                                                                                  | Real   | uih_enum_draggable_status.idle |
| axis     | Axis the draggable can move along                                                                                                                                                                | Real   | uih_enum_draggable_axis.both   |
| bounds   | By default, the component will be draggable within the parent, otherwise you can specify a Struct containing the "left", "right", "up" and "down" variables, that indicates the drag area limits | Struct |                                |                         |                          |

### Enums

| Enum                         | Values                    |
|------------------------------|---------------------------|
| uih_enum_draggable_status    | `idle`/`hover`/`dragging` |
| uih_enum_draggable_axis      | `both`/`x`/`y`            |
