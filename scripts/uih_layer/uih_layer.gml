/**
 * Get the logical UI component 
 *
 * @param {Struct} state Initial state to store in the component
 * @param {Struct} parent Parent layer. By default it is the root layer 
 * @param {Function} on_render Function called to render the component
 *
 * @return {Struct}
 */
function UihLayer(state = undefined, parent = undefined) :  UihComponent(state, parent) constructor {
	self.skip_layer_checks = true;
	self.disable_surface = true;

	/**
	  * Set the specified element as focused (if not already)
	  */
	self.focus = function(child) {
		var children = self.children;
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
	self.is_hovered = function(elem) {
		for (var i = array_length(self.children) - 1; i >= 0; i--) {
			var child = self.children[i];
			if (child.skip_layer_checks) continue;
			var childX = child.state.x;
			var childY = child.state.y;
			if (!point_in_rectangle(mouse_x, mouse_y, childX, childY, childX + child.state.width, childY + child.state.height)) continue;
			return child == elem;
		}
		return undefined;
	};
}
