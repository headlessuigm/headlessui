enum uih_enum_button_status {
	idle,
	clicked,
	hover,
}

/**
 * Get the logical UI component 
 *
 * @param {Struct} _state Initial state to store in the component
 * @param {Struct} _parent Parent layer. By default it is the root layer
 *
 * @return {Struct}
 */
function UihButton(_state = undefined, _parent = undefined) : UihComponent(_state, _parent) constructor {
	// Set the default button status
	state.status = uih_enum_button_status.idle;
	
	// Button style props
	state.type = state[$ "type"] ?? ui_enum_variants.primary;
	state.padding_horizontal = state[$ "padding_horizontal"] ?? 40;
	state.padding_vertical = state[$ "padding_vertical"] ?? 20;
	state.text_sep = state[$ "text_sep"] ?? -1;
	state.text_max_width = state[$ "text_max_width"] ?? -1;
	
	/**
	 * Set the text of the button, auto-resizing the container, according to the button padding
	 * 
	 * @param {String} text Button text
	 * @param {Integer} sep Distance between each character
	 * @param {Integer} max_width Max text width
	 */
	set_text = function(text, sep = -1, max_width = -1) {
		if (text == state.text) return;
		state.text = text;
		state.text_sep = sep;
		state.text_max_width = max_width;
		resize(
			string_width_ext(text, sep, max_width) + state.padding_horizontal,
			string_height_ext(text, sep, max_width) + state.padding_vertical
		);
	};
		
	step = function() {
		// Handle the button status
		var status = state.status;

		if (status != uih_enum_button_status.idle && mouse_check_button_released(mb_any)) {
			set({ status: uih_enum_button_status.idle });
		} else if (parent.is_hovered(self)) {
			if (mouse_check_button_pressed(mb_any)) {	
				set({ status: uih_enum_button_status.clicked });
				click();
			} else if (status == uih_enum_button_status.idle) {
				set({ status: uih_enum_button_status.hover });
			}
		} else if (status == uih_enum_button_status.hover) {
			set({ status: uih_enum_button_status.idle });
		}
	};
}