/**
 * Check the components pointer events
 *
 * @param {Struct} parent Component to check
 * @length {Real} children_length Count of children of this component
 */
function __ui_check_pointer_events(parent, children_length) {
	var children = parent.children;
	
	for (var i = children_length - 1; i >= 0; i--) {
		var child = children[i];
		var child_state = child.state;
		children_length = array_length(child.children);		

		if (children_length) {
			__ui_check_pointer_events(child, children_length);
		} else if (child.pointer_events && child_state.active) {
			var parent_state = parent.state;
			var parent_x_abs = parent.x_abs();
			var parent_y_abs = parent.y_abs();			
			var child_x = parent_x_abs + child_state.x - parent_state.scroll_x;
			var child_y = parent_y_abs + child_state.y - parent_state.scroll_y;
			
			// Check that the mouse is inside the child component
			if (point_in_rectangle(global.ui_mouse_x, global.ui_mouse_y, child_x, child_y, child_x + child_state.width, child_y + child_state.height)) {
				
				// Check if the mouse is inside the parent component (but only if disable_surface is falsy)
				if (parent != global.ui_root_component && !parent.disable_surface && !point_in_rectangle(global.ui_mouse_x, global.ui_mouse_y, 
						parent_x_abs, parent_y_abs, parent_x_abs + parent_state.width, parent_y_abs + parent_state.height)) {
					//continue;
				}
			
				if (!child.hovered) {
					child.hovered = true;
					
					if (variable_struct_exists(child, "on_mouse_enter")) child.on_mouse_enter();
					child_state.on_mouse_enter(child);
					show_debug_message(child.name)

				}
	        
				if (mouse_check_button_pressed(mb_any)) {
					if (variable_struct_exists(child, "on_mouse_press")) child.on_mouse_press();
					child_state.on_mouse_press(child);
				}
					
				if (mouse_check_button(mb_any)) {
					if (variable_struct_exists(child, "on_mouse_hold")) child.on_mouse_hold();
					child_state.on_mouse_hold(child);
				}
				
				if (mouse_check_button_released(mb_any)) {
					if (variable_struct_exists(child, "on_mouse_release")) child.on_mouse_release();
					child_state.on_mouse_release(child);
				}
				
				if (mouse_check_button_released(mb_left)) {
					if (variable_struct_exists(child, "on_click")) child.on_click();
					child_state.on_click(child);
				}
					
				break;
			} else if (child.hovered) {
				// @todo if (child.hovered) { handled separately bc of "break" side effect
				// Mouse leave
				child.hovered = false;
				if (variable_struct_exists(child, "on_mouse_leave")) child.on_mouse_leave();
				child_state.on_mouse_leave(child);
				__ui_call_mouse_leave_on_children(child.children);
			}
		}
	}
}

/**
 * Call the "on_mouse_leave" event on all children of a component that executed this initial event
 * @internal
 *
 * @param {Array<Struct>} children Children which upon to execute the event
 */
function __ui_call_mouse_leave_on_children(children) {
	for (var c = 0, clen = array_length(children); c < clen; c++) {
		var child = children[c];
		
		child.hovered = false;
		
		show_debug_message("child leave")
		if (variable_struct_exists(child, "on_mouse_leave")) {
			child.on_mouse_leave();
		}
		
		child.state.on_mouse_leave(child);
		
		__ui_call_mouse_leave_on_children(child.children);
	}
}