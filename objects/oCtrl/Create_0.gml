draw_debug = false;

/** Notifications */
var notification_elem = new UiNotification(display_get_gui_width() - 340, 10, 330, 300);

/** Buttons */
var primary_button = new UiButton(10, 10, 190, 40);
with (primary_button.state) {
	text = "Primary Button";
	on_click = method({ notification_elem: notification_elem }, function(elem) {
		notification_elem.add_item("Primary button has been pressed", ui_enum_variants.primary);
		draw_set_font(ui_font);
		elem.set_text("Dynamically changed text");
	});
}

var secondary_button = new UiButton(10, 65, 190, 40);
with (secondary_button.state) {
	text = "Click to delete this button";
	on_click = method({ notification_elem: notification_elem }, function(elem) {
		notification_elem.add_item("Secondary button has been pressed", ui_enum_variants.secondary);
		elem.remove();
	});
}

/** Checkboxes */
var primary_checkbox = new UiCheckbox(10, 120, 220, 25);
with (primary_checkbox.state) {
	text = "Enable UI Render Debug";
	checked = false;
	on_click = method({ ctrl: other.id, notification_elem: notification_elem }, function(elem) {
		notification_elem.add_item("Primary checkbox has been pressed", ui_enum_variants.primary);
		ctrl.draw_debug = !ctrl.draw_debug;
		elem.state.text = ctrl.draw_debug ? "Disable UI Render Debug" : "Enable UI Render Debug";
	});
}

var secondary_checkbox = new UiCheckbox(10, 160, 180, 25); 
with (secondary_checkbox.state) {
	type = ui_enum_variants.secondary;
	text =  "Checkbox Secondary";
	checked = true;
	on_click = method({ notification_elem: notification_elem }, function(elem) {
		notification_elem.add_item("Secondary checkbox has been pressed", ui_enum_variants.secondary);
	});
}

/** Scrollbars */
var scrollable_container = new UiScrollableContainer(10, 200, 200, 200);
with (scrollable_container.state) {
	scrollable_width = 350;
	scrollable_height = 800;
}

for (var i = 0; i < 15; i++) {
	var button = new UiButton(5, i * 50, 190, 40, scrollable_container);
	with (button.state) {
		text = "Button " + string(i);
	}
}

var scrollbar_vertical = new UiScrollbar(210, 200, 20, 200);
with (scrollbar_vertical.state) {
	type = ui_enum_variants.primary;
	direction = uih_enum_scrollbar_direction.vertical;
	thumb_size = scrollable_container.state.height / scrollable_container.state.scrollable_height * 200;
	on_change = method({ scrollable_container: scrollable_container }, function(component, value) {
		scrollable_container.set({ scroll_y: (scrollable_container.state.scrollable_height - scrollable_container.state.height) * value });
	});
}

var scrollbar_horizontal = new UiScrollbar(10, 400, 200, 20);
with (scrollbar_horizontal.state) {
	type = ui_enum_variants.primary;
	direction = uih_enum_scrollbar_direction.horizontal;
	thumb_size = scrollable_container.state.width / scrollable_container.state.scrollable_width * 200;
	on_change = method({ scrollable_container: scrollable_container }, function(component, value) {
		scrollable_container.set({ scroll_x: (scrollable_container.state.scrollable_width - scrollable_container.state.width) * value });
	});
}

scrollable_container.set({
	on_change: method({ scrollbar_vertical: scrollbar_vertical, scrollbar_horizontal: scrollbar_horizontal }, function(el, scroll_direction, scroll_value) {
		if (scroll_direction == uih_enum_scroll_direction.vertical) {
			scrollbar_vertical.set({ value: scroll_value });
		} else {
			scrollbar_horizontal.set({ value: scroll_value });
		}
	}),
});

var layer_with_draggable = new UihLayer(300, 10, 200, 200);

var draggable_both = new UihDraggable(10, 25, 75, 25);
draggable_both.set_parent(layer_with_draggable);

var draggable_button_both = new UiButton(0, 0, 75, 25, draggable_both);
with (draggable_button_both.state) {
	text = "Drag me!";
}

var draggable_x = new UihDraggable(10, 100, 75, 25, layer_with_draggable);
with (draggable_x.state) {
	axis = uih_enum_draggable_axis.x
}

var draggable_button_x = new UiButton(0, 0, 75, 25, draggable_x);
with (draggable_button_x.state) {
	axis = uih_enum_draggable_axis.x;
	text = "X Axis";
}

var draggable_y = new UihDraggable(10, 175, 75, 25, layer_with_draggable);
with (draggable_y.state) {
	axis = uih_enum_draggable_axis.y;
}

var draggable_button_y = new UiButton(0, 0, 75, 25, draggable_y);
with (draggable_button_y.state) {
	text = "Y Axis";
}

var slider0 = new UiSlider(300, 230, 200, 30);
slider0.set_thumb_radius(10);

var slider1 = new UiSlider(300, 260, 200, 30);
with (slider1.state) {
	step = 5;
}

var slider2 = new UiSlider(300, 290, 200, 30);
slider2.set_thumb_radius(5);
with (slider2.state) {
	step = 25;
}

// Label
var label = new UiLabel(300, 330, 130, 30);
with (label.state) {
	text = "My Custom Label";
}