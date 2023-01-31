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
function UiSelectArrows(_x, _y, _width, _height, _parent = undefined) : UihSelectArrows(_x, _y, _width, _height, _parent) constructor {	
	draw = function() {
		var selected = state.selected;
		if (!selected) return;
		var index = state.index;
		var count = array_length(state.items);
		var type = state.type;
		
		draw_set_alpha(1);
		draw_set_halign(fa_center); 
		draw_set_valign(fa_middle); 
		draw_set_font(ui_variable_font);
		draw_set_color(type == ui_enum_variants.primary ? ui_variable_col_primary_dark: ui_variable_col_secondary_dark);
		draw_rectangle(0, 0, state.width, state.height, false)
		draw_set_color(type == ui_enum_variants.primary ? ui_variable_col_on_primary : ui_variable_col_on_secondary);
		draw_text(round(state.width/2), round(state.height/2), selected.label);
	};
}
