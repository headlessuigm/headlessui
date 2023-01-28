---
sidebar_position: 10
---

# Select with Arrows

### Example

This example includes also the children buttons that are necessary for the behavior of this component. In the future, this piece will be wrapped in a single function

```js
var selectArrows = new UiSelectArrows(300, 360, 200, 30);
selectArrows.set_items([{ key: "item0", label: "Item 0" }, { key: "item1", label: "Item 1" }, { key: "item2", label: "Item 2"} ]);

var selectArrowsBtnPrev = new UiButton(0, 0, 30, 30, selectArrows);
var selectArrowsBtnNext = new UiButton(170, 0, 30, 30, selectArrows);

with (selectArrowsBtnPrev.state) {
	text = "<";
	if (!selectArrows.state.wrap_selection) {
		enabled = false;	
	}
	
	on_click = method({ select: selectArrows, prevBtn: selectArrowsBtnPrev, nextBtn: selectArrowsBtnNext }, function() {
		var select = self.select;
		select.previous();
		
		if (!select.state.wrap_selection && !self.nextBtn.state.enabled) {
			with (self.nextBtn) {
				set({ enabled: true });
			}
		}
		
		if (!select.state.index && !select.state.wrap_selection) {
			with (self.prevBtn) {
				set({ enabled: false });
			}
		}
	});
}

with (selectArrowsBtnNext.state) {
	text = ">";
	on_click = method({ select: selectArrows, prevBtn: selectArrowsBtnPrev, nextBtn: selectArrowsBtnNext }, function() {
		var select = self.select;
		select.next();
		
		if (!select.state.wrap_selection && !self.prevBtn.state.enabled) {
			with (self.prevBtn) {
				set({ enabled: true });
			}
		}
		
		if (select.state.index == array_length(select.state.items)-1 && !select.state.wrap_selection) {
			with (self.nextBtn) {
				set({ enabled: false });
			}
		}
	});
}
```

### State reference

| Variable           | Description                                | Type   | Default                       |
|--------------------|--------------------------------------------|--------|-------------------------------|
| type               | Button type                                | Real   | `ui_enum_variants.primary`    |
| index              | Index of the currently selected item       | Real   | `0`                           |
| selected           | Selected item                              | { key: String, label: String } |       |
| wrap_selection     | If to wrap the items when reaching the end of the selection | Bool   | `false`                       |
| items              | Array of items to display                  | Array<{ key: String, label: String }> | `[]` |

### Methods


#### set_items(items)

Set the items in the state, by also pre-selecting the first item in the list

| Param     | Description               | Type                                  | Default |
|-----------|---------------------------|---------------------------------------|---------|
| items     | Array of items to display | Array<{ key: String, label: String }> | `[]`    |

### next()

Select the next item in the list. If the index has reached the end of the array, it will be wrapped with the initial one.

### previous()

Select the previous item in the list. If the index has reached the start of the array, it will be wrapped with the final one.

### Events

```js
on_change(component, selected)
```

Called when selecting an item. The first argument is the component itself and the second argument is the selected item
