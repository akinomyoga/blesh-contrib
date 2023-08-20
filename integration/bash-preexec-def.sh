# embedded in ble.sh for bash-preexec.bash

function ble/contrib/integration:bash-preexec/loader {
  if [[ ${bp_imported-${__bp_imported}} ]]; then
    blehook ATTACH-=ble/contrib/integration:bash-preexec/loader
    blehook POSTEXEC-=ble/contrib/integration:bash-preexec/loader
    if ble/util/import/is-loaded contrib/bash-preexec; then
      ble/contrib/integration:bash-preexec/attach.hook
    else
      ble-import contrib/integration/bash-preexec
    fi
  fi
}
if [[ ${bp_imported-${__bp_imported}} ]]; then
  ble-import contrib/integration/bash-preexec
else
  blehook ATTACH!=ble/contrib/integration:bash-preexec/loader
  blehook POSTEXEC!=ble/contrib/integration:bash-preexec/loader
fi
