function Showcase() constructor {
	list_width = 200;
	width = oCtrl.gui_width - list_width;
	x = list_width + round(width/2);
	y = round(oCtrl.gui_height/2);
	current_story = undefined;
	
	/**
	 * Select another story to showcase
	 */
	select = function(story) {
		if (!is_undefined(current_story)) {
			for (var i=0, ilen=array_length(current_story); i<ilen; i++) {
				current_story[i].remove();
			}
		}
		
		current_story = story(self);
	}
	
	select(scr_story_label);
}