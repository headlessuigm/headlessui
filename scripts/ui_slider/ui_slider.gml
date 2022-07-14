/// @TODO

/**
 * Get the render UI component 
 *
 * @param {String} id Component unique ID
 * @param {Struct} state Component initial state to store
 * @param {Struct} parent Parent layer. By default it is the root layer 
 *
 * @return {Struct}
 */
//function ui_slider(id, state, parent = undefined) {	
//	return uih_slider(id, state, parent, function(elem) {
//		elem.state.render = function(state) {
//			var type = variable_struct_exists(state, "type") ? state.type : ui_enum_variants.primary;
		
//			// Draw the background
//			var bgcolor;
//			switch (state.status) {
//				case "clicked":
//					bgcolor = type == ui_enum_variants.primary ? ui_variable_col_primary_dark : ui_variable_col_secondary_dark;
//					break;
//				case "hover":
//					bgcolor = type == ui_enum_variants.primary ? ui_variable_col_primary_light : ui_variable_col_secondary_light;
//					break;
//				default: 
//					bgcolor = type == ui_enum_variants.primary ? ui_variable_col_primary : ui_variable_col_secondary;
//			}
		
//			draw_set_color(bgcolor);
//			draw_roundrect_ext(0, 0, state.width, state.height, 40, 40, false);
//		};
//	});
//}