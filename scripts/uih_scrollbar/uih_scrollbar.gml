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
function UihScrollbar(state = undefined, parent = undefined) : UihComponent(state, parent) constructor {
	// Set the default scrollbar status
	self.state.type = self.state[$ "type"] ?? ui_enum_variants.primary;
	self.state.status = uih_enum_button_status.idle;
	self.state.direction = self.state[$ "direction"] ?? uih_enum_scrollbar_direction.vertical;
	self.state.value = self.state[$ "value"] ?? 0;
	self.state.thumb_size = self.state[$ "thumb_size"] ?? 0;

	self.on_step = function() {
		var status = self.state.status;
		var hovered = self.parent.is_hovered(self);
		
		if (status != uih_enum_scrollbar_status.idle && mouse_check_button_released(mb_any)) {
			self.set({ status: uih_enum_scrollbar_status.idle });
		} else if ((hovered && mouse_check_button_pressed(mb_any)) || self.state.status == uih_enum_scrollbar_status.dragging) {
			// Update value if mouse pressed on scrollbar or if it is already being dragged
			var mouse_delta = self.state.direction == uih_enum_scrollbar_direction.vertical
				? mouse_y - self.state.thumb_size / 2 - self.state.y
				: mouse_x - self.state.thumb_size / 2 - self.state.x;
			var track_length = self.state.direction == uih_enum_scrollbar_direction.vertical
				? self.state.height - self.state.thumb_size
				: self.state.width - self.state.thumb_size;
			var value = clamp(mouse_delta / track_length, 0, 1);
			
			self.set({ 
				status: uih_enum_scrollbar_status.dragging, 
				value: value,
			});
			
			if (variable_struct_exists(state, "on_change")) {
				self.state.on_change(value);
			}
		} else if (hovered) {
			if (status != uih_enum_scrollbar_status.hover) {
				self.set({ status: uih_enum_scrollbar_status.hover });	
			}
		} else if (status != uih_enum_scrollbar_status.idle) {
			self.set({ status: uih_enum_scrollbar_status.idle });
		}
	};
}