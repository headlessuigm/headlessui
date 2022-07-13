// Variable to enable the components render debug
global.UI_ENABLE_RENDER_DEBUG = false;

// UI enums
enum ui_enum_variants {
	primary,
	secondary
}

/**
 * Re-render the elements if updated and draw their surfaces
 * 
 * @param {Array} sortedChildren
 */
function ui_draw(sortedChildren = global.UIH_ROOT_COMPONENT.sortedChildren) {
	// Store the drawing state (for later reset)
	var color = draw_get_color();
	var font = draw_get_font();
	var halign = draw_get_halign();
	var valign = draw_get_valign();
	var alpha = draw_get_alpha();
	
	// Loop over the elements
	for (var i = 0, len=array_length(sortedChildren); i<len; i++) {
		var elem = sortedChildren[i];
		
		if (variable_struct_exists(elem, "surface")) {
			var state = elem.state;
		
			// If the surface has been deleted, force the re-rendering
			if (!surface_exists(elem.surface)) {
				elem.surface = surface_create(state.width, state.height);
				elem.updated = true;
			}
		
			// Re-render the element if it has been updated
			if (elem.updated) {
				surface_set_target(elem.surface);
				draw_clear_alpha(c_black, 0);
				elem.state.render(elem.state);
				surface_reset_target();
				elem.updated = false;
				draw_set_alpha(1);
			
				// For debug purposes, draw an outline around the rendered element
				if (global.UI_ENABLE_RENDER_DEBUG) {
					draw_set_color(c_red);
					for (var o=0; o<3; o++) {
						draw_rectangle(state.x - o, state.y - o, state.x + state.width + o, state.y + state.height + o, true);
					}
				}
			}
		
			// Draw the element surface
			draw_surface(elem.surface, state.x, state.y);
		}
		
		ui_draw(elem.sortedChildren);
	}
	
	// Reset the drawing state
	draw_set_color(color);
	draw_set_font(font);
	draw_set_halign(halign);
	draw_set_valign(valign);
	draw_set_alpha(alpha);
}