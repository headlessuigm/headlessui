/**
 * Get the logical UI component 
 *
 * @param {String} id Component unique ID
 * @param {Struct} initialState Component initial state to store
 * @param {Struct} parent Parent layer. By default it is the root layer 
 * @param {Function} onInit Function called to enhance the initial state on component initialization
 *
 * @return {Struct}
 */
function uih_notification(id, initialState, parent = undefined, onInit = undefined) {
	var elem = __uih_use_elem(id, initialState, parent, method({ onInit: onInit}, function(elem) {
		if (self.onInit != undefined) self.onInit(elem);
		
		var state = elem.state;
		elem.surface = noone;
		state.items = [];
		
		/** 
		 * Add a notification item into the list
		 *
		 * @param {String} text Notification message
		 * @param {String} type Kind of notification (primary/secondary)
		 * @param {String} [timer] Time in steps before removing the notification
		 */
		elem.add_item = method({ elem: elem }, function(text, type = "primary", timer = 180) {
			array_push(self.elem.state.items, { 
				text: text,
				type: type,
				timer: timer,
				alpha: 0,
				created: true,
				deleted: false
			});
			self.elem.set();
		});
	}));
	
	// Handle the items lifespan
	var items = elem.state.items;	
	
	for (var i=array_length(items)-1; i>=0; i--) {
		var item = items[i];
		
		if (item.created) {
			if (item.alpha < 1) {
				item.alpha += .04;
			} else {
				item.created = false;
			}
			elem.set();
			continue;	
		}
		
		if (item.deleted) {
			if (item.alpha > 0) {
				item.alpha -= .03;
			} else {
				array_delete(items, i, 1);
			}
			elem.set();
			continue;	
		}
		
		if (item.timer > 0) {
			item.timer--;	
		} else {
			item.deleted = true;			
		}
	}	
	
	return elem;
}