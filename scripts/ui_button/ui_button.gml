/**
 * Get the render UI component 
 *
 * @param {Struct} _state Component initial state to store
 * @param {Struct} _parent Parent layer. By default it is the root layer 
 *
 * @return {Struct}
 */
function UiButton(_state, _parent = undefined) : UihButton(_state, _parent) constructor {	
	draw = function() {
		var type = state.type;
		
		// Draw the background
		var bgcolor;
		switch (state.status) {
			case uih_enum_button_status.clicked:
				bgcolor = type == ui_enum_variants.primary ? ui_variable_col_primary_dark : ui_variable_col_secondary_dark;
				break;
			case uih_enum_button_status.hover:
				bgcolor = type == ui_enum_variants.primary ? ui_variable_col_primary_light : ui_variable_col_secondary_light;
				break;
			default: 
				bgcolor = type == ui_enum_variants.primary ? ui_variable_col_primary : ui_variable_col_secondary;
		}
		
		draw_set_color(bgcolor);
		draw_rectangle(0, 0, state.width, state.height, false);
		
		// Draw the text
		draw_set_color(type == ui_enum_variants.primary ? ui_variable_col_on_primary : ui_variable_col_on_secondary);
		draw_set_halign(fa_center); 
		draw_set_valign(fa_middle); 
		draw_set_font(ui_variable_font);
		ui_draw_text(state.width/2, state.height/2, state.text, state.text_sep, state.text_max_width);
	};
}
