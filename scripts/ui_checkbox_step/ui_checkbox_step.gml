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
	name = "Checkbox";
	
	// Set the default checkbox status
	with (state) {
		status = ui_enum_checkbox_status.idle;
		type = ui_enum_variants.primary;
		checked = false;
	}
	
	on_mouse_press = function() {
		set({ status: ui_enum_checkbox_status.clicked });
	};
	
	on_mouse_enter = function() {
		set({ status: ui_enum_checkbox_status.hover });	
	}
	
	on_mouse_leave = function() {
		if (state.status != ui_enum_checkbox_status.hover ) return;
		set({ status: ui_enum_checkbox_status.idle });
	}
	
	on_click = function() {
		set({ checked: !state.checked });
	};
	
	step = function() {
		if (mouse_check_button_released(mb_any)) {
			set({ status: !hovered ? ui_enum_checkbox_status.idle : ui_enum_checkbox_status.hover });
		}
	}
}
