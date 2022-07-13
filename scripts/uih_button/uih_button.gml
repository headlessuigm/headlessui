enum uih_enum_button_status {
	idle,
	clicked,
	hover,
}
	

/**
 * Get the logical UI component 
 *
 * @param {String} id Component unique ID
 * @param {Struct} initialState Component initial state to store
 * @param {Struct} parent Parent layer. By default it is the root layer 
 * @param {Function} onInit Function called to enhance the initial state on component initialization
 *
 * @return {Struct}
 */
function uih_button(id, initialState, parent = undefined, onInit = undefined) {	
	var elem = __uih_use_elem(id, initialState, parent, method({ onInit: onInit}, function(elem) {
		if (self.onInit != undefined) self.onInit(elem);
		var state = elem.state;
		elem.surface = noone;
		state.status = uih_enum_button_status.idle;
	}));
		
	var state = elem.state;
	var status = state.status;
	
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