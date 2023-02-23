---
sidebar_position: 3
---

# Button

### Example

```js
var button = new UiButton(0, 0, 100, 30);
with (button.state) {
    text = "My Button";
    on_click = function() {
        show_message("Button clicked!");
    }
}
```

### State reference

| Variable           | Description                                         | Type   | Default                       |
|--------------------|-----------------------------------------------------|--------|-------------------------------|
| text               | Button displayed text                               | String |                               |
| status             | Current status of the button                        | Real   | `ui_enum_button_status.idle`  |
| type               | Button type                                         | Real   | `ui_enum_variants.primary`    |
| sprite             | Button sprite (with 3 frames for the idle/hover/click state) | Real |                        |                                       
| text_sep           | Distance in px between each line                    | Real   | `-1` (default spacing)        |
| text_max_width     | Row max width before going on a newline             | Real   | `-1` (no newlines by default) |
| padding_horizontal | Horizontal button padding (in px)                   | Real   | `40`                          |
| padding_vertical   | Vertical button padding (in px)                     | Real   | `20`                          |
| click_button       | Which button to check for the click                 | Real   | `mb_left`                     |
| click_type         | Which mouse event to check for the click            | Real   | `ui_enum_click_type.released` |

### Methods


#### set_text(text, sep, max_width)

Set the text of the button, auto-resizing the container, according to the button padding

| Param     | Description                             | Type   | Default     |
|-----------|-----------------------------------------|--------|-------------|
| text      | Button text                             | String |             |
| sep       | Distance between each character (in px) | Real   | `-1`        |
| max_width | Max row width                           | Real   | `-1`        |

### Events

```js
on_click(component)
```

Called when clicking on the button. The passed argument is the component itself

### Enums

| Enum                   | Values                   |
|------------------------|--------------------------|
| ui_enum_button_status | `idle`/`clicked`/`hover` |
