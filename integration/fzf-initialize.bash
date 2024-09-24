# ble/contrib/integration/fzf-initialize.bash (C) 2020-2024, akinomyoga

# Usage: Please write the following lines in blerc
#
# ```bash
# _ble_contrib_fzf_base=/path/to/fzf-base-directory
# ble-import -d integration/fzf-initialize
# ```

ble-import contrib/integration/fzf.common
ble/contrib/integration:fzf/locate-shell-settings _ble_contrib_fzf fzf fzf || return 1
