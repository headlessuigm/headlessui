// Re-render the elements if updated, and draw their surfaces
var updated_components = ui_draw();

if (draw_debug) {
	ui_draw_debug(updated_components);
}