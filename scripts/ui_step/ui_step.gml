/**
 * Run the components step handlers
 * @internal
 */
function __ui_step(component) {
	// Run the step component method on component and its children
	if (component.state.enabled && component.state.active) {
		if (variable_struct_exists(component, "step") && component.step) {
			component.step();
		}
		
		// Mouse release
		if (mouse_check_button_released(mb_any)) {
			if (variable_struct_exists(component, "on_mouse_release")) component.on_mouse_release();
			component.state.on_mouse_release(component);
		}
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
	ui_check_pointer_events(component, array_length(component.children));
}
