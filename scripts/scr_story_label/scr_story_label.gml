function scr_story_label(showcase) {
	var w = 300;
	var h = 60;
	var xx = showcase.x - round(w/2);
	var yy = showcase.y - round(h/2);
	
	var label = new UiLabel(xx, yy, w, h);
	with (label.state) {
		text = "Welcome to Headless UI." + chr(13) + chr(10) + "Click on a component on the list to show it";
		halign = fa_center;
		valign = fa_middle;
	}
	
	return [
		label
	];
}