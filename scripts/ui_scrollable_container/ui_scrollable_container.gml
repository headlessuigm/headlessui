/**
 * Get the render UI component 
 *
 * @param {Struct} state Component initial state to store
 * @param {Struct} parent Parent layer. By default it is the root layer 
 *
 * @return {Struct}
 */
function UiScrollableContainer(state, parent = undefined) : UihScrollableContainer(state, parent) constructor {	
	self.on_render = function() {		
		// Draw the background		
		draw_set_color(ui_variable_col_bg);
		draw_rectangle(0, 0, self.state.width, self.state.height, false);
	};
}