function scr_story_slider(showcase) {
	var w = 200;
	var h = 30;
	var xx = showcase.x - round(w/2);
	var yoff = 30;
	var h_full = h * 3;
	var yy = showcase.y - round(h_full / 2);
	
	var slider0 = new UiSlider(xx, yy, w, h);
	slider0.set_thumb_radius(10);

	yy += yoff;
	var slider1 = new UiSlider(xx, yy, w, h);
	with (slider1.state) {
		step = 5;
	}

	yy += yoff;
	var slider2 = new UiSlider(xx, yy, w, h);
	slider2.set_thumb_radius(5);
	with (slider2.state) {
		step = 25;
	}
	
	return [
		slider0,
		slider1,
		slider2
	];
}