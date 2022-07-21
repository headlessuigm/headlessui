enum uih_enum_scroll_direction {
	vertical,
	horizontal,
}

/**
 * Get the logical UI component 
 *
 * @param {Struct} _state Initial state to store in the component
 * @param {Struct} _parent Parent layer. By default it is the root layer
 *
 * @return {Struct}
 */
function UihScrollableContainer(_state = undefined, _parent = undefined) : UihLayer(_state, _parent) constructor {
	skip_layer_checks = false;
	disable_surface = false;
	
	state.scrollable_width = state[$ "scrollable_width"] ?? state.width;
	state.scrollable_height = state[$ "scrollable_height"] ?? state.height;
	state.scroll_step = state[$ "scroll_step"] ?? 24;
	state.on_scroll = state[$ "on_scroll"];
		
	step = function() {
		var scrolled = undefined;
		
		if (parent.is_hovered(self)) {
			if (mouse_wheel_up()) {
				if (keyboard_check(vk_shift)) {
					set({ scroll_x: max(0, state.scroll_x - state.scroll_step) });
					scrolled = uih_enum_scroll_direction.horizontal;
				} else {
					set({ scroll_y: max(0, state.scroll_y - state.scroll_step) });
					scrolled = uih_enum_scroll_direction.vertical;
				}					
			}
			
			if (mouse_wheel_down()) {
				if (keyboard_check(vk_shift)) {
					set({ scroll_x: min(state.scrollable_width - state.width, state.scroll_x + state.scroll_step) });
					scrolled = uih_enum_scroll_direction.horizontal;
				} else {
					set({ scroll_y: min(state.scrollable_height - state.height, state.scroll_y + state.scroll_step) });
					scrolled = uih_enum_scroll_direction.vertical;
				}
			}
		}
		
		if (!is_undefined(scrolled) && !is_undefined(state.on_scroll)) {
			var normalized_scroll_value = scrolled == uih_enum_scroll_direction.vertical
				? state.scroll_y / (state.scrollable_height - state.height)
				: state.scroll_x / (state.scrollable_width - state.width);
			state.on_scroll(scrolled, normalized_scroll_value);
		}
	};
}
