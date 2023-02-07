enum ui_enum_scrollbar_status {
	idle,
	hover,
	dragging,
}

enum ui_enum_scrollbar_direction {
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
function UiScrollbarStep(_x, _y, _width, _height, _parent = undefined) : UiBaseComponent(_x, _y, _width, _height, _parent) constructor {
	// Set the default scrollbar status
	with (state) {
		type = ui_enum_variants.primary;
		status = ui_enum_scrollbar_status.idle;
		direction = ui_enum_scrollbar_direction.vertical;
		value = 0;
		thumb_size = 0;
	}

	step = function() {
		var status = state.status;
		var hovered = is_hovered();
		
		if (status != ui_enum_scrollbar_status.idle && mouse_check_button_released(mb_left)) {
			set({ status: ui_enum_scrollbar_status.idle });
		} else if ((hovered && mouse_check_button_pressed(mb_left)) || state.status == ui_enum_scrollbar_status.dragging) {
			// Update value if mouse pressed on scrollbar or if it is already being dragged
			var mouse_delta = state.direction == ui_enum_scrollbar_direction.vertical
				? global.ui_mouse_y - state.thumb_size / 2 - state.y
				: global.ui_mouse_x - state.thumb_size / 2 - state.x;
			var track_length = state.direction == ui_enum_scrollbar_direction.vertical
				? state.height - state.thumb_size
				: state.width - state.thumb_size;
			var value = clamp(mouse_delta / track_length, 0, 1);
			
			set({ 
				status: ui_enum_scrollbar_status.dragging, 
				value: value,
			});
			
			if (variable_struct_exists(state, "on_change")) {
				state.on_change(self, value);
			}
		} else if (hovered) {
			if (status != ui_enum_scrollbar_status.hover) {
				set({ status: ui_enum_scrollbar_status.hover });	
			}
		} else if (status != ui_enum_scrollbar_status.idle) {
			set({ status: ui_enum_scrollbar_status.idle });
		}
	};
}