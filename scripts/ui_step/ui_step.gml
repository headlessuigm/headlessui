function ui_step(component = global.UIH_ROOT_COMPONENT) {
    // Run the step component method on component and its children
	if (variable_struct_exists(component, "step") && component.step) {
		component.step();
	}
	
	for (var i = 0; i < array_length(component.children); i++) {
	    ui_step(component.children[i]);
	}
}