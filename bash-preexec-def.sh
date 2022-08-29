# embedded in ble.sh for bash-preexec.bash

function ble/contrib/bash-preexec/loader {
  if [[ ${bp_imported-${__bp_imported}} ]]; then
    blehook ATTACH-=ble/contrib/bash-preexec/loader
    blehook POSTEXEC-=ble/contrib/bash-preexec/loader
    if ble/util/import/is-loaded contrib/bash-preexec; then
      ble/contrib/bash-preexec/attach.hook
    else
      ble-import contrib/bash-preexec
    fi
  fi
}
if [[ ${bp_imported-${__bp_imported}} ]]; then
  ble-import contrib/bash-preexec
else
  blehook ATTACH!=ble/contrib/bash-preexec/loader
  blehook POSTEXEC!=ble/contrib/bash-preexec/loader
fi
