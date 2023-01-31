enum uih_enum_button_status {
	idle,
	clicked,
	hover,
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
function UihButton(_x, _y, _width, _height, _parent = undefined) : UihComponent(_x, _y, _width, _height, _parent) constructor {
	// Set the default button status
	with (state) {
		status = uih_enum_button_status.idle;
		enabled = true;
		click_type = ui_enum_click_type.released;
		click_button = mb_left;
	
		// Button style props
		type = ui_enum_variants.primary;
		padding_horizontal = 40;
		padding_vertical = 20;
		text_sep = -1;
		text_max_width = -1;
	}
	
	/**
	 * Set the text of the button, auto-resizing the container, according to the button padding
	 * 
	 * @param {String} text Button text
	 * @param {Integer} sep Distance between each character
	 * @param {Integer} max_width Max text width
	 */
	set_text = function(text, sep = -1, max_width = -1) {
		if (text == state.text) {
			return;
		}
		state.text = text;
		state.text_sep = sep;
		state.text_max_width = max_width;
		resize(
			string_width_ext(text, sep, max_width) + state.padding_horizontal,
			string_height_ext(text, sep, max_width) + state.padding_vertical
		);
	};
		
	step = function() {
		if (!state.enabled) {
			return;
		}
		
		// Handle the button status
		var status = state.status;
		var click_type = state.click_type;
		var click_button = state.click_button;

		if (status != uih_enum_button_status.idle && mouse_check_button_released(click_button)) {
			set({ status: uih_enum_button_status.idle });
			
			if (click_type == ui_enum_click_type.released && parent.is_hovered(self)) {
				click();
			}
		} else if (parent.is_hovered(self)) {
			if (mouse_check_button_pressed(click_button)) {
				set({ status: uih_enum_button_status.clicked });
				
				if (click_type == ui_enum_click_type.pressed) {
					click();	
				}
			} else if (status == uih_enum_button_status.idle) {
				set({ status: uih_enum_button_status.hover });
			}
		} else if (status == uih_enum_button_status.hover) {
			set({ status: uih_enum_button_status.idle });
		}
	};
}
