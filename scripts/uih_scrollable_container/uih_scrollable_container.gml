enum uih_enum_scroll_direction {
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
function uih_scrollable_container(state = undefined, parent = undefined, on_render = undefined) {
	return new HuiComponent({
		state: state, 
		parent: parent,
		//skip_layer_checks: false,
		surface: true,
		on_render: on_render, 
		on_init: function(elem) {
			var state = elem.state;
			
			state.scroll_x = variable_struct_exists(state, "scroll_x") ? state.scroll_x : 0;
			state.scroll_y = variable_struct_exists(state, "scroll_y") ? state.scroll_y : 0;
			state.scrollable_width = variable_struct_exists(state, "scrollable_width") ? state.scrollable_width : state.width;
			state.scrollable_height = variable_struct_exists(state, "scrollable_height") ? state.scrollable_height : state.height;
			state.scroll_step = variable_struct_exists(state, "scroll_step") ? state.scroll_step : 24;
			state.on_scroll = variable_struct_exists(state, "on_scroll") ? state.on_scroll : undefined;
			
			/**
			 * Set the specified element as focused (if not already)
			 */
			elem.focus = method(elem, function(child) {
				var children = self.children;
				var topIdx = array_length(children) - 1;
			
				// Find the element to focus and move it on the top
				for (var i=topIdx; i>=0; i--) {
					var sortedChild = children[i];
					if (sortedChild != child || sortedChild.skip_layer_checks) continue;
					if (i == topIdx) return;
					array_push(children, child);
					array_delete(children, i, 1);
					break;
				}
			});
	
			/**
			 * Check if the specified element is the most higher (on top) element, that is intersecting the mouse
			 */
			elem.is_hovered = method(elem,  function(elem) {
				for (var i = array_length(self.children) - 1; i >= 0; i--) {
					var child = self.children[i];
					if (child.skip_layer_checks) continue;
					var child_x = child.state.x - self.state.scroll_x;
					var child_y = child.state.y - self.state.scroll_y;
					if (!point_in_rectangle(mouse_x, mouse_y, child_x, child_y, child_x + child.state.width, child_y + child.state.height)) continue;
					return child == elem;
				}
				return undefined;
			});
		},
		
		on_step: function(elem) {
			var scrolled = undefined;
			
			if (elem.parent.is_hovered(elem)) {
				if (mouse_wheel_up()) {
					if (keyboard_check(vk_shift)) {
						elem.set({ scroll_x: max(0, elem.state.scroll_x - elem.state.scroll_step) });
						scrolled = uih_enum_scroll_direction.horizontal;
					} else {
						elem.set({ scroll_y: max(0, elem.state.scroll_y - elem.state.scroll_step) });
						scrolled = uih_enum_scroll_direction.vertical;
					}					
				}
				
				if (mouse_wheel_down()) {
					if (keyboard_check(vk_shift)) {
						elem.set({ scroll_x: min(elem.state.scrollable_width - elem.state.width, elem.state.scroll_x + elem.state.scroll_step) });
						scrolled = uih_enum_scroll_direction.horizontal;
					} else {
						elem.set({ scroll_y: min(elem.state.scrollable_height - elem.state.height, elem.state.scroll_y + elem.state.scroll_step) });
						scrolled = uih_enum_scroll_direction.vertical;
					}
				}
			}
			
			if (!is_undefined(scrolled) && !is_undefined(elem.state.on_scroll)) {
				var normalized_scroll_value = scrolled == uih_enum_scroll_direction.vertical
					? elem.state.scroll_y / (elem.state.scrollable_height - elem.state.height)
					: elem.state.scroll_x / (elem.state.scrollable_width - elem.state.width);
				elem.state.on_scroll(scrolled, normalized_scroll_value);
			}
		},
	});
}