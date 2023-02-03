function scr_story_button(showcase) {
	var w = 150;
	var h = 40;
	var xx = showcase.x - round(w/2);
	var yy = showcase.y - round(h/2);
	
	var button = new UiButton(xx, yy, w, h);
	with (button.state) {
		text = "Button";
		on_click = method({ showcase: showcase }, function(elem) {
			draw_set_font(ui_font);
			elem.set_text("Dynamically changed text");
			elem.state.x =  round(showcase.x - elem.state.width/2);
		});
	}
	
	return [
		button
	];
}