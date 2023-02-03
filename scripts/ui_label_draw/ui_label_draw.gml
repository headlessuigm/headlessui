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
function UiLabel(_x, _y, _width, _height, _parent = undefined) : UiBaseComponent(_x, _y, _width, _height, _parent) constructor {
	with (state) {
		color = ui_variable_col_on_bg;
		halign = fa_left;
		valign = fa_top;
		alpha = 1;
		font = ui_variable_font;
		
		// If specified, allow to cut the text if the text length is greater than the specified maxlength value
		maxlength = undefined;
		
		// Multiline text
		sep = -1;
		maxwidth = -1;
	}
	
	draw = function() {
		var text = state.text;
		var color = state.color;
		var halign = state.halign;
		var valign = state.valign;
		
		// Allow to cut the text if the length is greater than the specified value
		var maxlength = state.maxlength;
		var drawnText = maxlength && string_length(text) > maxlength ? string_copy(text, 1, maxlength) + "..." : text;
		
		// Calculate the text position based on the alignment
		var xx;
		var yy;
		switch (halign) { 
			case fa_left: xx = 0; break;
			case fa_center: xx = round(state.width/2); break;
			case fa_right: xx = state.width; break;
		}
		
		switch (valign) { 
			case fa_top: yy = 0; break;
			case fa_middle: yy = round(state.height/2); break;
			case fa_bottom: yy = state.height; break;
		}
		
		draw_set_alpha(state.alpha);
		draw_set_halign(state.halign); 
		draw_set_valign(state.valign); 
		draw_set_font(state.font);
		draw_set_color(color); 
		draw_text_ext(xx, yy, drawnText, state.sep, state.maxwidth);
	};
}
