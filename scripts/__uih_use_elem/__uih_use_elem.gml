// Default root layer component
global.UIH_ROOT_COMPONENT = uih_layer("__UIH_ROOT_ELEMENT__", {}, { children: {}, sortedChildren: [] });

/**
 * Get the component struct. The component is initialized and cached if not already did
 *
 * @param {String} id ID of the component
 * @param {Struct} [initialState] Initial data to store into the component state
 * @param {Struct} parent
 * @param {Function} [onInit] Function called to enhance the initial state on component initialization
 * @param {Bool} skipLayerChecks When to skip the parent layer children (eg. to avoid being hovered)
 *
 * @return {Struct}
 */
function __uih_use_elem(id, initialState = {}, parent = global.UIH_ROOT_COMPONENT, onInit = undefined, skipLayerChecks = false) {
	var parentChildren = parent.children;
	
	if (!variable_struct_exists(parentChildren, id)) {
		var elem = { 
			id: id,
			state: initialState,
			updated: false,
			parent: parent,
			children: {},
			sortedChildren: [],
			skipLayerChecks: skipLayerChecks,
			
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
			}
		};
		
		// Call the state initializer method (if provided)
		if (onInit != undefined) onInit(elem);
		
		// Store the new element into the parent children
		variable_struct_set(parentChildren, id, elem);
		array_push(parent.sortedChildren, elem);
	}
	
	return parentChildren[$ id];
}