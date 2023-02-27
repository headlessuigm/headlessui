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
function UiButton(_x, _y, _width, _height, _parent = undefined) : UiButtonStep(_x, _y, _width, _height, _parent) constructor {	
	draw = function() {
		var type = state.type;		
		
		// Draw the sprite
		var sprite = state.sprite;
		if (sprite != undefined) {
			draw_sprite(sprite, state.status, 0, 0);
		} else {
			// Else draw a simple background
			var bgcolor;
			switch (state.status) {
				case ui_enum_button_status.clicked:
					bgcolor = type == ui_enum_variants.primary ? ui_variable_col_primary_dark : ui_variable_col_secondary_dark;
					break;
				case ui_enum_button_status.hover:
					bgcolor = type == ui_enum_variants.primary ? ui_variable_col_primary_light : ui_variable_col_secondary_light;
					break;
				default: 
					bgcolor = type == ui_enum_variants.primary ? ui_variable_col_primary : ui_variable_col_secondary;
			}
		
			draw_set_color(bgcolor);
			draw_rectangle(0, 0, state.width, state.height, false);
		}
		
		// Draw the text
		if (variable_struct_exists(state, "text")) {
			draw_set_color(type == ui_enum_variants.primary ? ui_variable_col_on_primary : ui_variable_col_on_secondary); 
			draw_set_alpha(1);
			draw_set_halign(fa_center); 
			draw_set_valign(fa_middle); 
			draw_set_font(ui_variable_font);
			draw_text_ext(round(state.width/2), round(state.height/2), state.text, state.text_sep, state.text_max_width);
		}
	};
}
