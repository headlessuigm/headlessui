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
function UiLayerStep(_x, _y, _width, _height, _parent = undefined) : UiBaseComponent(_x, _y, _width, _height, _parent) constructor {
	skip_layer_checks = true;
	disable_surface = true;

	/**
	 * Check if the specified child component is the highest (on top) component, that is intersecting the mouse
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
