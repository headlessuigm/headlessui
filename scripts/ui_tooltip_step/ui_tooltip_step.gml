/**
 * Get the logical UI component 
 *
 * @param {Real} _x Component X coordinate
 * @param {Real} _y Component Y coordinate
 * @param {Real} _width Component width
 * @param {Real} _height Component height
 * @param {Struct} [_parent] Parent component
 *
 * @return {Struct}
 */
function UiTooltipStep(_x, _y, _width, _height, _parent = undefined) : UiBaseComponent(_x, _y, _width, _height, _parent) constructor {
	skip_layer_checks = true;
	
	with (state) {
		linked_component = undefined;
		type = ui_enum_variants.secondary;
		text = undefined;
		text_sep = -1;
		text_max_width = -1;
		padding_horizontal = 10;
		padding_vertical = 5;
		offset_horizontal = 0;
		offset_vertical = 10;
		show_delay = 500;
		stay_within_gui = true;
		
		// Internal state variables
		__show_play = false;
		__show_timer = undefined;
	}
	
	/**
	 * Set the tooltip text, by also auto-resizing the component surface
	 * 
	 * @param {String} text
	 */
	set_text = function(text) {
		var text_sep = state.text_sep;
		var text_max_width = state.text_max_width;
		draw_set_font(ui_variable_font);
		resize(
			string_width_ext(text, text_sep, text_max_width) + state.padding_horizontal * 2,
			string_height_ext(text, text_sep, text_max_width) + state.padding_vertical * 2
		);
		state.text = text;
	}
	
	/** 
	 * Automatically set the tooltip coordinates based on the linked component position. 
	 * Before calling this function, ensures that the text has been set, so that the height has already been determinated
	 *
	 * If state.stay_within_gui is truthy, the position will be adjusted according to the component size to avoid going out of the gui
	 */
	move = function() {
		var linked_component = state.linked_component;
		if (!linked_component) {
			return;
		}
		
		var xx = linked_component.state.x - linked_component.state.width/2 + state.offset_horizontal;
		var yy = linked_component.state.y - state.offset_vertical - state.height;
		
		if (state.stay_within_gui) {
			xx = clamp(xx, 10, display_get_gui_width() - state.width - 10);
			yy = clamp(yy, 10, display_get_gui_height() - state.height - 10);
		}
		
		set({ x: xx, y: yy });
	}
	
	step = function() {
		var linked_component = state.linked_component;
		if (!linked_component) {
			return;
		}
		
		// Start the show/hide animation when hovering over the linked component
		if (!state.visible && !state.__show_play) {
			if (linked_component.parent.is_hovered(linked_component)) {
				set({ 
					__show_play: true,
					__show_timer: current_time
				});
			}
		} else {
			if (!linked_component.parent.is_hovered(linked_component)) {
				set({
					__show_play: false,
					visible: false
				});
			}
		}
		
		// Handle the show timer
		if (state.__show_play && current_time - state.__show_timer > state.show_delay) {
			set({
				__show_play: false,
				visible: true
			});
		}
	};
}