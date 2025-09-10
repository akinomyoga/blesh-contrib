# Scheme Inspired by Rosé Pine Dawn
# https://rosepinetheme.com/palette/ingredients/#rose-pine-dawn
# Based on Catppuccin Mocha theme for ble.sh
# https://github.com/catppuccin/catppuccin
# initial idea/work by @abhijeeth-babu
# https://github.com/akinomyoga/ble.sh/discussions/411#discussioncomment-10088978

ble-import contrib/scheme/catppuccin_mocha

function ble/contrib/scheme:rosepine_dawn/initialize {
  ble/contrib/scheme:catppuccin_mocha/initialize

  ble/color/alias/set basic0   '#fffaf3' # Surface
  ble/color/alias/set basic1   '#b4637a' # Love
  ble/color/alias/set basic2   '#286983' # Pine
  ble/color/alias/set basic3   '#ea9d34' # Gold
  ble/color/alias/set basic4   '#907aa9' # Iris
  ble/color/alias/set cursor   '#575279' # Text
  ble/color/alias/set custom1  '#faf4ed' # Base
  ble/color/alias/set custom2  '#ea9d34' # Gold
  ble/color/alias/set custom3  '#56949f' # Foam
  ble/color/alias/set custom4  '#907aa9' # Iris
  ble/color/alias/set custom5  '#d7827e' # Rose
  ble/color/alias/set custom6  '#56949f' # Foam
  ble/color/alias/set custom7  '#797593' # Subtle
  ble/color/alias/set custom8  '#907aa9' # Iris
  ble/color/alias/set custom9  '#f2e9e1' # Overlay
  ble/color/alias/set custom10 '#9893a5' # Muted

  ble-face -s auto_complete 'fg=%custom10,italic'
}
