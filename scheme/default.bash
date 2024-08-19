# bash
# Copyright 2024, akinomyoga

# Default color scheme for ble.sh

function ble/contrib/scheme:default/initialize {
  ble-face -r region region_@
  ble-face -r disabled
  ble-face -r overwrite_mode
  ble-face -r vbell vbell_@
  ble-face -r syntax_@
  ble-face -r command_@
  ble-face -r filename_@
  ble-face -r varname_@
  ble-face -r argument_@
  ble-face -r prompt_status_line
  ble-face -r cmdinfo_cd_cdpath
  ble-face -r auto_complete
  ble-face -r menu_filter_fixed
  ble-face -r menu_filter_input
  ble-face -r menu_desc_default
  ble-face -r menu_desc_type
  ble-face -r menu_desc_quote
  return 0
}
