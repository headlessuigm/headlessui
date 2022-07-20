enum uih_enum_checkbox_status {
	idle,
	clicked,
	hover,
}

/**
 * Get the logical UI component 
 *
 * @param {Struct} state State to store in the component
 * @param {Struct} parent Parent layer. By default it is the root layer 
 * @param {Function} on_render Function called to render the component
 *
 * @return {Struct}
 */
function UihCheckbox(state = undefined, parent = undefined) : UihComponent(state, parent) constructor {
	// Set the default checkbox status
	self.state.status = uih_enum_checkbox_status.idle;
	self.state.type = self.state[$ "type"] ?? ui_enum_variants.primary;
		
	self.on_step = function() {
		var status = self.state.status;

		if (status != uih_enum_checkbox_status.idle && mouse_check_button_released(mb_any)) {
			self.set({ status: uih_enum_checkbox_status.idle });
		} else if (self.parent.is_hovered(self)) {
			if (mouse_check_button_pressed(mb_any)) {
				self.set({ status: uih_enum_checkbox_status.clicked, checked: !self.state.checked });
				self.click();
			} else if (status == uih_enum_checkbox_status.idle) {
				self.set({ status: uih_enum_checkbox_status.hover });
			}
		} else if (status == uih_enum_checkbox_status.hover) {
			self.set({ status: uih_enum_checkbox_status.idle });
		}
	};
}
