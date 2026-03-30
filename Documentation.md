# Orion UI Library

UI library in Luau for Roblox executors (CoreGui). Supports multiple
tabs, automatic scrolling, and TweenService animations.

------------------------------------------------------------------------

## Installation

``` lua
local Orion = loadstring(game:HttpGet("https://raw.githubusercontent.com/BaHost01/CStudios-Scripts-UILib/refs/heads/main/UILibrary/Source.lua"))()
```

> The library uses `game.CoreGui` as parent --- compatible with standard
> executors (Delta, Hydrogen, etc.).

------------------------------------------------------------------------

## Creating the Window

``` lua
local Window = Orion:CreateOrion("My Script")
```

  Parameter   Type     Default   Description
  ----------- -------- --------- ---------------------------
  orionName   string   "Orion"   Title displayed in header

**Returns:** `SectionHandler`

------------------------------------------------------------------------

## SectionHandler

### `SectionHandler:CreateSection(secName)`

Creates a new tab in the sidebar.

``` lua
local Tab = Window:CreateSection("Combat")
```

**Returns:** `ElementHandler`

------------------------------------------------------------------------

### `SectionHandler:Notify(title, message, duration)`

Displays a toast notification in the top-right corner with slide-in
animation and auto-dismiss.

``` lua
Window:Notify("Success", "Script loaded successfully!", 4)
```

  Parameter   Type     Default          Description
  ----------- -------- ---------------- ---------------------
  title       string   "Notification"   Toast title (bold)
  message     string   ""               Toast body
  duration    number   3                Duration in seconds

------------------------------------------------------------------------

## ElementHandler

All elements are added to the tab returned by `CreateSection`.

------------------------------------------------------------------------

### `TextLabel(labelText)`

Simple text label for section titles.

------------------------------------------------------------------------

### `TextButton(buttonText, buttonInfo, callback)`

Button with descriptive text.

------------------------------------------------------------------------

### `Toggle(togInfo, callback)`

On/off toggle with animation.

------------------------------------------------------------------------

### `Slider(sliderin, minvalue, maxvalue, callback)`

Draggable slider.

------------------------------------------------------------------------

### `KeyBind(keInfo, defaultKey, callback)`

Keyboard key capture button.

------------------------------------------------------------------------

### `TextBox(textInfo, placeHolderText, callback)`

Text input field.

------------------------------------------------------------------------

### `Dropdown(dInfo, list, callback)`

Dropdown selection menu.

------------------------------------------------------------------------

### `Checkbox(cbInfo, defaultState, callback)`

Checkbox with ✓ icon.

------------------------------------------------------------------------

### `NumericInput(numInfo, default, minVal, maxVal, step, callback)`

Numeric input with + and - buttons.

------------------------------------------------------------------------

### `ColorPicker(cpInfo, defaultColor, callback)`

RGB color picker with sliders and live preview.

------------------------------------------------------------------------

## Notes

-   Window is draggable via header.
-   × button minimizes/restores UI.
-   Elements auto-scroll.
-   Uses `task.delay` / `task.wait`.
-   Uses `game.CoreGui` to persist after respawn.
