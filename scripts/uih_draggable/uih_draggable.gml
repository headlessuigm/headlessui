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


function UihDraggable(_state = undefined, _parent = undefined) : UihLayer(_state, _parent) constructor {
    skip_layer_checks = false;

    // Default state
    state.status = uih_enum_draggable_status.idle;
    state.start_x = state.x;
    state.start_y = state.y;
    state.drag_origin_x = 0;
    state.drag_origin_y = 0;
    state.axis = state[$ "axis"] ?? uih_enum_draggable_axis.both;
    state.bounds = state[$ "bounds"] ?? "parent";
    
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
                        set({ 
                            status: uih_enum_draggable_status.drag,
                            drag_origin_x: mouse_x - x_abs(),
                            drag_origin_y: mouse_y - y_abs(),
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
                    : mouse_x - parent.x_abs() + parent.state.scroll_x - state.drag_origin_x;
                    
                var desired_y = state.axis == uih_enum_draggable_axis.x
                    ? state.y
                    : mouse_y - parent.y_abs() + parent.state.scroll_y - state.drag_origin_y;
                    
                var min_x = state.bounds == "parent" ? 0 : (state.start_x - state.bounds.left);
                var min_y = state.bounds == "parent" ? 0 : (state.start_y - state.bounds.up);
                var max_x = state.bounds == "parent" ? parent.state.width : (state.start_x + state.bounds.right);
                var max_y = state.bounds == "parent" ? parent.state.height : (state.start_y + state.bounds.down);
                
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
