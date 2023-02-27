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
	name = "Scrollbar";
	
	// Set the default scrollbar status
	with (state) {
		type = ui_enum_variants.primary;
		status = ui_enum_scrollbar_status.idle;
		direction = ui_enum_scrollbar_direction.vertical;
		value = 0;
		thumb_size = 0;
	}
	
	on_mouse_enter = function() {
		if (state.status != ui_enum_scrollbar_status.idle) return;
		set({ status: ui_enum_scrollbar_status.hover });
	};
	
	on_mouse_leave = function() {
		if (state.status == ui_enum_scrollbar_status.dragging) return;
		set({ status: ui_enum_scrollbar_status.idle });
	}
	
	on_mouse_press = function() {
		if (mouse_button != mb_left) return;
		set({ status: ui_enum_scrollbar_status.dragging });
	}
	
	step = function() {
		if (mouse_check_button(mb_left) && state.status == ui_enum_scrollbar_status.dragging) {
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
		}
		
		if (mouse_check_button_released(mb_left)) {
			set({ status: ui_enum_scrollbar_status.idle });
		}
	};
}
