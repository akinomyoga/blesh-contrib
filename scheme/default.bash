# bash
# Copyright 2024, akinomyoga

# Default color scheme for ble.sh

function ble/contrib/scheme:default/initialize {
  ble-face -r region region_@ disabled overwrite_mode vbell vbell_@ syntax_@ \
   command_@ filename_@ varname_@ argument_@ prompt_status_line \
   cmdinfo_cd_cdpath auto_complete menu_filter_fixed menu_filter_input \
   menu_desc_default menu_desc_type menu_desc_quote
  return 0
}
