enum uih_enum_button_status {
	idle,
	clicked,
	hover,
}

/**
 * Get the logical UI component 
 *
 * @param {String} uid Component unique ID
 * @param {Struct} state Initial state to store in the component
 * @param {Struct} parent Parent layer. By default it is the root layer 
 * @param {Function} onRenderInit Function called to enhance the initial state on component initialization
 *
 * @return {Struct}
 */
function uih_button(uid, state = undefined, parent = undefined, onRenderInit = undefined) {
	var elem = __uih_use_elem({
		uid: uid, 
		state: state, 
		parent: parent,
		onRenderInit: onRenderInit, 
		onLogicInit: function(elem) {
			// Set the default button status
			elem.state.status = uih_enum_button_status.idle;
		}
	});
		
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
	
	return elem;
}