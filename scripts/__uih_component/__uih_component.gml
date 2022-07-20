// Default root layer component
global.UIH_ROOT_COMPONENT = new UihLayer(undefined, {children: []});

/**
 * HEADLESS UI (Alpha)
 * Get the component struct. The component is initialized and cached if not already did
 *
 * @param {Struct} [state] Initial data to store into the component state
 * @param {Struct} [parent] Parent component
 *
 * @return {Struct}
 */
function UihComponent(
	state = {},
	parent = global.UIH_ROOT_COMPONENT
) constructor {
	self.state = state;
	self.parent = parent;
	
	/// Function called to enhance the initial state on component initialization
	self.on_init = undefined;
	
	/// Function called each tick to handle the component logic
	self.on_step = undefined;
	
	/// Function called each tick to render the component
	self.on_render = undefined;

	/// When this component should skip the parent layer hovering checks
	self.skip_layer_checks = false;
	
	/// If to disable the component surface
	self.disable_surface = false;
	
	/// If the component state has been updated. This is automatically reset after the re-rendering
	self.updated = false;
	
	/// List of the child components
	self.children = [];
	
	/// Internal surface reference
	self.surface = noone;
	
	// Enhance the state with default values
	if (!variable_struct_exists(self.state, "x")) self.state.x = 0;
	if (!variable_struct_exists(self.state, "y")) self.state.y = 0;
	if (!variable_struct_exists(self.state, "width")) self.state.width = 0;
	if (!variable_struct_exists(self.state, "height")) self.state.height= 0;
	if (!variable_struct_exists(self.state, "scroll_x")) self.state.scroll_x = 0;
	if (!variable_struct_exists(self.state, "scroll_y")) self.state.scroll_y = 0;
	if (!variable_struct_exists(self.state, "on_click")) self.state.on_click = function() {};
	
	show_debug_message(self.state);
			
	/**
	 * Update the element state, scheduling the element re-rendering. 
 	 * Note: The value change is sync, while the actual rendering is batched. 
 	 * Note: Re-rendering is scheduled only if the state has been actually been updated
	 *
	 * @param {Struct} [partialState] State keys to update
	 */
	self.set = function(partialState = {}) {
		var updated = false;
			
		var names = variable_struct_get_names(partialState);
		for (var i=0, l=array_length(names); i<l; i++) {
			var name = names[i];
			if (self.state[$ name] != partialState[$ name]) {
				self.state[$ name] = partialState[$ name];
				updated = true;
			}
		}
			
		self.updated = updated;
	};
			
	/**
	 * Execute the onClick element handler, if defined
	 */
	self.click = function() {
		self.state.on_click(self);
	};
			
	/**
	 * Remove this component from the parent sorted children
	 */
	self.remove = function() {
		var parentChildren = self.parent.children;
		var surface = self.surface;
				
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
	self.resize = function(width, height) {
		self.state.width = width;
		self.state.height = height;
			
		var surface = self.surface;
		if (surface_exists(surface)) {
			surface_resize(surface, width + 1, height + 1);
		}
		self.updated = true;
	};
		
	/**
	 * Get the X relative coordinate to the parent
	 *
	 * @return {Real}
	 */
	self.x_rel = function() {
		return self.state.x - self.parent.state.x;
	};
		 
	/**
	 * Get the Y relative coordinate to the parent
 	 * 
	 * @return {Real}
	 */
	self.y_rel = function() {
		return self.state.y - self.parent.state.y;
	};
	
	/**
	 * Add a component in the children list of this component
	 *
	 * @param {Struct} child Child component to add
	 */
	self.add_child = function(child) {
		child.parent = self;
		array_push(self.children, child);
	}
		
	// Store the new element into the parent children
	array_push(self.parent.children, self);
}