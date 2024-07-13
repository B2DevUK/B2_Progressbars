# B2 Scripts Progress Bar Script (b2_progressbars)

This script provides a customizable progress bar UI for FiveM. The progress bar can display a message and fill over a specified duration with various color options. The script also disables player actions while the progress bar is active.

## Features
- Customizable progress bar with message and duration.
- Preset colors or custom hex color support.
- Disables player actions while the progress bar is active.

## Installation

1. Clone or download the repository.
2. Place the script folder in your FiveM resources directory.
3. Add the resource to your `server.cfg`:
   ```
   ensure b2_progressbars
   ```

## Usage

### Preset Colors

The following preset colors are available:

- `red` - #e74c3c
- `blue` - #3498db
- `orange` - #e67e22
- `teal` - #1abc9c
- `yellow` - #f1c40f
- `purple` - #9b59b6
- `green` - #2ecc71


## Exports

You can use the exported `ShowProgressBar` function in other scripts:

```lua
exports['b2_progressbars']:ShowProgressBar(message, duration, color)
```

- `message`: The text to display on the progress bar.
- `duration`: The duration of the progress bar in milliseconds.
- `color`: The color of the progress bar. Can be a preset color name or a hex color.

### Example

```lua
exports['progressbar']:ShowProgressBar("Repairing Vehicle", 10000, "red")
```

This will show a progress bar with the message "Repairing Vehicle", lasting for 10 seconds, and with a red color.

## Files

- `fxmanifest.lua`: Resource manifest for the script.
- `client.lua`: Client-side script for handling the progress bar and disabling player actions.
- `index.html`: HTML file for the progress bar UI, TailwindCSS and Vue.JS logic.

## License

This project is licensed under the MIT License.

---