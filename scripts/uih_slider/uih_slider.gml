enum uih_enum_slider_status {
    idle,
    hover,
    dragging
}

enum uih_enum_slider_direction {
	vertical,
	horizontal,
}

/**
 * Get the logical UI slider component 
 *
 * @param {Struct} _state Initial state to store in the component
 * @param {Struct} _parent Parent layer. By default it is the root layer
 *
 * @return {Struct}
 */
function UihSlider(_state = undefined, _parent = undefined) : UihComponent(_state, _parent) constructor {
	state.type = state[$ "type"] ?? ui_enum_variants.primary;
	
	/// Current status (see uih_enum_slider_status fort supported values)
    state.status = uih_enum_slider_status.idle;
    
    /// Slider direction, either vertical or horizontal (see uih_enum_slider_direction)
    state.direction = state[$ "direction"] ?? uih_enum_slider_direction.vertical;
    
    /// Minimum selectable value
    state.min = state[$ "min"] ?? 0;
    
    /// Maximum selectable value
    state.max = state[$ "max"] ?? 100;
    
    /** The granularity of the slider; the step increment should be a divisor of 
     * the track's length
     */
    state.step = state[$ "step"] ?? 1;
    
    /** Current selected value; it should be between state.min and state.max and 
     * be a multiple of state.step
     */
    state.value = state[$ "value"] ?? 0;
    
    /** The margin to apply to the start and the end of the slider track; 
     * useful when the thumb can overflow outside the track;
     * the actual track's length will be the component's size (width or height
     * bases on state.direction) minus this track margin
     */
    state.track_margin = state[$ "track_padding"] ?? 0;
    
    step = function() {
        var status = state.status;
		var hovered = parent.is_hovered(self);
		
		if (status != uih_enum_slider_status.idle && mouse_check_button_released(mb_any)) {
			set({ status: uih_enum_slider_status.idle });
		} else if ((hovered && mouse_check_button_pressed(mb_any)) || state.status == uih_enum_slider_status.dragging) {
			// Update value if mouse pressed on slider or if it is already being dragged
			var mouse_delta = state.direction == uih_enum_slider_direction.vertical
				? mouse_y - state.y - state.track_margin
				: mouse_x - state.x - state.track_margin;
			var track_length = state.direction == uih_enum_slider_direction.vertical
				? state.height - state.track_margin * 2
				: state.width - state.track_margin * 2;
			var value = clamp(mouse_delta / track_length, 0, 1);
			var stepped_value = round((state.max - state.min) * value / state.step) * state.step;
			
			set({ 
				status: uih_enum_slider_status.dragging, 
				value: stepped_value,
			});
			
			if (variable_struct_exists(state, "on_change")) {
				state.on_change(stepped_value);
			}
		} else if (hovered) {
			if (status != uih_enum_slider_status.hover) {
				set({ status: uih_enum_slider_status.hover });	
			}
		} else if (status != uih_enum_slider_status.idle) {
			set({ status: uih_enum_slider_status.idle });
		}
    };
}