# (C) 2022, Koichi Murase <myoga.murase@gmail.com>
#
# File: blesh-contrib/config/github-carapace-bin-938.completion-desc.bash
# Referece: https://github.com/rsteube/carapace-bin/issues/938#issuecomment-1046219977

_comp_cmd_test1() {
  if [[ ${BLE_ATTACHED-} ]]; then
    # If ble.sh is in the attached state.

    # Change the menu style to "desc" for the current completion
    bleopt complete_menu_style=desc

    # Generate filename or directory name (The description is automatically
    # generated from the filename for "file").
    ble/complete/cand/yield file 'file.txt'

    # Generate words with description.
    ble/complete/cand/yield word 'my-word' 'This is a description for my-word.'

    # Generate option with OPTARG indicated in the list.  In the third argument
    # $'OPTION\x1cOPTARG\x1cSUFFIX\x1cDESCROPTION', FS ($'\x1c') is used to
    # separate OPTION, OPTARG indicator, SUFFIX that is inserted after inserted
    # the unique completion, and DESCRIPTION
    ble/complete/cand/yield mandb '--option' $'--option\x1c=<something>\x1c=\x1cThis is a description for the option'

  else
    # If ble.sh is not loaded or is in the detached state, just generate
    # candidates for the default progcomp of Bash.

    COMPREPLY+=(file.txt)
    COMPREPLY+=(candidate)
    COMPREPLY+=(--option)

  fi
}
complete -F _comp_cmd_test1 test1
