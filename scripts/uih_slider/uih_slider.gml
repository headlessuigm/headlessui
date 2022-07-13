/// @TODO

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
//function uih_slider(id, initialState, parent = undefined, onInit = undefined) {	
//	var elem = __uih_use_elem(id, initialState, parent, method({ onInit: onInit}, function(elem) {
//		if (self.onInit != undefined) self.onInit(elem);
//		var state = elem.state;
//		elem.surface = noone;
//	}));
		
//	var state = elem.state;
//	var value = state.value;
	
//	if (status != "default" && mouse_check_button_released(mb_any)) {
//		elem.set({ status: "default" });
//	} else if (elem.parent.is_hovered(elem)) {
//		if (mouse_check_button(mb_any)) {
//			elem.set({ value: 2 });
//			elem.click();			
//		} else if (status == "default") {
//			elem.set({ status: "hover" });
//		}
//	} else if (status == "hover") {
//		elem.set({ status: "default" });
//	}
	
//	return elem;
//}
