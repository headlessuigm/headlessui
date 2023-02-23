function scr_story_scrollbar(showcase) {
	var components = [];
	var w = 200;
	var h = 200;
	var xx = showcase.x - round(w/2);
	var yy = showcase.y - round(h/2);
	
	var scrollable_container = new UiScrollableContainer(xx, yy, w, h);
	with (scrollable_container.state) {
		scrollable_width = 350;
		scrollable_height = 800;
	}
	
	for (var i = 0; i < 15; i++) {
		var button = new UiButton(0, i * 50, 190, 40, scrollable_container);
		with (button.state) {
			text = "Button " + string(i);
		}
		array_push(components, button);
	}

	var scrollbar_vertical = new UiScrollbar(xx+w, yy, 20, h);
	with (scrollbar_vertical.state) {
		type = ui_enum_variants.primary;
		direction = ui_enum_scrollbar_direction.vertical;
		thumb_size = scrollable_container.state.height / scrollable_container.state.scrollable_height * 200;
		on_change = method({ scrollable_container: scrollable_container }, function(component, value) {
			scrollable_container.set({ scroll_y: (scrollable_container.state.scrollable_height - scrollable_container.state.height) * value });
		});
	}

	var scrollbar_horizontal = new UiScrollbar(xx, yy+h, w, 20);
	with (scrollbar_horizontal.state) {
		type = ui_enum_variants.primary;
		direction = ui_enum_scrollbar_direction.horizontal;
		thumb_size = scrollable_container.state.width / scrollable_container.state.scrollable_width * 200;
		on_change = method({ scrollable_container: scrollable_container }, function(component, value) {
			scrollable_container.set({ scroll_x: (scrollable_container.state.scrollable_width - scrollable_container.state.width) * value });
		});
	}

	scrollable_container.set({
		on_change: method({ scrollbar_vertical: scrollbar_vertical, scrollbar_horizontal: scrollbar_horizontal }, function(el, scroll_direction, scroll_value) {
			if (scroll_direction == ui_enum_scroll_direction.vertical) {
				scrollbar_vertical.set({ value: scroll_value });
			} else {
				scrollbar_horizontal.set({ value: scroll_value });
			}
		}),
	});
	
	array_push(components, scrollable_container, scrollbar_vertical, scrollbar_horizontal);
	
	return components;
}