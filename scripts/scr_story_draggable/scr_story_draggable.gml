function scr_story_draggable(showcase) {
	var w = 200;
	var h = 200;
	var xx = showcase.x - round(w/2);
	var yy = showcase.y - round(h/2);
	
	var layer_with_draggable = new UiLayerStep(xx, yy, w, h);

	var draggable_both = new UiDraggableStep(10, 25, 75, 25);
	draggable_both.set_parent(layer_with_draggable);

	var draggable_button_both = new UiButton(0, 0, 75, 25, draggable_both);
	with (draggable_button_both.state) {
		text = "Drag me!";
	}

	var draggable_x = new UiDraggableStep(10, 100, 75, 25, layer_with_draggable);
	with (draggable_x.state) {
		axis = ui_enum_draggable_axis.x
	}

	var draggable_button_x = new UiButton(0, 0, 75, 25, draggable_x);
	with (draggable_button_x.state) {
		axis = ui_enum_draggable_axis.x;
		text = "X Axis";
	}

	var draggable_y = new UiDraggableStep(10, 175, 75, 25, layer_with_draggable);
	with (draggable_y.state) {
		axis = ui_enum_draggable_axis.y;
	}

	var draggable_button_y = new UiButton(0, 0, 75, 25, draggable_y);
	with (draggable_button_y.state) {
		text = "Y Axis";
	}
	
	return [
		layer_with_draggable,
		draggable_both,
		draggable_button_both,
		draggable_x,
		draggable_button_x,
		draggable_y,
		draggable_button_y
	];
}