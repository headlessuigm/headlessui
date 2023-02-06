enum ui_enum_scroll_direction {
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
function UiScrollableContainerStep(_x, _y, _width, _height, _parent = undefined) : UiBaseComponent(_x, _y, _width, _height, _parent) constructor {
	skip_layer_checks = false;
	
	with (state) {
		scrollable_width = width;
		scrollable_height = height;
		scroll_step = 24;
		on_scroll = function() {};
	}
		
	step = function() {
		var scrolled = undefined;
		
		if (is_hovered()) {
			if (mouse_wheel_up()) {
				if (keyboard_check(vk_shift)) {
					set({ scroll_x: max(0, state.scroll_x - state.scroll_step) });
					scrolled = ui_enum_scroll_direction.horizontal;
				} else {
					set({ scroll_y: max(0, state.scroll_y - state.scroll_step) });
					scrolled = ui_enum_scroll_direction.vertical;
				}					
			}
			
			if (mouse_wheel_down()) {
				if (keyboard_check(vk_shift)) {
					set({ scroll_x: min(state.scrollable_width - state.width, state.scroll_x + state.scroll_step) });
					scrolled = ui_enum_scroll_direction.horizontal;
				} else {
					set({ scroll_y: min(state.scrollable_height - state.height, state.scroll_y + state.scroll_step) });
					scrolled = ui_enum_scroll_direction.vertical;
				}
			}
		}
		
		if (!is_undefined(scrolled) && !is_undefined(state.on_scroll)) {
			var normalized_scroll_value = scrolled == ui_enum_scroll_direction.vertical
				? state.scroll_y / (state.scrollable_height - state.height)
				: state.scroll_x / (state.scrollable_width - state.width);
			state.on_change(self, scrolled, normalized_scroll_value);
		}
	};
}
