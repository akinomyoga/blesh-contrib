# Scheme Inspired by Rosé Pine Moon
# https://rosepinetheme.com/palette/ingredients/#rose-pine-moon
# Based on Catppuccin Mocha theme for ble.sh
# https://github.com/catppuccin/catppuccin
# initial idea/work by @abhijeeth-babu
# https://github.com/akinomyoga/ble.sh/discussions/411#discussioncomment-10088978

ble-import contrib/scheme/catppuccin_mocha

function ble/contrib/scheme:rosepine_moon/initialize {
  ble/contrib/scheme:catppuccin_mocha/initialize

  ble/color/alias/set basic0   '#2a273f' # Surface
  ble/color/alias/set basic1   '#eb6f92' # Love
  ble/color/alias/set basic2   '#3e8fb0' # Pine
  ble/color/alias/set basic3   '#f6c177' # Gold
  ble/color/alias/set basic4   '#c4a7e7' # Iris
  ble/color/alias/set cursor   '#e0def4' # Text
  ble/color/alias/set custom1  '#232136' # Base
  ble/color/alias/set custom2  '#f6c177' # Gold
  ble/color/alias/set custom3  '#9ccfd8' # Foam
  ble/color/alias/set custom4  '#c4a7e7' # Iris
  ble/color/alias/set custom5  '#ea9a97' # Rose
  ble/color/alias/set custom6  '#9ccfd8' # Foam
  ble/color/alias/set custom7  '#908caa' # Subtle
  ble/color/alias/set custom8  '#c4a7e7' # Iris
  ble/color/alias/set custom9  '#393552' # Overlay
  ble/color/alias/set custom10 '#6e6a86' # Muted

  ble-face -s auto_complete 'fg=%custom10,italic'
}
