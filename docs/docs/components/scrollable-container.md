---
sidebar_position: 6
---

# Scrollable Container

This is a basic component to handle a container with a scrollable area and the related scrollbar.
Children components will be able to be scrolled trough the area.

### Example

```js
var scrollable_container = new UiScrollableContainer(0, 0, 200, 200);
with (scrollable_container.state) {
	scrollable_width = 400;
	scrollable_height = 800;
}
```

### State reference

| Variable          | Description                          | Type   | Default                        |
|-------------------|--------------------------------------|--------|--------------------------------|
| scrollable_width  | Scrollable area width                | String | Equals to the component width  |
| scrollable_height | Scrollable area height               | Real   | Equals to the component height |
| scroll_step       | Scroll speed with arrows/mouse wheel | Real   | 24                             |

### Events

```js
on_scroll(component, scrolled, scroll_value)
```

Called when the container is being scrolled. `scrolled` param indicates the scroll direction and `scroll_value` the scroll difference.

### Enums

| Enum                      | Values                  |
|---------------------------|-------------------------|
| uih_enum_scroll_direction | `vertical`/`horizontal` |
