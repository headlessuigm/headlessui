---
sidebar_position: 4
---

# Notification

This component displays a list of notifications that are automatically removed in a short time, useful e.g. to notify the player of a in-game event. 

### Example

```js
var notif = new UiNotification(0, 0, 300, 300);
```

### State reference

| Variable | Description                                                         | Type             | Default  |
|----------|---------------------------------------------------------------------|------------------|----------|
| items    | List of currently displayed items. This is used internally          | Array<Struct\>   | `[]`     |


### Methods

#### add_item(text, type, timer)

Add a notification item into the list

| Param | Description                                    | Type   | Default                    |
|-------|------------------------------------------------|--------|----------------------------|
| text  | Notification message                           | String |                            |
| type  | Kind of notification                           | Real   | `ui_enum_variants.primary` |
| timer | Time in steps before removing the notification | Real   | `180`                      |
