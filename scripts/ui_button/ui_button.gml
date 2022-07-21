/**
 * Get the render UI component 
 *
 * @param {Struct} state Component initial state to store
 * @param {Struct} parent Parent layer. By default it is the root layer 
 *
 * @return {Struct}
 */
function UiButton(state, parent = undefined) : UihButton(state, parent) constructor {	
	self.on_render = function() {
		var type = self.state.type;
		
		// Draw the background
		var bgcolor;
		switch (self.state.status) {
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
		draw_rectangle(0, 0, self.state.width, self.state.height, false);
		
		// Draw the text
		draw_set_color(type == ui_enum_variants.primary ? ui_variable_col_on_primary : ui_variable_col_on_secondary); 
		draw_set_halign(fa_center); 
		draw_set_valign(fa_middle); 
		draw_set_font(ui_variable_font);
		draw_text_ext(self.state.width/2, self.state.height/2, self.state.text, self.state.text_sep, self.state.text_max_width);
	};
}