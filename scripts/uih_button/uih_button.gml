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
 *
 * @return {Struct}
 */
function UihButton(state = undefined, parent = undefined) : UihComponent(state, parent) constructor {
	// Set the default button status
	self.state.status = uih_enum_button_status.idle;
	
	// Button style props
	self.state.type = self.state[$ "type"] ?? ui_enum_variants.primary;
	self.state.padding_horizontal = self.state[$ "padding_horizontal"] ?? 40;
	self.state.padding_vertical = self.state[$ "padding_vertical"] ?? 20;
	self.state.text_sep = self.state[$ "text_sep"] ?? -1;
	self.state.text_max_width = self.state[$ "text_max_width"] ?? -1;
	
	/**
	 * Set the text of the button, auto-resizing the container, according to the button padding
	 * 
	 * @param {String} text Button text
	 * @param {Integer} sep Distance between each character
	 * @param {Integer} max_width Max text width
	 */
	self.set_text = function(text, sep = -1, max_width = -1) {
		if (text == self.state.text) return;
		self.state.text = text;
		self.state.text_sep = sep;
		self.state.text_max_width = max_width;
		self.resize(
			string_width_ext(text, sep, max_width) + self.state.padding_horizontal,
			string_height_ext(text, sep, max_width) + self.state.padding_vertical
		);
	};
		
	self.on_step = function() {
		// Handle the button status
		var status = self.state.status;

		if (status != uih_enum_button_status.idle && mouse_check_button_released(mb_any)) {
			set({ status: uih_enum_button_status.idle });
		} else if (self.parent.is_hovered(self)) {
			if (mouse_check_button_pressed(mb_any)) {	
				self.set({ status: uih_enum_button_status.clicked });
				self.click();
			} else if (status == uih_enum_button_status.idle) {
				self.set({ status: uih_enum_button_status.hover });
			}
		} else if (status == uih_enum_button_status.hover) {
			self.set({ status: uih_enum_button_status.idle });
		}
	};
}