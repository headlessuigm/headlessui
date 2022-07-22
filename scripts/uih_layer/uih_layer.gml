/**
 * Get the logical UI component 
 *
 * @param {Struct} _state Initial state to store in the component
 * @param {Struct} _parent Parent layer. By default it is the root layer
 *
 * @return {Struct}
 */
function UihLayer(_state = undefined, _parent = undefined) :  UihComponent(_state, _parent) constructor {
	skip_layer_checks = true;
	disable_surface = true;

	/**
	  * Set the specified element as focused (if not already)
	  */
	focus = function(child) {
		var children = children;
		var topIdx = array_length(children) - 1;
	
		// Find the element to focus and move it on the top
		for (var i = topIdx; i >= 0; i--) {
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
	is_hovered = function(elem) {
		for (var i = array_length(children) - 1; i >= 0; i--) {
			var child = children[i];
			if (child.skip_layer_checks) continue;
			var childX = x_abs() + child.state.x - self.state.scroll_x;
			var childY = y_abs() + child.state.y - self.state.scroll_y;
			if (!point_in_rectangle(mouse_x, mouse_y, childX, childY, childX + child.state.width, childY + child.state.height)) continue;
			return child == elem;
		}
		return undefined;
	};
}
