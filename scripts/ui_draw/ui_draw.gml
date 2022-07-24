/**
 * Re-render the childents if updated and draw their surfaces
 * 
 * @param {Array} updated_components
 * @param {Array} children [Internal usage]
 */
function ui_draw(updated_components = [], children = global.UIH_ROOT_COMPONENT.children) {
	// Store the drawing state (for later reset)
	var color = draw_get_color();
	var font = draw_get_font();
	var halign = draw_get_halign();
	var valign = draw_get_valign();
	var alpha = draw_get_alpha();
	
	// Loop over the children
	for (var i = 0; i < array_length(children); i++) {
		var child = children[i];
		var parent = child.parent;
		
		// Run the step component method
		if (variable_struct_exists(child, "step") && child.step) {
			child.step();
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
				child.draw();
				surface_reset_target();
				draw_set_alpha(1);
			}

			// First draw the children as they can draw on parent's surface
			ui_draw(updated_components, child.children);

			// Then draw the surface on its own parent's surface 
			if (!parent.disable_surface) {
				surface_set_target(parent.surface);
				draw_surface(child.surface, child.state.x - parent.state.scroll_x, child.state.y - parent.state.scroll_y);
				surface_reset_target();
			} else {
				// TODO: improve this, parents without surface can cause issues and require custom drawing with absolute coordinates
				draw_surface(child.surface, parent.x_abs() + child.state.x - parent.state.scroll_x, parent.y_abs() + child.state.y - parent.state.scroll_y);
			}
		} else {
			ui_draw(updated_components, child.children);
		}
		
		// Reset the updated status of the component
		if (child.updated) {
			child.updated = false;
			array_push(updated_components, child);
		}
	}

	// Reset the drawing state
	draw_set_color(color);
	draw_set_font(font);
	draw_set_halign(halign);
	draw_set_valign(valign);
	draw_set_alpha(alpha);
}