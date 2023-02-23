function scr_story_select_arrows(showcase) {
	var w = 200;
	var h = 30;
	var xx = showcase.x - round(w/2);
	var yy = showcase.y - round(h/2);
	
	var selectArrows = new UiSelectArrows(xx, yy, w, h);
	selectArrows.set_items([{ key: "item0", label: "Item 0" }, { key: "item1", label: "Item 1" }, { key: "item2", label: "Item 2"}, { key: "item3", label: "Item 3" } ]);

	var selectArrowsBtnPrev = new UiButton(0, 0, 30, 30, selectArrows);
	var selectArrowsBtnNext = new UiButton(170, 0, 30, 30, selectArrows);

	with (selectArrowsBtnPrev.state) {
		text = "<";
		if (!selectArrows.state.wrap_selection) {
			enabled = false;
		}
	
		on_click = method({ select: selectArrows, prevBtn: selectArrowsBtnPrev, nextBtn: selectArrowsBtnNext }, function() {
			var select = self.select;
			select.previous();
		
			if (!select.state.wrap_selection && !self.nextBtn.state.enabled) {
				with (self.nextBtn) {
					set({ enabled: true });
				}
			}
		
			if (!select.state.index && !select.state.wrap_selection) {
				with (self.prevBtn) {
					set({ enabled: false });
				}
			}
		});
	}
	
	with (selectArrowsBtnNext.state) {
		text = ">";
		on_click = method({ select: selectArrows, prevBtn: selectArrowsBtnPrev, nextBtn: selectArrowsBtnNext }, function() {
			var select = self.select;
			select.next();
		
			if (!select.state.wrap_selection && !self.prevBtn.state.enabled) {
				with (self.prevBtn) {
					set({ enabled: true });
				}
			}
		
			if (select.state.index == array_length(select.state.items) - 1 && !select.state.wrap_selection) {
				with (self.nextBtn) {
					set({ enabled: false });
				}
			}
		});
	}
	
	return [
		selectArrows,
		selectArrowsBtnPrev,
		selectArrowsBtnNext
	];
}