/**
 * Get the render UI component 
 *
 * @param {Struct} state Component initial state to store
 * @param {Struct} parent Parent layer. By default it is the root layer 
 *
 * @return {Struct}
 */
function UiCheckbox(state, parent = undefined) : UihCheckbox(state, parent) constructor {	
	self.on_render = function() {
		var type = self.state[$ "type"] ?? ui_enum_variants.primary;
		
		// Draw the background
		var bgcolor;
		switch (self.state.status) {
			case uih_enum_checkbox_status.clicked:
				bgcolor = type == ui_enum_variants.primary ? ui_variable_col_primary_dark : ui_variable_col_secondary_dark;
				break;
			case uih_enum_checkbox_status.hover:
				bgcolor = type == ui_enum_variants.primary ? ui_variable_col_primary_light : ui_variable_col_secondary_light;
				break;
			default: 
				bgcolor = type == ui_enum_variants.primary ? ui_variable_col_primary : ui_variable_col_secondary;
		}
		
		var checkboxWidth = self.state.height;
		draw_set_color(bgcolor);
		draw_rectangle(0, 0, checkboxWidth, self.state.height, false);
		
		// If checked, draw the inner rectangle
		if (self.state.checked) {
			draw_set_color(type == ui_enum_variants.primary ? ui_variable_col_primary_dark : ui_variable_col_secondary_dark);
			var padding = 4;
			draw_rectangle(padding, padding, checkboxWidth - padding, self.state.height - padding, false);
		}
		
		// Draw the text
		draw_set_color(ui_variable_col_on_bg); 
		draw_set_halign(fa_left); 
		draw_set_valign(fa_middle); 
		draw_set_font(ui_variable_font);
		draw_text(checkboxWidth + 10, self.state.height/2, self.state.text);
	};
}
