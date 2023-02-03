---
sidebar_position: 1
sidebar_label: 'Base'
---

# Base component (UiBaseComponent)

This is the base internal component that all other components extend. It defines variables and methods that are widely used. 

It is not meant for direct usage but this page acts as reference.

### Variables

| Variable          | Description                                                      | Type           | Default                       |
|-------------------|------------------------------------------------------------------|----------------| ------------------------------|
| parent            | Parent component                                                 | Real           | `global.ui_root_component`   |
| step              | Function called each tick to handle the component logic          | Function       |                               |
| draw              | Function called each tick to render the component                | Function       |                               |
| skip_layer_checks | When this component should skip the parent layer hovering checks | Bool           | `false`                       |
| disable_surface   | If to disable the component surface                              | Bool           | `false`                       |
| children          | List of the children components                                  | Array<Struct\> | `[]`                          |
| state             | Component state                                                  | Struct         | [See below](#state-reference) |

### State reference

| Variable | Description               | Type     | Default         |
|----------|---------------------------|----------|-----------------|
| x        | Component X               | Real     |                 |
| y        | Component Y               | Real     |                 |
| width    | Component width           | Real     |                 |
| height   | Component height          | Real     |                 |
| scroll_x | Current X scroll position | Real     | 0               |
| scroll_y | Current Y scroll position | Real     | 0               |
| on_click | Component state           | Function | `function() {}` |


### Methods

#### set(partial_state)

Updates the state and sets the component and its ancestors as updated

| Param         | Description               | Type   | Default     |
|---------------|---------------------------|--------|-------------|
| partial_state | State variables to update | Struct |             |

#### update()

Directly sets the component and its ancestors as updated. Useful when manually updating the state

#### click()

Executes the _on_click_ handler defined for this component. Syntax sugar for `state.on_click(self);`

#### remove()

Removes this component from the parent's children list and destroys the component surface

#### x_abs()

Returns the X absolute coordinate of the component, according to the X scroll position

#### y_abs()

Returns the X absolute coordinate of the component, according to the Y scroll position

#### resize(width, height)

Resizes the component surface

| Param    | Description   | Type   | Default     |
|----------|---------------|--------|-------------|
| width    | New width     | Real   |             |
| height   | New height    | Real   |             |

#### add_child(component)

Manually adds a component to the children list

| Param         | Description               | Type   | Default     |
|---------------|---------------------------|--------|-------------|
| component     | Child component to add    | Struct |             |

#### watch(propName, callback)

Execute the specified callback when a state value has been changed. 
Returns the watcher ID that can be used with the `unwatch` method.

Note: watchers are currently only executed when using the set() method.

| Param         | Description               | Type     | Default     |
|---------------|---------------------------|----------|-------------|
| propName      | Property to watch         | String   |             |
| callback      | Callback to execute       | Function |             |

#### unwatch([prop_name], [watcherid])

Remove a watcher for the specified prop name. You can also pass undefined to remove all the watchers related to that prop. Also the prop name can be undefined if you want to remove the watchers of any prop of this component.

| Param         | Description               | Type   | Default     |
|---------------|---------------------------|--------|-------------|
| propName      | Specified property        | String |             |
| watcherId     | Watcher callback to unset | Real   |             |

---

### Globals

Global variables defined in the script

| Variable   | Description                         | Type | Default                  |
|------------|-------------------------------------|------|--------------------------|
| ui_mouse_x | GUI Mouse X. Updated from ui_step() | Real | device_mouse_x_to_gui(0) |
| ui_mouse_y | GUI Mouse Y. Updated from ui_step() | Real | device_mouse_y_to_gui(0) |
