// Default root layer component
global.UIH_ROOT_COMPONENT = uih_layer("__UIH_ROOT_ELEMENT__", {}, { children: {}, sortedChildren: [] });

/**
 * Get the component struct. The component is initialized and cached if not already did
 *
 * @param {Struct} params Compoment params
 * @param {String} params.uid Component unique ID
 * @param {Struct} [params.state] Initial data to store into the component state
 * @param {Struct} [params.parent] Parent component
 * @param {Function} [params.onLogicInit] Function called to enhance the initial state on component initialization
 * @param {Function} [params.onRenderInit] Function called to enhance the initial state after the component initialization
 * @param {Bool} [params.skipLayerChecks] When to skip the parent layer children (eg. to avoid being hovered)
 * @params {Bool} [params.surface] If to enable the component surface (true by default)
 *
 * @return {Struct}
 */
function __uih_use_elem(params) {
	var uid = params.uid;
	var state = variable_struct_exists(params, "state") && params.state ? params.state : {};
	var parentComp = variable_struct_exists(params, "parent") && params.parent  ? params.parent : global.UIH_ROOT_COMPONENT;
	var onLogicInit = variable_struct_exists(params, "onLogicInit") && params.onLogicInit ? params.onLogicInit : undefined;
	var onRenderInit = variable_struct_exists(params, "onRenderInit") && params.onRenderInit ? params.onRenderInit : undefined;
	var skipLayerChecks = variable_struct_exists(params, "skipLayerChecks") && params.skipLayerChecks ? params.skipLayerChecks : false;
	var surface = variable_struct_exists(params, "surface") ? params.surface : true;
	
	var parentChildren = parentComp.children;
	
	if (!variable_struct_exists(parentChildren, uid)) {
		var elem = { 
			id: uid,
			state: params.state,
			updated: false,
			parent: parentComp,
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
		
		// Call the state initializers method (if provided)
		if (surface) elem.surface = noone;
		if (onLogicInit) onLogicInit(elem);		
		if (onRenderInit) onRenderInit(elem);
		
		// Store the new element into the parent children
		variable_struct_set(parentChildren, uid, elem);
		array_push(parentComp.sortedChildren, elem);
	}
	
	return parentChildren[$ uid];
}