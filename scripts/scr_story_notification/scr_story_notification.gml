function scr_story_notification(showcase) {
	var notification_elem = new UiNotification(oCtrl.gui_width - 340, 10, 330, 300);
	
	var w = 190;
	var h = 40;
	var xx = showcase.x - round(w/2);
	var yy = showcase.y - round(h/2);
	
	var button = new UiButton(xx, yy, w, h);
	with (button.state) {
		text = "Show a notification";
		on_click = method({ notification_elem: notification_elem }, function(elem) {
			notification_elem.add_item("Button has been pressed", ui_enum_variants.primary);
		});
	}

	notification_elem.focus(); 
	
	return [
		notification_elem,
		button
	];
}