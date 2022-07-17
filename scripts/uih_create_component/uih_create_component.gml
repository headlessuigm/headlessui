// Default root layer component
global.UIH_ROOT_COMPONENT = uih_layer(undefined, { children: [] });

/**
 * HEADLESS UI v0.1
 * Get the component struct. The component is initialized and cached if not already did
 *
 * @param {Struct} params Compoment params
 * @param {Struct} [params.state] Initial data to store into the component state
 * @param {Struct} [params.parent] Parent component
 * @param {Function} [params.on_init] Function called to enhance the initial state on component initialization
 * @param {Function} [params.on_step] Function called each tick to handle the component logic
 * @param {Function} [params.on_render] Function called each tick to render the component
 * @param {Bool} [params.skip_layer_checks] When to skip the parent layer children (eg. to avoid being hovered)
 * @params {Bool} [params.surface] If to enable the component surface (true by default)
 *
 * @return {Struct}
 */
function uih_create_component(params) {
	var state = variable_struct_exists(params, "state") && params.state ? params.state : {};
	var parentComp = variable_struct_exists(params, "parent") && params.parent  ? params.parent : global.UIH_ROOT_COMPONENT;
	var on_init = variable_struct_exists(params, "on_init") && params.on_init ? params.on_init : undefined;
	var on_step = variable_struct_exists(params, "on_step") && params.on_step ? params.on_step : undefined;
	var on_render = variable_struct_exists(params, "on_render") && params.on_render ? params.on_render : undefined;
	var skip_layer_checks = variable_struct_exists(params, "skip_layer_checks") && params.skip_layer_checks ? params.skip_layer_checks : false;
	var surface = variable_struct_exists(params, "surface") ? params.surface : true;
	
	var elem = { 
		state: params.state,
		updated: false,
		parent: parentComp,
		children: [],
		skip_layer_checks: skip_layer_checks,
		on_step: on_step,
		on_render: on_render,
		surface: surface ? noone : undefined,
			
		/**
		  * Update the element state, scheduling the element re-rendering. 
	  	  * Note: The value change is sync, while the actual rendering is batched.
		  * Note: Re-rendering is scheduled only if the state has been actually been updated
		  *
		  * @param {Struct} [partialState] State keys to update
		  */
		set: function(partialState = {}) {
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
		},
			
		/**
		  * Execute the onClick element handler, if defined
		  */
		click: function() {
			if (variable_struct_exists(self.state, "on_click")) {
				self.state.on_click(self);
			}
		},
			
		/**
	  	  * Remove this component from the parent sorted children
	 	  */
		remove: function() {
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
		},
		
		/**
		 * Resize the component surface
		 *
		 * @param {Real} width
		 * @param {Real} height
		 */
		resize: function(width, height) {
			self.state.width = width;
			self.state.height = height;
			
			var surface = self.surface;
			if (surface_exists(surface)) {
				surface_resize(surface, width + 1, height + 1);
			}
			self.updated = true;
		},
		
		/**
		 * Get the X relative coordinate to the parent
		 *
		 * @return {Real}
		 */
		 x_rel: function() {
			 return self.state.x - self.parent.state.x;
		 },
		 
		 /**
		 * Get the Y relative coordinate to the parent
		 *
		 * @return {Real}
		 */
		 y_rel: function() {
			 return self.state.y - self.parent.state.y;
		 }
	};
		
	// Call the state initializer method (if provided)
	if (on_init) {
		on_init(elem);
	}
		
	// Store the new element into the parent children
	array_push(parentComp.children, elem);
	
	return elem;
}