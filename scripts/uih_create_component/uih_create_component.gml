// Default root layer component
global.UIH_ROOT_COMPONENT = uih_layer(undefined, { children: [] });

/**
 * HEADLESS UI v0.1
 * Get the component struct. The component is initialized and cached if not already did
 *
 * @param {Struct} params Compoment params
 * @param {Struct} [params.state] Initial data to store into the component state
 * @param {Struct} [params.parent] Parent component
 * @param {Function} [params.onLogicInit] Function called to enhance the initial state on component initialization
 * @param {Function} [params.onStep] Function called each tick to handle the component logic
 * @param {Function} [params.onRender] Function called each tick to render the component
 * @param {Bool} [params.skipLayerChecks] When to skip the parent layer children (eg. to avoid being hovered)
 * @params {Bool} [params.surface] If to enable the component surface (true by default)
 *
 * @return {Struct}
 */
function uih_create_component(params) {
	var state = variable_struct_exists(params, "state") && params.state ? params.state : {};
	var parentComp = variable_struct_exists(params, "parent") && params.parent  ? params.parent : global.UIH_ROOT_COMPONENT;
	var onLogicInit = variable_struct_exists(params, "onLogicInit") && params.onLogicInit ? params.onLogicInit : undefined;
	var onStep = variable_struct_exists(params, "onStep") && params.onStep ? params.onStep : undefined;
	var onRender = variable_struct_exists(params, "onRender") && params.onRender ? params.onRender : undefined;
	var skipLayerChecks = variable_struct_exists(params, "skipLayerChecks") && params.skipLayerChecks ? params.skipLayerChecks : false;
	var surface = variable_struct_exists(params, "surface") ? params.surface : true;
	
	var elem = { 
		state: params.state,
		updated: false,
		parent: parentComp,
		children: [],
		skipLayerChecks: skipLayerChecks,
		onStep: onStep,
		onRender: onRender,
		surface: surface ? noone : undefined,
			
		/**
		  * Update the element state, scheduling the element re-rendering. 
	  	  * The value change is sync, while the actual rendering is batched.
		  *
		  * @param {Struct} [partialState] State keys to update
		  */
		set: function(partialState = {}) {
			self.updated = true;
				
			var names = variable_struct_get_names(partialState);
			for (var i=0, l=array_length(names); i<l; i++) {
				var name = names[i];
				self.state[$ name] = partialState[$ name];
			}
		},
			
		/**
		  * Execute the onClick element handler, if defined
		  */
		click: function() {
			if (variable_struct_exists(self.state, "onClick")) {
				self.state.onClick(self);
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
		 */
		resize: function(width, height) {
			self.state.width = width;
			self.state.height = height;
			
			var surface = self.surface;
			if (surface_exists(surface)) {
				surface_resize(surface, width, height);
			}
		}
	};
		
	// Call the state initializer method (if provided)
	if (onLogicInit) onLogicInit(elem);
		
	// Store the new element into the parent children
	array_push(parentComp.children, elem);
	
	return elem;
}