/**
 * Get the render UI component 
 *
 * @param {Real} _x Component X coordinate
 * @param {Real} _y Component Y coordinate
 * @param {Real} _width Component width
 * @param {Real} _height Component height
 * @param {Struct} [_parent] Parent component
 *
 * @return {Struct}
 */
function UiScrollableContainer(_x, _y, _width, _height, _parent = undefined) : UiScrollableContainerStep(_x, _y, _width, _height, _parent) constructor {	
	draw = function() {		
		// Draw the background		
		draw_set_color(ui_variable_col_bg);
		draw_rectangle(0, 0, state.width, state.height, false);
	};
}