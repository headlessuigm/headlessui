---
sidebar_position: 11
---

# Tooltip

### Example

```js
var btn = new Button(0, 0, 100, 30);
btn.state.text = "Hover here";

var tooltip = new UiTooltip();
with (tooltip.state) {
    linked_component = btn;
}
tooltip.set_text("My Tooltip");
tooltip.move();
```

### State reference

| Variable           | Description                                           | Type   | Default                         |
|--------------------|-------------------------------------------------------|--------|---------------------------------|
| linked_component   | Tooltip will be shown when hovering on the linked component | String |                           |
| text               | Tooltip displayed text                                | String |                                 |
| type               | Tooltip type                                          | Real   | `ui_enum_variants.secondary`    |
| text_sep           | Distance in px between each line                      | Real   | `-1` (default spacing)          |
| text_max_width     | Row max width before going on a newline               | Real   | `-1` (no newlines by default)   |
| padding_horizontal | Horizontal tooltip padding (in px)                    | Real   | `10`                            |
| padding_vertical   | Vertical tooltip padding (in px)                      | Real   | `5`                             |
| offset_horizontal  | Horizontal tooltip offset (in px)                     | Real   | `0`                             |
| offset_vertical    | Vertical tooltip offset (in px)                       | Real   | `10`                            |
| show               | If to show the tooltip. This is handled automatically | Bool   | `false`                         |
| show_delay         | Delay to show the tooltip (in milliseconds)           | Real   | `500`                           |
| stay_within_gui    | Avoid to place the tooltip out of the GUI             | Bool   | `true`                          |

### Methods


#### set_text(text, sep, max_width)

Set the text of the tooltip, auto-resizing the container, according to the padding

| Param     | Description                             | Type   | Default     |
|-----------|-----------------------------------------|--------|-------------|
| text      | Tooltip text                            | String |             |
| sep       | Distance between each line (in px)      | Real   | `-1`        |
| max_width | Max row width                           | Real   | `-1`        |


#### move()

Automatically set the tooltip coordinates based on the linked component position. 
Before calling this function, ensures that the text has been set, so that the component height has already been determinated.
