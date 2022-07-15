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
			// Set the default button status
			elem.state.status = uih_enum_button_status.idle;
		},
		
		onStep: function(elem) {
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