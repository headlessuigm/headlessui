/**
 * Get the render UI slider component 
 *
 * @param {Real} _x Component X coordinate
 * @param {Real} _y Component Y coordinate
 * @param {Real} _width Component width
 * @param {Real} _height Component height
 * @param {Struct} [_parent] Parent component
 *
 * @return {Struct}
 */
function UiSlider(_x, _y, _width, _height, _parent = undefined) : UihSlider(_x, _y, _width, _height, _parent) constructor {
	with (state) {
		/**
		 * Thumb's circle radius
		 * @internal
		 * @see set_thumb_radius
		 */
		__thumb_radius = 8;
		
		/**
		 * Track's thickness
		 * This value will be assigned to the track's width or height based on
		 * the slider's direction
		 */
		track_thickness = 5;
	}

	/**
	 * Set the thumb's radius
	 * @param {Real} value the radius of the slider's thumb
	 */
	set_thumb_radius = function(value) {
		with (state) {
			__thumb_radius = value;
			track_margin = value;
		}
	};
	
	// Initialize thumb radius
	set_thumb_radius(state.__thumb_radius);
    
	draw = function() {
	    var half_width = round(state.width / 2);
	    var half_height = round(state.height / 2);
	    var half_thickness = round(state.track_thickness / 2);
	    
		// Draw the track
		var bgcolor = state.type == ui_enum_variants.primary ? ui_variable_col_primary_dark : ui_variable_col_secondary_dark;
		draw_set_color(bgcolor);
		
		if (state.direction == uih_enum_slider_direction.vertical) {
		 	draw_rectangle(half_width - half_thickness, state.track_margin, half_width + half_thickness, state.height - state.track_margin, false);   
		} else{
	    	draw_rectangle(state.track_margin, half_height - half_thickness, state.width - state.track_margin, half_height + half_thickness, false);
		}
		
		// Draw the thumb
		var thumb_x, thumb_y;
		if (state.direction == uih_enum_slider_direction.vertical) {
			thumb_x = half_width - 1;
			thumb_y = (state.height - state.track_margin * 2) * ((state.value - state.min_value) / state.max_value) + state.track_margin;
		} else {
			thumb_x = (state.width - state.track_margin * 2) * ((state.value - state.min_value) / state.max_value) + state.track_margin;
			thumb_y = half_height - 1;
		}
			
		var thumb_color;
		switch (state.status) {
			case uih_enum_slider_status.dragging:
				thumb_color = state.type == ui_enum_variants.primary ? ui_variable_col_primary_light : ui_variable_col_secondary_light;
				break;
			default: 
				thumb_color = state.type == ui_enum_variants.primary ? ui_variable_col_primary : ui_variable_col_primary;
		}
		
		draw_set_color(thumb_color);
		draw_set_alpha(.5);
		draw_circle(thumb_x, thumb_y, state.__thumb_radius, true);
		draw_set_alpha(1);
		draw_circle(thumb_x, thumb_y, state.__thumb_radius, false);
	};
}
