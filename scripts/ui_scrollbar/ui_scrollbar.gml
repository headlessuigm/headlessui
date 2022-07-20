/**
 * Get the render UI component 
 *
 * @param {Struct} state Component initial state to store
 * @param {Struct} parent Parent layer. By default it is the root layer 
 *
 * @return {Struct}
 */
function UiScrollbar(state, parent = undefined) : UihScrollbar(state, parent) constructor {	
	self.on_render = function() {		
		// Draw the track
		var bgcolor = self.state.type == ui_enum_variants.primary ? ui_variable_col_primary_dark : ui_variable_col_secondary_dark;
		
		draw_set_color(bgcolor);
		draw_rectangle(0, 0, self.state.width, self.state.height, false);
		
		// Draw the thumb
		var thumb_x1, thumb_y1, thumb_x2, thumb_y2;
		if (self.state.direction == uih_enum_scrollbar_direction.vertical) {
			thumb_x1 = 0;
			thumb_y1 = (self.state.height - self.state.thumb_size) * self.state.value;
			thumb_x2 = self.state.width;
			thumb_y2 = thumb_y1 + self.state.thumb_size;
		} else {
			thumb_x1 = (self.state.width - self.state.thumb_size) * self.state.value;
			thumb_y1 = 0;
			thumb_x2 = thumb_x1 + self.state.thumb_size;
			thumb_y2 = self.state.height;
		}
			
		var thumb_color;
		switch (self.state.status) {
			case uih_enum_scrollbar_status.dragging:
				thumb_color = self.state.type == ui_enum_variants.primary ? ui_variable_col_primary_light : ui_variable_col_secondary_light;
				break;
			default: 
				thumb_color = self.state.type == ui_enum_variants.primary ? ui_variable_col_primary : ui_variable_col_primary;
		}
		
		draw_set_color(thumb_color);
		draw_rectangle(thumb_x1, thumb_y1, thumb_x2, thumb_y2, false);
	};
}