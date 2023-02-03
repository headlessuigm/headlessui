function scr_story_checkbox(showcase) {
	var w = 100;
	var h = 25;
	var xx = showcase.x - round(w/2);
	var yy = showcase.y - round(h/2);
	
	var checkbox = new UiCheckbox(xx, yy, w, h);
	with (checkbox.state) {
		text = "Checkbox";
	}
	
	return [
		checkbox
	];
}