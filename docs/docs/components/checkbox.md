---
sidebar_position: 3
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
| status        | Current status of the checkbox            | Real   | `uih_enum_checkbox_status.idle` |
| type          | Checkbox type                             | Real   | `ui_enum_variants.primary`      |
| checked       | If the input is currently checked         | Bool   | `false`                         |
| click_button  | Which button to check for the click       | Real   | `mb_left`                       |
| click_type    | Which mouse event to check for the click  | Real   | `ui_enum_click_type.released`   |

```js
on_click(component)
```

Called when clicking on the checkbox. The passed argument is the component itself

### Enums

| Enum                     | Values                   |
|--------------------------|--------------------------|
| uih_enum_checkbox_status | `idle`/`clicked`/`hover` |
