---
sidebar_position: 2
---

# Checkbox

### Example

```js
var button = new UiCheckbox(0, 0, 100, 20);
with (button.state) {
    text = "My Checkbox";
    checked = true
    on_click = function() {
        show_message("Checkbox clicked!");
    }
}
```

### State reference

| Variable | Description                    | Type   | Default                         |
|----------|--------------------------------|--------|---------------------------------|
| status   | Current status of the checkbox | Real   | `uih_enum_checkbox_status.idle` |
| type     | Checkbox type                  | Real   | `ui_enum_variants.primary`      |
| text     | Checkbox displayed text        | String | `undefined`                     |


### Enums

| Enum                     | Values                   |
|--------------------------|--------------------------|
| uih_enum_checkbox_status | `idle`/`clicked`/`hover` |
