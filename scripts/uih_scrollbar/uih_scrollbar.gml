enum uih_enum_scrollbar_status {
	idle,
	hover,
	dragging,
}

enum uih_enum_scrollbar_direction {
	vertical,
	horizontal,
}


/**
 * Get the logical UI component 
 *
 * @param {Struct} state Initial state to store in the component
 * @param {Struct} parent Parent layer. By default it is the root layer 
 * @param {Function} on_render Function called to render the component
 *
 * @return {Struct}
 */
function uih_scrollbar(state = undefined, parent = undefined, on_render = undefined) {
	return new HuiComponent({
		state: state, 
		parent: parent,
		on_render: on_render, 
		
		on_init: function(elem) {
			// Set the default scrollbar status
			elem.state.type = variable_struct_exists(elem.state, "type") ? elem.state.type : ui_enum_variants.primary;
			elem.state.status = uih_enum_button_status.idle;
			elem.state.direction = variable_struct_exists(elem.state, "direction") ? elem.state.direction : uih_enum_scrollbar_direction.vertical;
			elem.state.value = variable_struct_exists(elem.state, "value") ? elem.state.value : 0;
			elem.state.thumb_size = variable_struct_exists(elem.state, "thumb_size") ? elem.state.thumb_size : 0;
		},
		
		on_step: function(elem) {
			var status = elem.state.status;
			var hovered = elem.parent.is_hovered(elem);
			
			if (status != uih_enum_scrollbar_status.idle && mouse_check_button_released(mb_any)) {
				elem.set({ status: uih_enum_scrollbar_status.idle });
			} else if ((hovered && mouse_check_button_pressed(mb_any)) || elem.state.status == uih_enum_scrollbar_status.dragging) {
				// Update value if mouse pressed on scrollbar or if it is already being dragged
				var mouse_delta = elem.state.direction == uih_enum_scrollbar_direction.vertical
					? mouse_y - elem.state.thumb_size / 2 - elem.state.y
					: mouse_x - elem.state.thumb_size / 2 - elem.state.x;
				var track_length = elem.state.direction == uih_enum_scrollbar_direction.vertical
					? elem.state.height - elem.state.thumb_size
					: elem.state.width - elem.state.thumb_size;
				var value = clamp(mouse_delta / track_length, 0, 1);
				
				elem.set({ 
					status: uih_enum_scrollbar_status.dragging, 
					value: value,
				});
				
				if (variable_struct_exists(elem.state, "on_change")) {
					elem.state.on_change(value);
				}
			} else if (hovered) {
				if (status != uih_enum_scrollbar_status.hover) {
					elem.set({ status: uih_enum_scrollbar_status.hover });	
				}
			} else if (status != uih_enum_scrollbar_status.idle) {
				elem.set({ status: uih_enum_scrollbar_status.idle });
			}
		}
	});
}