---
sidebar_position: 7
---

# Scrollbar

### Example

```js
var scrollbar = new UiScrollbar(0, 0, 20, 200);
with (scrollbar.state) {
	thumb_size = 30;
	on_change = function() {
		show_debug_message("Changed scrollbar position!");
	};
}
```

### State reference

| Variable   | Description                              | Type | Default                               |
|------------|------------------------------------------|------|---------------------------------------|
| type       | Scrollbar variant                        | Real | ui_enum_variants.primary              |
| status     | Current status of the scrollbar          | Real | uih_enum_scrollbar_status.idle        |
| direction  | Scrollbar direction                      | Real | uih_enum_scrollbar_direction.vertical |
| value      | Current normalized (0-1) scroll position | Real | 0                                     |
| thumb_size | Scroll speed                             | Real | 0                                     |

### Events

```js
on_change(component, scroll_value)
```

Called when the component is being scrolled. `scroll_value` indicates the current normalized (0-1) scroll position.

### Enums

| Enum                         | Values                    |
|------------------------------|---------------------------|
| uih_enum_scrollbar_status    | `idle`/`hover`/`dragging` |
| uih_enum_scrollbar_direction | `vertical`/`horizontal`   |


