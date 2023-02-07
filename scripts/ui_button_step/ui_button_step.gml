enum ui_enum_button_status {
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
function UiButtonStep(_x, _y, _width, _height, _parent = undefined) : UiBaseComponent(_x, _y, _width, _height, _parent) constructor {
	name = "Button";
	
	with (state) {
		status = ui_enum_button_status.idle;
	
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
	
	on_mouse_press = function() {
		set({ status: ui_enum_button_status.clicked });
	};
	
	on_mouse_enter = function() {
		set({ status: ui_enum_button_status.hover });	
	}
	
	on_mouse_leave = function() {
		if (state.status != ui_enum_button_status.hover ) return;
		set({ status: ui_enum_button_status.idle });
	}
	
	step = function() {
		if (mouse_check_button_released(mb_any)) {
			set({ status: !hovered ? ui_enum_button_status.idle : ui_enum_button_status.hover });
		}
	}
}
