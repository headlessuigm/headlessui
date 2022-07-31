enum uih_enum_draggable_status {
    idle,
    hover,
    drag
}

enum uih_enum_draggable_axis {
    both,
    x,
    y
}

/**
 * Get the logical UI component 
 *
 * @param {Real} _x Component X coordinate
 * @param {Real} _y Component Y coordinate
 * @param {Real} _width Component width
 * @param {Real} _height Component height
 * @param {Struct} [_parent] Parent component
 *
 * @return {Struct}
 */
function UihDraggable(_x, _y, _width, _height, _parent = undefined) : UihLayer(_x, _y, _width, _height, _parent) constructor {
    skip_layer_checks = false;

    // Default state
   with (state) {
   		/**
   		 * Current component's status
   		 * @see uih_enum_draggable_status
   		 */
		status = uih_enum_draggable_status.idle;
		
		/**
		 * Axis the draggable can move along
		 * @see uih_enum_draggable_axis
		 */
		axis = uih_enum_draggable_axis.both;
		
		/**
		 * Dragging boundaries
		 * Accepted values:
		 * - "parent": the component will be draggable within the parent
		 * - {Struct} containing "left", "right", "up" and "down" variables; 
		 * these indicate how far in each direction the component can be dragged 
		 * away from the starting position
		 */
		bounds = "parent";
		
		/**
		 * Initial X position
		 * @internal
		 */
		__start_x = x;
		
		/**
		 * Initial Y position
		 * @internal
		 */
		__start_y = y;
		
		/**
		 * Mouse X offset relative to draggable position
		 * @internal
		 */
		__drag_origin_x = 0;
		
		/**
		 * Mouse Y offset relative to draggable position
		 * @internal
		 */
		__drag_origin_y = 0;
   }
    
    step = function() {
        switch (state.status) {
            case uih_enum_draggable_status.idle:
                if (is_hovered(children[0])) {
                    set({ 
                        status: mouse_check_button_pressed(mb_any)
                            ? uih_enum_draggable_status.drag
                            : uih_enum_draggable_status.hover,
                    });
                }
                break;
                
            case uih_enum_draggable_status.hover:
                if (is_hovered(children[0])) {
                    if (mouse_check_button_pressed(mb_any)) {
                    	// Bring draggable on top
                    	if (variable_struct_exists(parent, "focus")) {
                    		parent.focus(self);
                    	}
                    	
                    	// Update state to drag status
                        set({ 
                            status: uih_enum_draggable_status.drag,
                            __drag_origin_x: global.ui_mouse_x - x_abs(),
                            __drag_origin_y: global.ui_mouse_y - y_abs(),
                        });
                    }
                } else {
                    set({ status: uih_enum_draggable_status.idle });
                }
                break;
                
            case uih_enum_draggable_status.drag:
                // Get desired relative position based on mouse position applying drag constraints
                var desired_x = state.axis == uih_enum_draggable_axis.y 
                    ? state.x
                    : global.ui_mouse_x - parent.x_abs() + parent.state.scroll_x - state.__drag_origin_x;
                    
                var desired_y = state.axis == uih_enum_draggable_axis.x
                    ? state.y
                    : global.ui_mouse_y - parent.y_abs() + parent.state.scroll_y - state.__drag_origin_y;
                    
                var min_x = state.bounds == "parent" ? 0 : (state.__start_x - state.bounds.left);
                var min_y = state.bounds == "parent" ? 0 : (state.__start_y - state.bounds.up);
                var max_x = state.bounds == "parent" ? parent.state.width : (state.__start_x + state.bounds.right);
                var max_y = state.bounds == "parent" ? parent.state.height : (state.__start_y + state.bounds.down);
                
                var actual_x = clamp(desired_x, min_x, max_x - state.width);
                var actual_y = clamp(desired_y, min_y, max_y - state.height);
                
                // Update draggable position
                set({
                    x: actual_x,
                    y: actual_y,
                });
                
                if (mouse_check_button_released(mb_any)) {
                    set({ 
                        status: is_hovered(children[0])
                            ? uih_enum_draggable_status.hover
                            : uih_enum_draggable_status.idle,
                    });
                }
                break;
        }
    };
}
