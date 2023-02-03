enum ui_enum_checkbox_status {
	idle,
	clicked,
	hover,
}

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
function UiCheckboxStep(_x, _y, _width, _height, _parent = undefined) : UiBaseComponent(_x, _y, _width, _height, _parent) constructor {
	// Set the default checkbox status
	with (state) {
		status = ui_enum_checkbox_status.idle;
		type = ui_enum_variants.primary;
		checked = false;
		click_type = ui_enum_click_type.released;
		click_button = mb_left;
	}
		
	step = function() {
		var status = state.status;
		var click_type = state.click_type;
		var click_button = state.click_button;

		if (status != ui_enum_checkbox_status.idle && mouse_check_button_released(click_button)) {
			set({ status: ui_enum_checkbox_status.idle });
			
			if (click_type == ui_enum_click_type.released && parent.is_hovered(self)) {
				click();
			}
		} else if (parent.is_hovered(self)) {
			if (mouse_check_button_pressed(click_button)) {
				set({ status: ui_enum_checkbox_status.clicked, checked: !state.checked });
				
				if (click_type == ui_enum_click_type.pressed) {
					click();	
				}
			} else if (status == ui_enum_checkbox_status.idle) {
				set({ status: ui_enum_checkbox_status.hover });
			}
		} else if (status == ui_enum_checkbox_status.hover) {
			set({ status: ui_enum_checkbox_status.idle });
		}
	};
}
