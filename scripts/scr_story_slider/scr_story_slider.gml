function scr_story_slider(showcase) {
	draw_set_circle_precision(64);
	
	var w = 200;
	var h = 30;
	var xx = showcase.x - round(w/2);
	var yoff = 30;
	var h_full = h * 3;
	var yy = showcase.y - round(h_full / 2);
	
	var slider0 = new UiSlider(xx, yy, w, h);
	with (slider0.state) {
		thumb_radius = 10;
	}

	yy += yoff;
	var slider1 = new UiSlider(xx, yy, w, h);
	with (slider1.state) {
		step = 5;
	}

	yy += yoff;
	var slider2 = new UiSlider(xx, yy, w, h);
	with (slider2.state) {
		step = 25;
		thumb_radius = 5;
	}
	
	return [
		slider0,
		slider1,
		slider2
	];
}