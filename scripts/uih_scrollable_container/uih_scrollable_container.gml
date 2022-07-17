/**
 * Get the logical UI component 
 *
 * @param {Struct} state Initial state to store in the component
 * @param {Struct} parent Parent layer. By default it is the root layer 
 * @param {Function} onRender Function called to render the component
 *
 * @return {Struct}
 */
function uih_scrollable_container(state = undefined, parent = undefined, onRender = undefined) {
	return uih_create_component({
		state: state, 
		parent: parent,
		//skip_layer_checks: false,
		surface: true,
		onRender: onRender, 
		
		onLogicInit: function(elem) {
			var state = elem.state;
			
			state.scroll_x = variable_struct_exists(state, "scroll_x") ? state.scroll_x : 0;
			state.scroll_y = variable_struct_exists(state, "scroll_y") ? state.scroll_y : 0;
			
			/**
			 * Set the specified element as focused (if not already)
			 */
			elem.focus = method(elem, function(child) {
				var children = self.children;
				var topIdx = array_length(children) - 1;
			
				// Find the element to focus and move it on the top
				for (var i=topIdx; i>=0; i--) {
					var sortedChild = children[i];
					if (sortedChild != child || sortedChild.skip_layer_checks) continue;
					if (i == topIdx) return;
					array_push(children, child);
					array_delete(children, i, 1);
					break;
				}
			});
	
			/**
			 * Check if the specified element is the most higher (on top) element, that is intersecting the mouse
			 */
			elem.is_hovered = method(elem,  function(elem) {
				for (var i=array_length(self.children)-1; i>=0; i--) {
					var child = self.children[i];
					if (child.skip_layer_checks) continue;
					var childX = child.state.x;
					var childY = child.state.y;
					if (!point_in_rectangle(mouse_x, mouse_y, childX, childY, childX + child.state.width, childY + child.state.height)) continue;
					return child == elem;
				}
				return undefined;
			});
		}
	});
}