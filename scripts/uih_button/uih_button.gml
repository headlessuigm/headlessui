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
 * @param {Function} onRender Function called to render the component
 *
 * @return {Struct}
 */
function uih_button(state = undefined, parent = undefined, onRender = undefined) {
	return uih_create_component({
		state: state, 
		parent: parent,
		onRender: onRender, 
		
		onLogicInit: function(elem) {
			var state = elem.state;
			
			// Set the default button status
			state.status = uih_enum_button_status.idle;
			
			// Button style props
			state.paddingHorizontal = variable_struct_exists(state, "paddingHorizontal") ? state.paddingHorizontal : 40;
			state.paddingVertical = variable_struct_exists(state, "paddingVertical") ? state.paddingVertical : 20;
			state.textSep = variable_struct_exists(state, "textSep") ? state.textSep : -1;
			state.textMaxWidth = variable_struct_exists(state, "textMaxWidth") ? state.textMaxWidth : -1;
			
			/**
			 * Set the text of the button, auto-resizing the container, according to the button padding
			 * 
			 * @param {String} text Button text
			 * @param {Integer} sep
			 * @param {Integer} maxWidth
			 */
			elem.setText = method({ elem: elem }, function(text, sep = -1, maxWidth = -1) {
				var state = self.elem.state;
				if (text == state.text) return;
				state.text = text;
				state.textSep = sep;
				state.textMaxWidth = maxWidth;
				self.elem.resize(
					string_width_ext(text, sep, maxWidth) + state.paddingHorizontal,
					string_height_ext(text, sep, maxWidth) + state.paddingVertical
				);
			});
		},
		
		onStep: function(elem) {
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