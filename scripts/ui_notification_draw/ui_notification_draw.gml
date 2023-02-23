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
function UiNotification(_x, _y, _width, _height, _parent = undefined) : UiNotificationStep(_x, _y, _width, _height, _parent) constructor {
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
			var h = string_height(item) + 10;
			var y1 = yOff;
			var y2 = yOff + h;
			yOff += h + 10;
			
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
			draw_text(round(mean(x1, x2)), round(mean(y1, y2)), item.text);
		}
	};
}