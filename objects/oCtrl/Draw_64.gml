// Re-render the elements if updated, and draw their surfaces
ui_draw();

/** Notifications */
var notificationElem = ui_notification("Notifications", { 
	x: display_get_gui_width() - 340, 
	y: 10, 
	width: 330, 
	height: 300
});

/** Buttons */
ui_button("PrimaryButton", { 
	x: 10, 
	y: 10, 
	width: 190, 
	height: 40, 
	text: "Primary Button", 
	onClick: method({ notificationElem: notificationElem }, function(elem) {
		notificationElem.add_item(elem.id + " has been pressed", ui_enum_variants.primary);
	})
});

ui_button("SecondaryButton", {
	x: 10, 
	y: 65,
	width: 190,
	height: 40, 
	text: "Secondary Button",
	type: ui_enum_variants.secondary, 
	onClick: method({ notificationElem: notificationElem }, function(elem) {
		notificationElem.add_item(elem.id + " has been pressed", ui_enum_variants.secondary);
	})
});

ui_checkbox("Checkbox", { 
	x: 10, 
	y: 120, 
	width: 220, 
	height: 25, 
	text: "Enable UI Render Debug",
	checked: false,
	onClick: method({ notificationElem: notificationElem }, function(elem) {
		notificationElem.add_item(elem.id + " has been pressed", ui_enum_variants.primary);
		global.UI_ENABLE_RENDER_DEBUG = !global.UI_ENABLE_RENDER_DEBUG;
		elem.state.text = global.UI_ENABLE_RENDER_DEBUG ? "Disable UI Render Debug" : "Enable UI Render Debug";
	})
});

ui_checkbox("Checkbox2", { 
	x: 10, 
	y: 160, 
	width: 180, 
	height: 25, 
	type: ui_enum_variants.secondary,
	text: "Checkbox Secondary",
	checked: true,
	onClick: method({ notificationElem: notificationElem }, function(elem) {
		notificationElem.add_item(elem.id + " has been pressed", ui_enum_variants.secondary);
	})
});

//var slider = ui_slider("Slider", { 
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
