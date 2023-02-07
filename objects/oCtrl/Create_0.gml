if (display_aa > 12) {
	display_reset(8, false);
}

draw_debug = false;
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
showcase = new Showcase();

// Create the list scrollable area
// @todo Enable again the scrollbar when there will be at least 2 other components
var scrollbar_width = 15;
var list_actual_width = showcase.list_width - scrollbar_width;
var list_height = gui_height - 20;

//var scrollable_container = new UiScrollableContainer(0, 10, list_actual_width, list_height);
//var scrollbar_vertical = new UiScrollbar(list_actual_width, 10, scrollbar_width, list_height);

//with (scrollable_container.state) {
//	scrollable_height = 800;
//	on_change = method({ scrollbar_vertical: scrollbar_vertical }, function(el, scroll_direction, scroll_value) {
//		scrollbar_vertical.set({ value: scroll_value });
//	})
//}

//with (scrollbar_vertical.state) {
//	thumb_size = scrollable_container.state.height / scrollable_container.state.scrollable_height * list_height;
//	on_change = method({ scrollable_container: scrollable_container }, function(component, value) {
//		scrollable_container.set({ scroll_y: (scrollable_container.state.scrollable_height - scrollable_container.state.height) * value });
//	});
//}

// Create the selector buttons
var components_names = [
	"Label",
	"Button",
	"Checkbox",
	"Notification",
	"Slider",
	"Scrollbar",
	"Draggable",
	"Select with arrows",
	"Tooltip"
];
var components = [
	scr_story_label,
	scr_story_button,
	scr_story_checkbox,
	scr_story_notification,
	scr_story_slider,
	scr_story_scrollbar,
	scr_story_draggable,
	scr_story_select_arrows,
	scr_story_tooltip
];
var btn_width = list_actual_width - 20;
var components_count = array_length(components);
for (var i=0; i<components_count; i++) {
	var name = components_names[i];
	
	var button = new UiButton(10, 10 + /* @todo remove this 10px when the scrollbar will be renabled */ i * 40, btn_width, 30, /*scrollable_container*/);
	with (button.state) {
		text = components_names[i];
		on_click = method({ component: components[i] }, function() {
			oCtrl.showcase.select(component, oCtrl.showcase);
		});
	}
}

//scrollable_container.set({ scrollable_height: components_count * 40 });