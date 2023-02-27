function scr_story_slider(showcase) {
	draw_set_circle_precision(64);
	
	var w = 200;
	var h = 30;
	var xx = showcase.x - round(w/2);
	var yy = showcase.y - round(h / 2);
	
	var slider0 = new UiSlider(xx, yy, w, h);
	with (slider0.state) {
		thumb_radius = 10;
	}

	return [ slider0 ];
}
