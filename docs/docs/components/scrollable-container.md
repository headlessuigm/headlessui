---
sidebar_position: 8
---

# Scrollable Container

This is a basic component to handle a container with a scrollable area and the related [scrollbar](/docs/components/scrollbar).
Children components will be able to be scrolled trough the area.

### Example

```js
var scrollable_container = new UiScrollableContainer(0, 0, 200, 200);
with (scrollable_container.state) {
	scrollable_width = 400;
	scrollable_height = 800;
	on_change = function() {
		show_debug_message("Changed scroll position!");
	};
}
```

### State reference

| Variable          | Description                          | Type   | Default                        |
|-------------------|--------------------------------------|--------|--------------------------------|
| scrollable_width  | Scrollable area width                | Real   | Equals to the component width  |
| scrollable_height | Scrollable area height               | Real   | Equals to the component height |
| scroll_step       | Scroll speed                         | Real   | 24                             |

### Events

```js
on_change(component, scroll_direction, scroll_value)
```

Called when the container is being scrolled. `scroll_direction` param indicates the scroll direction and `scroll_value` the scrolling difference.

### Enums

| Enum                      | Values                  |
|---------------------------|-------------------------|
| uih_enum_scroll_direction | `vertical`/`horizontal` |
