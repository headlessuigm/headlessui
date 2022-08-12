---
sidebar_position: 2
---

# Quick start

To add Headless UI to your game, let's download the latest stable package from the [Github releases page](https://github.com/manuel-di-iorio/gmheadlessui/releases).

Open your project in GameMaker Studio, then extract the downloaded zip and drag the file `headlessui.yymps` onto your GameMaker Studio window.


![QuickStart Import Dialog](/img/quickstart-import-dialog.png)

Press Yes to import the Asset package.

![QuickStart Import Dialog](/img/quickstart-import-window.png)

In this window, click _Add all_ and finally you can click **Import**.

--- 

In order to add your first UI component to your game, in the _Create_ event of your controller object, add:


```js
var button = new UiButton(10, 10, 200, 50); 
with (button.state) {
    text = "My Button";
    on_click = function() {
        show_message("Button clicked!");
    }
}
```

In the _Step_ event, add:

```js
ui_step();
```

And finally in the _Draw GUI_ event, add:

```js
ui_draw();
```

Congratulations! You have added a full featured button to your game.

Please proceed with the next section to understand how the _Components_ work.
