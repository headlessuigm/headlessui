---
sidebar_position: 2
---

# Label

### Example

```js
var label = new Label(0, 0, 100, 30);
with (label.state) {
    text = "My Label";
    halign = fa_center;
}
```

### State reference

| Variable           | Description                             | Type   | Default                       |
|--------------------|-----------------------------------------|--------|-------------------------------|
| text               | Label displayed text                    | String |                               |
| halign             | Label horizontal alignment              | Real   | `fa_left`                     |
| valign             | Label vertical alignment                | Real   | `fa_top`                      |
| color              | Label color                             | Real   | `ui_variable_col_on_bg`       |
| alpha              | Label alpha                             | Real   | `1`                           |
| font               | Label font                              | Real   | `ui_variable_font`            |
| maxlength          | Cut the text if the length is greater than the specified value | Real   |        |
| sep                | The distance in pixels between lines of text (draw_text_ext) | Real | `-1`       |
| maxwidth           | The maximum width in pixels of the string before a line break (draw_text_ext) | Real | `-1`       |
