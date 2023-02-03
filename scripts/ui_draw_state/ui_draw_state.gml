/**
  * Get the current draw state
  * @internal
  *
  * @return {Struct}
  */
 function __ui_draw_get_state() {
	return {
		color: draw_get_color(),
		alpha: draw_get_alpha(),
		font: draw_get_font(),
		halign: draw_get_halign(),
		valign: draw_get_valign()
	};
}

/**
 * Reset the draw state
 * @internal
 *
 * @param {Struct} draw_state
 */
function __ui_draw_reset_state(draw_state) {
	draw_set_color(draw_state.color);
	draw_set_alpha(draw_state.alpha);
	draw_set_font(draw_state.font);
	draw_set_halign(draw_state.halign);
	draw_set_valign(draw_state.valign);
}