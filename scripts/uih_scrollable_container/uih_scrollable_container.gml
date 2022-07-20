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
function UihScrollableContainer(state = undefined, parent = undefined) : UihComponent(state, parent) constructor {
	self.state.scrollable_width = self.state[$ "scrollable_width"] ?? self.state.width;
	self.state.scrollable_height = self.state[$ "scrollable_height"] ?? self.state.height;
	self.state.scroll_step = self.state[$ "scroll_step"] ?? 24;
	self.state.on_scroll = self.state[$ "on_scroll"];
	
	/**
	 * Set the specified element as focused (if not already)
	 */
	self.focus = function(child) {
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
	};

	/**
	 * Check if the specified element is the most higher (on top) element, that is intersecting the mouse
	 */
	self.is_hovered = function(elem) {
		for (var i = array_length(self.children) - 1; i >= 0; i--) {
			var child = self.children[i];
			if (child.skip_layer_checks) continue;
			var child_x = child.state.x - self.state.scroll_x;
			var child_y = child.state.y - self.state.scroll_y;
			if (!point_in_rectangle(mouse_x, mouse_y, child_x, child_y, child_x + child.state.width, child_y + child.state.height)) continue;
			return child == elem;
		}
		return undefined;
	};
		
	self.on_step = function() {
		var scrolled = undefined;
		
		if (self.parent.is_hovered(self)) {
			if (mouse_wheel_up()) {
				if (keyboard_check(vk_shift)) {
					self.set({ scroll_x: max(0, self.state.scroll_x - self.state.scroll_step) });
					scrolled = uih_enum_scroll_direction.horizontal;
				} else {
					self.set({ scroll_y: max(0, self.state.scroll_y - self.state.scroll_step) });
					scrolled = uih_enum_scroll_direction.vertical;
				}					
			}
			
			if (mouse_wheel_down()) {
				if (keyboard_check(vk_shift)) {
					self.set({ scroll_x: min(self.state.scrollable_width - self.state.width, self.state.scroll_x + self.state.scroll_step) });
					scrolled = uih_enum_scroll_direction.horizontal;
				} else {
					self.set({ scroll_y: min(self.state.scrollable_height - self.state.height, self.state.scroll_y + self.state.scroll_step) });
					scrolled = uih_enum_scroll_direction.vertical;
				}
			}
		}
		
		if (!is_undefined(scrolled) && !is_undefined(self.state.on_scroll)) {
			var normalized_scroll_value = scrolled == uih_enum_scroll_direction.vertical
				? self.state.scroll_y / (self.state.scrollable_height - self.state.height)
				: self.state.scroll_x / (self.state.scrollable_width - self.state.width);
			self.state.on_scroll(scrolled, normalized_scroll_value);
		}
	};
}
