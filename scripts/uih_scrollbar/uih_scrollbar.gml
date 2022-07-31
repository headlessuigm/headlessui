enum uih_enum_scrollbar_status {
	idle,
	hover,
	dragging,
}

enum uih_enum_scrollbar_direction {
	vertical,
	horizontal,
}


/**
 * Get the logical UI component 
 *
 * @param {Real} _x Component X coordinate
 * @param {Real} _y Component Y coordinate
 * @param {Real} _width Component width
 * @param {Real} _height Component height
 * @param {Struct} [_parent] Parent component
 *
 * @return {Struct}
 */
function UihScrollbar(_x, _y, _width, _height, _parent = undefined) : UihComponent(_x, _y, _width, _height, _parent) constructor {
	// Set the default scrollbar status
	with (state) {
		type = ui_enum_variants.primary;
		status = uih_enum_scrollbar_status.idle;
		direction = uih_enum_scrollbar_direction.vertical;
		value = 0;
		thumb_size = 0;
	}

	step = function() {
		var status = state.status;
		var hovered = parent.is_hovered(self);
		
		if (status != uih_enum_scrollbar_status.idle && mouse_check_button_released(mb_any)) {
			set({ status: uih_enum_scrollbar_status.idle });
		} else if ((hovered && mouse_check_button_pressed(mb_any)) || state.status == uih_enum_scrollbar_status.dragging) {
			// Update value if mouse pressed on scrollbar or if it is already being dragged
			var mouse_delta = state.direction == uih_enum_scrollbar_direction.vertical
				? global.ui_mouse_y - state.thumb_size / 2 - state.y
				: global.ui_mouse_x - state.thumb_size / 2 - state.x;
			var track_length = state.direction == uih_enum_scrollbar_direction.vertical
				? state.height - state.thumb_size
				: state.width - state.thumb_size;
			var value = clamp(mouse_delta / track_length, 0, 1);
			
			set({ 
				status: uih_enum_scrollbar_status.dragging, 
				value: value,
			});
			
			if (variable_struct_exists(state, "on_change")) {
				state.on_change(value);
			}
		} else if (hovered) {
			if (status != uih_enum_scrollbar_status.hover) {
				set({ status: uih_enum_scrollbar_status.hover });	
			}
		} else if (status != uih_enum_scrollbar_status.idle) {
			set({ status: uih_enum_scrollbar_status.idle });
		}
	};
}