/// @TODO

/**
 * Get the logical UI component 
 *
 * @param {Struct} state Initial state to store in the component
 * @param {Struct} parent Parent layer. By default it is the root layer 
 * @param {Function} on_render Function called to render the component
 *
 * @return {Struct}
 */
//function uih_slider(state = undefined, parent = undefined, on_render = undefined) {
//	var elem = uih_create_component({
//		state: state, 
//		parent: parent,
//		on_render: on_render, 
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
