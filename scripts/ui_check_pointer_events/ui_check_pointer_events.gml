/**
 * Check the components pointer events
 *
 * @param {Struct} parent Component to check
 * @length {Real} children_length Count of children of this component
 */
function __ui_check_pointer_events(parent, children_length) {
	// Check if the previously hovered component is still intersecting the mouse
	if (global.ui_hovered_component != undefined) {
		var elem = global.ui_hovered_component;
		
		var elem_state = elem.state;
		var elem_x = elem.x_abs();
		var elem_y = elem.y_abs();
		
		if (!point_in_rectangle(global.ui_mouse_x, global.ui_mouse_y, elem_x, elem_y, elem_x + elem_state.width, elem_y + elem_state.height)) {
			__ui_unhover_component(elem);			
			global.ui_hovered_component = undefined;
		}
	}
	
	// Hover algorithm
	var children = parent.children;
	
	for (var i = children_length - 1; i >= 0; i--) {
		var child = children[i];
		var child_state = child.state;
		children_length = array_length(child.children);		

		// First check the pointer events of the children nodes
		if (children_length) {
			if (__ui_check_pointer_events(child, children_length)) {
				return true;
			}
		}
		
		if (child.pointer_events && child_state.active && child_state.enabled) {
			var parent_state = parent.state;
			var parent_x_abs = parent.x_abs();
			var parent_y_abs = parent.y_abs();			
			var child_x = child.x_abs();
			var child_y = child.y_abs();
			
			// Check that the mouse is inside the child component
			if (point_in_rectangle(global.ui_mouse_x, global.ui_mouse_y, child_x, child_y, child_x + child_state.width, child_y + child_state.height)) {
				
				// Check if the mouse is inside the parent component (but only if disable_surface is falsy)
				if (parent != global.ui_root_component && !parent.disable_surface && !point_in_rectangle(global.ui_mouse_x, global.ui_mouse_y, 
					parent_x_abs, parent_y_abs, parent_x_abs + parent_state.width, parent_y_abs + parent_state.height)) {
					
					// Unhover the previously hovered component when going out of the parent container
					if (global.ui_hovered_component != undefined) {
						__ui_unhover_component(global.ui_hovered_component);
					}
					
					continue;
				}
			
				if (!child.hovered) {
					// Automatically unhover the previous hovered component, taking into assumption that only one component can be hovered at a time
					if (global.ui_hovered_component != undefined) {
						__ui_unhover_component(global.ui_hovered_component);
					}
					
					child.hovered = true;
					global.ui_hovered_component = child;
					
					if (variable_struct_exists(child, "on_mouse_enter")) {
						child.on_mouse_enter();
					}
					
					child_state.on_mouse_enter(child);
				}
	        
				if (mouse_check_button_pressed(mb_any)) {
					if (variable_struct_exists(child, "on_mouse_press")) {
						child.on_mouse_press();
					}
					
					child_state.on_mouse_press(child);
				}
					
				if (mouse_check_button(mb_any)) {
					if (variable_struct_exists(child, "on_mouse_hold")) {
						child.on_mouse_hold();
					}
					
					child_state.on_mouse_hold(child);
				}
				
				if (mouse_check_button_released(mb_any)) {
					if (variable_struct_exists(child, "on_mouse_release")) {
						child.on_mouse_release();
					}
					
					child_state.on_mouse_release(child);
				}
				
				if (mouse_check_button_released(mb_left)) {
					if (variable_struct_exists(child, "on_click")) {
						child.on_click();
					}
					
					child_state.on_click(child);
				}
					
				return true;
			}
		}
	}
	
	return false;
}

/**
 * Call the mouse leave event on an component and set it as unhovered
 * @internal
 *
 * @param {Struct} elem
 */
function __ui_unhover_component(elem) {
	elem.hovered = false;
	
	if (variable_struct_exists(elem, "on_mouse_leave")) {
		elem.on_mouse_leave();
	}
	
	elem.state.on_mouse_leave(elem);
}