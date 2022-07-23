/**
 * For debug purposes, draw an outline around the given components
 * 
 * @param {Array} _components
 */
function ui_draw_debug(_components) {
	draw_set_color(c_red);
	
	for (var i = 0, len = array_length(_components); i < len; i++) {
		var component = _components[i];
		var debug_x = component.x_abs();
		var debug_y = component.y_abs();
		
		for (var o = 0; o < 3; o++) {
			draw_rectangle(debug_x - o, debug_y - o, debug_x + component.state.width + o, debug_y + component.state.height + o, true);
		}
	}
}
