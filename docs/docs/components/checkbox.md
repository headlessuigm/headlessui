---
sidebar_position: 4
---

# Checkbox

### Example

```js
var checkbox = new UiCheckbox(0, 0, 100, 20);
with (checkbox.state) {
    text = "My Checkbox";
    checked = true
    on_click = function() {
        show_message("Checkbox clicked!");
    }
}
```

### State reference

| Variable      | Description                               | Type   | Default                         |
|---------------|-------------------------------------------|--------|---------------------------------|
| text          | Checkbox displayed text                   | String |                                 |
| status        | Current status of the checkbox            | Real   | `ui_enum_checkbox_status.idle`  |
| type          | Checkbox type                             | Real   | `ui_enum_variants.primary`      |
| sprite        | Checkbox sprite (with 4 frames for the idle/hover/click/checked state) | Real |      |    
| checked       | If the input is currently checked         | Bool   | `false`                         |

```js
on_click(component)
```

Called when clicking on the checkbox. The passed argument is the component itself

### Enums

| Enum                     | Values                   |
|--------------------------|--------------------------|
| ui_enum_checkbox_status | `idle`/`clicked`/`hover` |
