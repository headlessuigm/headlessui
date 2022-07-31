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
function UihLayer(_x, _y, _width, _height, _parent = undefined) :  UihComponent(_x, _y, _width, _height, _parent) constructor {
	skip_layer_checks = true;
	disable_surface = true;

	/**
	  * Set the specified element as focused (if not already)
	  */
	focus = function(child) {
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
		var x_absolute = x_abs();
		var y_absolute = y_abs();
		
		for (var i = array_length(children) - 1; i >= 0; i--) {
			var child = children[i];
			if (child.skip_layer_checks) continue;
			var child_x = x_absolute + child.state.x - state.scroll_x;
			var child_y = y_absolute + child.state.y - state.scroll_y;
			if (!point_in_rectangle(global.ui_mouse_x, global.ui_mouse_y, child_x, child_y, child_x + child.state.width, child_y + child.state.height)) continue;
			return child == elem;
		}
		return undefined;
	};
}
