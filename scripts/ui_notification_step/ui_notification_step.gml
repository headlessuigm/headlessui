/**
 * Get the logical UI component 
 *
 * @param {Real} _x Component X coordinate
 * @param {Real} _y Component Y coordinate
 * @param {Real} _width Component width
 * @param {Real} _height Component height
 * @param {Struct} [_parent] Parent component
 *
 * @return {Struct}
 */
function UiNotificationStep(_x, _y, _width, _height, _parent = undefined) : UiBaseComponent(_x, _y, _width, _height, _parent) constructor {
	state.items = [];

	/** 
	 * Add a notification item into the list
	 *
	 * @param {String} text Notification message
	 * @param {String} type Kind of notification (primary/secondary)
	 * @param {String} [timer] Time in steps before removing the notification
	 */
	add_item = function(text, type = ui_enum_variants.primary, timer = 180) {
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
