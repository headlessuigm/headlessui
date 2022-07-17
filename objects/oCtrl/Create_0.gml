/** Notifications */
var notificationElem = ui_notification({ 
	x: display_get_gui_width() - 340, 
	y: 10, 
	width: 330, 
	height: 300
});

/** Buttons */
ui_button({ 
	x: 10, 
	y: 10, 
	width: 190, 
	height: 40, 
	text: "Primary Button", 
	on_click: method({ notificationElem: notificationElem }, function(elem) {
		notificationElem.add_item("Primary button has been pressed", ui_enum_variants.primary);
		draw_set_font(ui_font);
		elem.setText("Dynamically changed text");
	})
});

ui_button({
	x: 10, 
	y: 65,
	width: 190,
	height: 40, 
	text: "Click to delete this button",
	type: ui_enum_variants.secondary, 
	on_click: method({ notificationElem: notificationElem }, function(elem) {
		notificationElem.add_item("Secondary button has been pressed", ui_enum_variants.secondary);
		elem.remove();
	})
});

ui_checkbox({ 
	x: 10, 
	y: 120, 
	width: 220, 
	height: 25, 
	text: "Enable UI Render Debug",
	checked: false,
	on_click: method({ notificationElem: notificationElem }, function(elem) {
		notificationElem.add_item("Primary checkbox has been pressed", ui_enum_variants.primary);
		global.UI_ENABLE_RENDER_DEBUG = !global.UI_ENABLE_RENDER_DEBUG;
		elem.state.text = global.UI_ENABLE_RENDER_DEBUG ? "Disable UI Render Debug" : "Enable UI Render Debug";
	})
});

ui_checkbox({ 
	x: 10, 
	y: 160, 
	width: 180, 
	height: 25, 
	type: ui_enum_variants.secondary,
	text: "Checkbox Secondary",
	checked: true,
	on_click: method({ notificationElem: notificationElem }, function(elem) {
		notificationElem.add_item("Secondary checkbox has been pressed", ui_enum_variants.secondary);
	})
});

//var slider = ui_slider({ 
//	x: 10, 
//	y: 210, 
//	width: 110, 
//	height: 25, 
//	value: 25,
//	onClick: method({ notificationElem: notificationElem }, function(elem) {
//		notificationElem.add_item(elem.id + " has been pressed");
//	})
//});
//draw_text(130, 220, slider.state.value);


var scrollbar_horizontal = ui_scrollbar({
	x: 10, 
	y: 200, 
	width: 200, 
	height: 20, 
	type: ui_enum_variants.primary,
	direction: uih_enum_scrollbar_direction.horizontal,
	thumb_size: 100,
});

var scrollbar_vertical = ui_scrollbar({
	x: 10, 
	y: 230, 
	width: 20, 
	height: 200, 
	type: ui_enum_variants.primary,
	direction: uih_enum_scrollbar_direction.vertical,
	thumb_size: 50,
	on_change: method({scrollbar_horizontal: scrollbar_horizontal}, function(value) {
		scrollbar_horizontal.set({ value: value});
	}),
});

scrollbar_horizontal.set({ on_change: method({scrollbar_vertical: scrollbar_vertical}, function(value) {
		scrollbar_vertical.set({ value: value});
	}),
});