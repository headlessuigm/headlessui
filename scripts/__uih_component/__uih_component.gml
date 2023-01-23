// Default root layer component
global.uih_root_component = new UihLayer(0, 0, room_width, room_height, { 
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
	update: function() {},
});

global.ui_mouse_x = device_mouse_x_to_gui(0);
global.ui_mouse_y = device_mouse_y_to_gui(0);

/**
 * HEADLESS UI v1.0.0
 * Get the component struct
 *
 * @param {Real} _x Component X coordinate
 * @param {Real} _y Component Y coordinate
 * @param {Real} _width Component width
 * @param {Real} _height Component height
 * @param {Struct} [_parent] Parent component
 *
 * @return {Struct}
 */
function UihComponent(_x, _y, _width, _height, _parent = global.uih_root_component) constructor {
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
	
	// Default state
	state = {
		x: _x,
		y: _y,
		width: _width,
		height: _height,
		scroll_x: 0,
		scroll_y: 0,
		on_click: function() {}
	};
	
	// Reactive watchers
	watcherId = 0;
	watchers = {};
			
	/**
	 * Update the element state, scheduling the element re-rendering. 
 	 * Note: The value change is sync, while the actual rendering is batched. 
 	 * Note: Re-rendering is scheduled only if the state has been actually been updated
	 *
	 * @param {Struct} [partialState] State keys to update
	 */
	set = function(partialState = {}) {
		var names = variable_struct_get_names(partialState);
		for (var i=0, ilen=array_length(names); i<ilen; i++) {
			var name = names[i];
			if (state[$ name] != partialState[$ name]) {
				var updatedValue = partialState[$ name];
				state[$ name] = partialState[$ name];
				update();
				
				// Execute the watchers related to this updated prop
				if (variable_struct_exists(watchers, name)) {
					var watcherCallbacks = watchers[$ name];
					var watcherCallbackNames = variable_struct_get_names(watcherCallbacks);
					
					for (var w=0, wlen=array_length(watcherCallbackNames); w<wlen; w++) {
						var watcherCallback = watcherCallbacks[$ watcherCallbackNames[w]];
						watcherCallback(self, updatedValue);
					}
				}
			}
		}
	};
	
	update = function() {
		updated = true;
		parent.update();
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
	
	/**
	 * Set a new parent component
	 *
	 * @param {Struct} newParent New parent component to set
	 */
	set_parent = function(newParent) {
		// Exit when setting again the same parent
		if (newParent == parent) {
			return;
		}
		
		// Find the parent sorted child to remove
		var parentChildren = parent.children;
		
		for (var i=0, len=array_length(parentChildren); i<len; i++) {
			if (parentChildren[i] == self) {
				array_delete(parentChildren, i, 1);
				break;
			}
		}

		// Push this component into the new parent children list
		parent = newParent;
		array_push(newParent.children, self);
	}
	
	/* Watcher API */
	
	/**
	 * Set a watcher on a state prop in order to execute a callback when the value has been changed
	 *
	 * @param {String} prop Prop name
	 * @param {Function} callback Function to execute when the prop value has been changed
	 *
	 * @return {Integer} Watcher ID. Pass this id to the unwatch method to remove a specific callback
	 */
	function watch(prop, callback) {
		if (!variable_struct_exists(watchers, prop)) {
			watchers[$ prop] = {};
		}
		var watcherCallbacks = watchers[$ prop];
		var wid = watcherId++;
		watcherCallbacks[$ wid] = callback;
		return wid;
	}
	
	/**
	 * Remove a watcher from this component
	 *
	 * @param {String|undefined} prop State prop name to watch for changes. If you don't pass this param, all watchers on this component will be removed
	 * @param {Real|undefined} wid. Watcher to remove. If you don't pass this param, all callbacks of this prop will be removed
	 */
	 function unwatch(prop = undefined, wid = undefined) {
		if (!prop) {
			watchers = {};
		}
		
		if (!variable_struct_exists(watchers, prop)) {
			return;
		}
		
		if (!wid) {
			watchers[$ prop] = {};
			return;
		}
		
		delete watchers[$ prop][$ wid];
	}
		
	// Store the new element into the parent children
	array_push(parent.children, self);
}
