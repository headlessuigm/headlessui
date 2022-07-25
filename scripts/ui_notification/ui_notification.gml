/**
 * Get the render UI component 
 *
 * @param {Struct} _state Component initial state to store
 * @param {Struct} _parent Parent layer. By default it is the root layer 
 *
 * @return {Struct}
 */
function UiNotification(_state, _parent = undefined) : UihNotification(_state, _parent) constructor {
	draw = function() {
		var items = state.items;
		
		var x1 = 0;
		var x2 = state.width;
		var yOff = 0;
		
		// Draw the items
		draw_set_halign(fa_center); 
		draw_set_valign(fa_middle); 
		draw_set_font(ui_font);
		
		for (var i=0, l=array_length(items); i<l; i++) {
			var item = items[i];
			var y1 = yOff;
			var y2 = yOff + 30;
			yOff += 40;
			
			// Animated alpha
			draw_set_alpha(item.alpha);
			
			// Draw the background
			draw_set_color(item.type == ui_enum_variants.primary ? ui_variable_col_primary_light : ui_variable_col_secondary_light);
			draw_rectangle(x1, y1, x2, y2, false);
			
			// Draw the notification rectangular symbol (for info purposes)
			draw_set_color(item.type == ui_enum_variants.primary ? ui_variable_col_primary : ui_variable_col_secondary);
			draw_rectangle(x1, y1, x1+5, y2, false);
			
			// Draw the text
			draw_set_color(item.type == ui_enum_variants.primary ? ui_variable_col_on_primary : ui_variable_col_on_secondary);
			ui_draw_text(mean(x1, x2), mean(y1, y2), item.text);
		}
	};
}