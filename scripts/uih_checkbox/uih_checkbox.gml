enum uih_enum_checkbox_status {
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
function UihCheckbox(_x, _y, _width, _height, _parent = undefined) : UihComponent(_x, _y, _width, _height, _parent) constructor {
	// Set the default checkbox status
	with (state) {
		status = uih_enum_checkbox_status.idle;
		type = ui_enum_variants.primary;
		checked = false;
	}
		
	step = function() {
		var status = state.status;

		if (status != uih_enum_checkbox_status.idle && mouse_check_button_released(mb_any)) {
			set({ status: uih_enum_checkbox_status.idle });
		} else if (parent.is_hovered(self)) {
			if (mouse_check_button_pressed(mb_any)) {
				set({ status: uih_enum_checkbox_status.clicked, checked: !state.checked });
				click();
			} else if (status == uih_enum_checkbox_status.idle) {
				set({ status: uih_enum_checkbox_status.hover });
			}
		} else if (status == uih_enum_checkbox_status.hover) {
			set({ status: uih_enum_checkbox_status.idle });
		}
	};
}
