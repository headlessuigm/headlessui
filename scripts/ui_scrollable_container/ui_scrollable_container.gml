/**
 * Get the render UI component 
 *
 * @param {Struct} state Component initial state to store
 * @param {Struct} parent Parent layer. By default it is the root layer 
 *
 * @return {Struct}
 */
function ui_scrollable_container(state, parent = undefined) {	
	return uih_scrollable_container(state, parent, function(state) {		
		// Draw the background		
		draw_set_color(ui_variable_col_bg);
		draw_rectangle(0, 0, state.width, state.height, false);
	});
}