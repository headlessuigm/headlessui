// Re-render the elements if updated, and draw their surfaces
var updated_components = [];
ui_draw(updated_components);

if (draw_debug) {
	ui_draw_debug(updated_components);
}