// Variable to enable the components render debug
global.UI_ENABLE_RENDER_DEBUG = false;

/**
 * Re-render the childents if updated and draw their surfaces
 * 
 * @param {Array} children
 */
function ui_draw(children = global.UIH_ROOT_COMPONENT.children) {
	// Store the drawing state (for later reset)
	var color = draw_get_color();
	var font = draw_get_font();
	var halign = draw_get_halign();
	var valign = draw_get_valign();
	var alpha = draw_get_alpha();
	
	// Loop over the childents
	for (var i = 0; i<array_length(children); i++) {
		var child = children[i];
		
		// Run the step component method
		if (variable_struct_exists(child, "on_step") && child.on_step) {
			child.on_step(child);
		}
		
		if (!variable_struct_exists(child, "disable_surface") || !child.disable_surface) {
			var state = child.state;
		
			// If the surface has been deleted, force the re-rendering
			if (!surface_exists(child.surface)) {
				child.surface = surface_create(state.width + 1, state.height + 1);
				child.updated = true;
			}
		
			// Re-render the childen if it has been updated
			if (child.updated) {
				surface_set_target(child.surface);
				draw_clear_alpha(c_black, 0);
				child.on_render(child.state);
				ui_draw(child.children);
				surface_reset_target();
				child.updated = false;
				draw_set_alpha(1);
			
				// For debug purposes, draw an outline around the rendered component
				if (global.UI_ENABLE_RENDER_DEBUG) {
					draw_set_color(c_red);
					for (var o=0; o<3; o++) {
						draw_rectangle(state.x - o, state.y - o, state.x + state.width + o, state.y + state.height + o, true);
					}
				}
			}
		
			// Draw the component surface
			draw_surface(child.surface, state.x, state.y);
		}
		
		
	}
	
	// Reset the drawing state
	draw_set_color(color);
	draw_set_font(font);
	draw_set_halign(halign);
	draw_set_valign(valign);
	draw_set_alpha(alpha);
}