enum ui_enum_slider_status {
    idle,
    hover,
    dragging
}

enum ui_enum_slider_direction {
	vertical,
	horizontal,
}

/**
 * Get the logical UI slider component 
 *
 * @param {Real} _x Component X coordinate
 * @param {Real} _y Component Y coordinate
 * @param {Real} _width Component width
 * @param {Real} _height Component height
 * @param {Struct} [_parent] Parent component
 *
 * @return {Struct}
 */
function UiSliderStep(_x, _y, _width, _height, _parent = undefined) : UiBaseComponent(_x, _y, _width, _height, _parent) constructor {
	name = "Slider";
	
	with (state) {
		type = ui_enum_variants.primary;
	
		/// Current status (see ui_enum_slider_status fort supported values)
		status = ui_enum_slider_status.idle;
    
		/// Slider direction, either vertical or horizontal (see ui_enum_slider_direction)
		direction = ui_enum_slider_direction.horizontal;
    
		/// Minimum selectable value
		min_value = 0;
    
		/// Maximum selectable value
		max_value = 100;
    
	    /** The granularity of the slider; the step increment should be a divisor of 
	     * the track's length
	     */
		step = 1;
    
	    /** Current selected value; it should be between state.min_value and state.max_value and 
	     * be a multiple of state.step
	     */
		value = 0;
		
		/**
		 * Thumb's radius
		 */
		thumb_radius = 8;
	}
	
	on_mouse_enter = function() {
		if (state.status != ui_enum_slider_status.idle) return;
		set({ status: ui_enum_slider_status.hover });
	};
	
	on_mouse_leave = function() {
		if (state.status == ui_enum_slider_status.dragging) return;
		set({ status: ui_enum_slider_status.idle });
	}
	
	on_mouse_press = function() {
		if (mouse_button != mb_left) return;
		set({ status: ui_enum_slider_status.dragging });
	}
	
    step = function() {
		// Update the track position while the slider is being dragged
		if (mouse_check_button(mb_left) && state.status == ui_enum_slider_status.dragging) {
			var mouse_delta = state.direction == ui_enum_slider_direction.vertical
				? global.ui_mouse_y - state.y - state.thumb_radius
				: global.ui_mouse_x - state.x - state.thumb_radius;
			var track_length = state.direction == ui_enum_slider_direction.vertical
				? state.height - state.thumb_radius * 2
				: state.width - state.thumb_radius * 2;
			var value = clamp(mouse_delta / track_length, 0, 1);
			var stepped_value = round((state.max_value - state.min_value) * value / state.step) * state.step;
			
			set({
				status: ui_enum_slider_status.dragging,
				value: stepped_value,
			});
		
			if (variable_struct_exists(state, "on_change")) {
				state.on_change(self, stepped_value);
			}
		}
		
		if (mouse_check_button_released(mb_left)) {
			set({ status: ui_enum_slider_status.idle });
		}
    };
}