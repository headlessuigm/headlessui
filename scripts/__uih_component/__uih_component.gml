// Default root layer component
global.UIH_ROOT_COMPONENT = new UihLayer({ x: 0, y: 0, width: room_width, height: room_height }, { 
	children: [],
	state: {
		scroll_x: 0,
		scroll_y: 0,
	},
	x_abs: function() {
		return 0;
	},
	y_abs: function() {
		return 0;
	},
	trigger_update: function() {},
});

/**
 * HEADLESS UI (Alpha)
 * Get the component struct
 *
 * @param {Struct} [state] Initial data to store into the component state
 * @param {Struct} [parent] Parent component
 *
 * @return {Struct}
 */
function UihComponent(
	_state = {},
	_parent = global.UIH_ROOT_COMPONENT
) constructor {
	state = _state;
	parent = _parent;
	
	/// Function called each tick to handle the component logic
	step = undefined;
	
	/// Function called each tick to render the component
	draw = undefined;

	/// When this component should skip the parent layer hovering checks
	skip_layer_checks = false;
	
	/// If to disable the component surface
	disable_surface = false;
	
	/// If the component state has been updated. This is automatically reset after the re-rendering
	updated = false;
	
	/// List of the child components
	children = [];
	
	/// Internal surface reference
	surface = noone;
	
	// Enhance the state with default values
	if (!variable_struct_exists(state, "x")) state.x = 0;
	if (!variable_struct_exists(state, "y")) state.y = 0;
	if (!variable_struct_exists(state, "width")) state.width = 0;
	if (!variable_struct_exists(state, "height")) state.height= 0;
	if (!variable_struct_exists(state, "scroll_x")) state.scroll_x = 0;
	if (!variable_struct_exists(state, "scroll_y")) state.scroll_y = 0;
	if (!variable_struct_exists(state, "on_click")) state.on_click = function() {};
			
	/**
	 * Update the element state, scheduling the element re-rendering. 
 	 * Note: The value change is sync, while the actual rendering is batched. 
 	 * Note: Re-rendering is scheduled only if the state has been actually been updated
	 *
	 * @param {Struct} [partialState] State keys to update
	 */
	set = function(partialState = {}) {
		var names = variable_struct_get_names(partialState);
		for (var i=0, l=array_length(names); i<l; i++) {
			var name = names[i];
			if (state[$ name] != partialState[$ name]) {
				state[$ name] = partialState[$ name];
				trigger_update();
			}
		}
	};
	
	trigger_update = function() {
		updated = true;
		parent.trigger_update();
	}
			
	/**
	 * Execute the onClick element handler, if defined
	 */
	click = function() {
		state.on_click(self);
	};
			
	/**
	 * Remove this component from the parent sorted children
	 */
	remove = function() {
		var parentChildren = parent.children;
				
		// Find the parent sorted child to remove
		for (var i=0, len=array_length(parentChildren); i<len; i++) {
			if (parentChildren[i] == self) {
				array_delete(parentChildren, i, 1);
				break;
			}
		}
			
		// Destroy the surface
		if (surface_exists(surface)) {
			surface_free(surface);
		}
	};
		
	/**
	 * Resize the component surface
	 *
	 * @param {Real} width
	 * @param {Real} height
	 */
	resize = function(width, height) {
		state.width = width;
		state.height = height;
			
		if (surface_exists(surface)) {
			surface_resize(surface, width + 1, height + 1);
		}

		updated = true;
	};
		
	/**
	 * Get the X relative coordinate to the parent
	 *
	 * @return {Real}
	 */
	x_abs = function() {
		return parent.x_abs() + state.x - parent.state.scroll_x;
	};
		 
	/**
	 * Get the Y relative coordinate to the parent
 	 * 
	 * @return {Real}
	 */
	y_abs = function() {
		return parent.y_abs() + state.y - parent.state.scroll_y;
	};
	
	/**
	 * Add a component in the children list of this component
	 *
	 * @param {Struct} child Child component to add
	 */
	add_child = function(child) {
		// Remove the component from the old parent children list
		var old_parent_children = child.parent.children;
		for (var i=0, len=array_length(old_parent_children); i<len; i++) {
			if (child == old_parent_children[i]) {
				array_delete(old_parent_children, i, 1);
				break;
			}
		}
				
		// Push the component in the new parent children list
		child.parent = self;
		array_push(children, child);
	};
		
	// Store the new element into the parent children
	array_push(parent.children, self);
}
