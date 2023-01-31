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
function UihSelectArrows(_x, _y, _width, _height, _parent = undefined) : UihLayer(_x, _y, _width, _height, _parent) constructor {
	skip_layer_checks = true;
	disable_surface = false;
	
	with (state) {
		type = ui_enum_variants.primary;
		items = [];
		index = 0;
		selected = undefined;
		
		/**
		 * When reaching the final selected item, clicking on the prev/next arrow button will show the opposite item in the list (eg. 5 -> 0).
		 */
		wrap_selection = false;
	}
	
	/**
	 * Set the items
	 *
	 * @param {Array} items
	 */
	set_items = function(items) {
		set({
			items: items,
			index: 0,
			selected: items[0]
		});		
	}
	
	/**
	 * Select the next item
	 */
	next = function() {
		var items = state.items;
		
		if (state.index < array_length(items)-1) {
			state.index++;
		} else {
			state.index = 0;
		}
		
		state.selected = items[state.index];
		update();
		
		if (variable_struct_exists(state, "on_change")) {
			state.on_change(self, state.selected);
		}
	}
	
	/**
	 * Select the previous item
	 */
	previous = function() {
		var items = state.items;
		
		if (state.index > 0) {
			state.index--;
		} else {
			state.index = array_length(items) - 1;
		}
		
		state.selected = items[state.index];
		update();
		
		if (variable_struct_exists(state, "on_change")) {
			state.on_change(self, state.selected);
		}
	}
}