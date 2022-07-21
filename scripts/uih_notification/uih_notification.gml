/**
 * Get the logical UI component 
 *
 * @param {Struct} _state Initial state to store in the component
 * @param {Struct} _parent Parent layer. By default it is the root layer
 *
 * @return {Struct}
 */
function UihNotification(_state = undefined, _parent = undefined) : UihComponent(_state, _parent) constructor {
	state.items = [];

	/** 
	 * Add a notification item into the list
	 *
	 * @param {String} text Notification message
	 * @param {String} type Kind of notification (primary/secondary)
	 * @param {String} [timer] Time in steps before removing the notification
	 */
	add_item = function(text, type = "primary", timer = 180) {
		array_push(state.items, { 
			text: text,
			type: type,
			timer: timer,
			alpha: 0,
			created: true,
			deleted: false
		});
		updated = true;
	};
		
	step = function() {
		// Handle the items lifespan
		var items = state.items;	

		for (var i=array_length(items)-1; i>=0; i--) {
			var item = items[i];
	
			if (item.created) {
				if (item.alpha < 1) {
					item.alpha += .04;
				} else {
					item.created = false;
				}
				updated = true;
				continue;	
			}
	
			if (item.deleted) {
				if (item.alpha > 0) {
					item.alpha -= .03;
				} else {
					array_delete(items, i, 1);
				}
				updated = true;
				continue;	
			}
	
			if (item.timer > 0) {
				item.timer--;	
			} else {
				item.deleted = true;			
			}
		}	
	};
}
