/**
 * Get the render UI component 
 *
 * @param {Struct} _state Component initial state to store
 * @param {Struct} _parent Parent layer. By default it is the root layer 
 *
 * @return {Struct}
 */
function UiScrollableContainer(_state, _parent = undefined) : UihScrollableContainer(_state, _parent) constructor {	
	draw = function() {		
		// Draw the background		
		draw_set_color(ui_variable_col_bg);
		draw_rectangle(0, 0, state.width, state.height, false);
	};
}