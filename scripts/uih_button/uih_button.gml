enum uih_enum_button_status {
	idle,
	clicked,
	hover,
}

/**
 * Get the logical UI component 
 *
 * @param {Struct} state Initial state to store in the component
 * @param {Struct} parent Parent layer. By default it is the root layer 
 * @param {Function} on_render Function called to render the component
 *
 * @return {Struct}
 */
function uih_button(state = undefined, parent = undefined, on_render = undefined) {
	return uih_create_component({
		state: state, 
		parent: parent,
		on_render: on_render, 
		
		on_init: function(elem) {
			var state = elem.state;
			
			// Set the default button status
			state.status = uih_enum_button_status.idle;
			
			// Button style props
			state.type = variable_struct_exists(state, "type") ? state.type : ui_enum_variants.primary;
			state.padding_horizontal = variable_struct_exists(state, "padding_horizontal") ? state.padding_horizontal : 40;
			state.padding_vertical = variable_struct_exists(state, "padding_vertical") ? state.padding_vertical : 20;
			state.text_sep = variable_struct_exists(state, "text_sep") ? state.text_sep : -1;
			state.text_max_width = variable_struct_exists(state, "text_max_width") ? state.text_max_width : -1;
			
			/**
			 * Set the text of the button, auto-resizing the container, according to the button padding
			 * 
			 * @param {String} text Button text
			 * @param {Integer} sep Distance between each character
			 * @param {Integer} max_width Max text width
			 */
			elem.set_text = method({ elem: elem }, function(text, sep = -1, max_width = -1) {
				var state = self.elem.state;
				if (text == state.text) return;
				state.text = text;
				state.text_sep = sep;
				state.text_max_width = max_width;
				self.elem.resize(
					string_width_ext(text, sep, max_width) + state.padding_horizontal,
					string_height_ext(text, sep, max_width) + state.padding_vertical
				);
			});
		},
		
		on_step: function(elem) {
			// Handle the button status
			var status = elem.state.status;
	
			if (status != uih_enum_button_status.idle && mouse_check_button_released(mb_any)) {
				elem.set({ status: uih_enum_button_status.idle });
			} else if (elem.parent.is_hovered(elem)) {
				if (mouse_check_button_pressed(mb_any)) {
					elem.set({ status: uih_enum_button_status.clicked });
					elem.click();
				} else if (status == uih_enum_button_status.idle) {
					elem.set({ status: uih_enum_button_status.hover });
				}
			} else if (status == uih_enum_button_status.hover) {
				elem.set({ status: uih_enum_button_status.idle });
			}
		}
	});
}