draw_debug = false;

/** Notifications */
var notification_elem = new UiNotification({ 
	x: display_get_gui_width() - 340, 
	y: 10, 
	width: 330, 
	height: 300
});

/** Buttons */
var primary_button = new UiButton({ 
	x: 10, 
	y: 10, 
	width: 190, 
	height: 40, 
	text: "Primary Button", 
	on_click: method({ notification_elem: notification_elem }, function(elem) {
		notification_elem.add_item("Primary button has been pressed", ui_enum_variants.primary);
		draw_set_font(ui_font);
		elem.set_text("Dynamically changed text");
	})
});

var secondary_button = new UiButton({
	x: 10, 
	y: 65,
	width: 190,
	height: 40, 
	text: "Click to delete this button",
	type: ui_enum_variants.secondary, 
	on_click: method({ notification_elem: notification_elem }, function(elem) {
		notification_elem.add_item("Secondary button has been pressed", ui_enum_variants.secondary);
		elem.remove();
	})
});

/** Checkboxes */
var primary_checkbox = new UiCheckbox({
	x: 10, 
	y: 120, 
	width: 220, 
	height: 25, 
	text: "Enable UI Render Debug",
	checked: false,
	on_click: method({ ctrl: id, notification_elem: notification_elem }, function(elem) {
		notification_elem.add_item("Primary checkbox has been pressed", ui_enum_variants.primary);
		ctrl.draw_debug = !ctrl.draw_debug;
		elem.state.text = ctrl.draw_debug ? "Disable UI Render Debug" : "Enable UI Render Debug";
	})
});

var secondary_checkbox = new UiCheckbox({ 
	x: 10, 
	y: 160, 
	width: 180, 
	height: 25, 
	type: ui_enum_variants.secondary,
	text: "Checkbox Secondary",
	checked: true,
	on_click: method({ notification_elem: notification_elem }, function(elem) {
		notification_elem.add_item("Secondary checkbox has been pressed", ui_enum_variants.secondary);
	})
});

/** Scrollbars */
var scrollable_container = new UiScrollableContainer({
	x: 10, 
	y: 200, 
	width: 200, 
	height: 200,
	scrollable_width: 400,
	scrollable_height: 800,
});

for (var i = 0; i < 15; i++) {
	var button = new UiButton({
		x: 5,
		y: i * 50,
		width: 190,
		height: 40,
		text: "Button " + string(i),
	}, scrollable_container);
}

var scrollbar_vertical = new UiScrollbar({
	x: 210,
	y: 200,
	width: 20, 
	height: 200, 
	type: ui_enum_variants.primary,
	direction: uih_enum_scrollbar_direction.vertical,
	thumb_size: scrollable_container.state.height / scrollable_container.state.scrollable_height * 200,
	on_change: method({ scrollable_container: scrollable_container }, function(value) {
		scrollable_container.set({ scroll_y: (scrollable_container.state.scrollable_height - scrollable_container.state.height) * value });
	}),
});

var scrollbar_horizontal = new UiScrollbar({
	x: 10,
	y: 400,
	width: 200,
	height: 20,
	type: ui_enum_variants.primary,
	direction: uih_enum_scrollbar_direction.horizontal,
	thumb_size: scrollable_container.state.width / scrollable_container.state.scrollable_width * 200,
	on_change: method({ scrollable_container: scrollable_container }, function(value) {
		scrollable_container.set({ scroll_x: (scrollable_container.state.scrollable_width - scrollable_container.state.width) * value });
	}),
});

scrollable_container.set({
	on_scroll: method({ scrollbar_vertical: scrollbar_vertical, scrollbar_horizontal: scrollbar_horizontal }, function(scroll_direction, scroll_value) {
		if (scroll_direction == uih_enum_scroll_direction.vertical) {
			scrollbar_vertical.set({ value: scroll_value });
		} else {
			scrollbar_horizontal.set({ value: scroll_value });
		}
	}),
});

var layer_with_draggable = new UihLayer({x: 300, y: 10, width: 200, height: 200});

var draggable_button_both = new UihDraggable({ x: 10, y: 25, width: 75, height: 25 });
draggable_button_both.add_child(new UiButton({
	width: 75,
	height: 25,
	text: "Drag me!",
}));

var draggable_button_x = new UihDraggable({ x: 10, y: 100, width: 75, height: 25, axis: uih_enum_draggable_axis.x });
draggable_button_x.add_child(new UiButton({
	width: 75,
	height: 25,
	text: "X Axis",
}));


var draggable_button_y = new UihDraggable({ x: 10, y: 175, width: 75, height: 25, axis: uih_enum_draggable_axis.y });
draggable_button_y.add_child(new UiButton({
	width: 75,
	height: 25,
	text: "Y Axis",
}));


layer_with_draggable.add_child(draggable_button_both);
layer_with_draggable.add_child(draggable_button_x);
layer_with_draggable.add_child(draggable_button_y);
