/**
 * Run the components step handlers
 * @internal
 */
function __ui_step(component) {
	// Run the step component method on component and its children
	if (variable_struct_exists(component, "step") && component.step && component.state.enabled && component.state.active) {
		component.step();
	}

	for (var i = 0; i < array_length(component.children); i++) {
		__ui_step(component.children[i]);
	}
}

/**
 * Run the UI step event
 */
function ui_step(component = global.ui_root_component) {
	global.ui_mouse_x = device_mouse_x_to_gui(0);
	global.ui_mouse_y = device_mouse_y_to_gui(0);
	__ui_step(component);
}
