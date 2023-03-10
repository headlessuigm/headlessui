---
sidebar_position: 6
---

# Slider

### Example

```js
var slider = new UiSlider(0, 0, 200, 30);
slider.set_thumb_radius(10);
with (slider.state) {
	step = 3;
}
```

### State reference

| Variable     | Description                                                                             | Type | Default                              |
|--------------|-----------------------------------------------------------------------------------------|------|--------------------------------------|
| type         | Slider variant                                                                          | Real | ui_enum_variants.primary             |
| status       | Current status of the slider                                                            | Real | ui_enum_slider_status.idle          |
| direction    | Slider direction                                                                        | Real | ui_enum_slider_direction.horizontal |
| min_value    | Minimum selectable value                                                                | Real | 0                                    |
| max_value    | Maximum selectable value                                                                | Real | 100                                  |
| step         | Granularity of the slider. The step increment should be a divisor of the track's length | Real | 1                                    |
| value        | Current selected value                                                                  | Real | 0                                    |
| thumb_radius |  Set the thumb's radius                                                                 | Real | 8                                    |

### Events

```js
on_change(component, value)
```

Called when the slider position changes. `value` indicates the current normalized (0-1) slider position.

### Enums

| Enum                         | Values                    |
|------------------------------|---------------------------|
| ui_enum_slider_status       | `idle`/`hover`/`dragging` |
| ui_enum_slider_direction    | `vertical`/`horizontal`   |
