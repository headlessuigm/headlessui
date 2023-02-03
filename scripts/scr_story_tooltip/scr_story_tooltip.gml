function scr_story_tooltip(showcase) {
	var w = 120;
	var h = 30;
	var xx = showcase.x - round(w/2);
	var yy = showcase.y - round(h/2);
	
	var tooltipBtn = new UiButton(xx, yy, w, h);
	with (tooltipBtn.state) {
		text = "Hover over me";
	}

	var tooltip = new UiTooltip();
	with (tooltip.state) {
		linked_component = tooltipBtn;
		text_max_width = 250;
	}
	tooltip.set_text("Tooltip shown on button hover, with the text going on a newline");
	tooltip.move();
	
	return [
		tooltipBtn,
		tooltip
	];
}