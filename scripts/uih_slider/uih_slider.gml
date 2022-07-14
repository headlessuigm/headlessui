/// @TODO

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
//function uih_slider(uid, state = undefined, parent = undefined, onRenderInit = undefined) {
//	var elem = __uih_use_elem({
//		uid: uid, 
//		state: state, 
//		parent: parent,
//		onRenderInit: onRenderInit
//	});
		
//	var state = elem.state;
//	var value = state.value;
//	var status = state.status;
	
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
