# ble.sh contrib/config/github302-perlre-server.bash
# Copyright 2023 Britton Kerin <https://lists.gnu.org/archive/html/help-bash/2023-03/msg00068.html>
# Copyright 2023 Koichi Murase <myoga.murase@gmail.com>

# This file illustrates an example usage of "ble/util/bgproc#open" from module
# "util.bgproc".  The server code in the shell function
# "ble/contrib/config:github302/perlre-server" was taken from the report by
# Britton Kerin at Ref. [1].
#
# [1] https://lists.gnu.org/archive/html/help-bash/2023-03/msg00068.html
#
# Note: This example does not consider the case that the background process
# terminates by an error, crashes, etc.

ble-import util.bgproc

function ble/contrib/config:github302/perlre-server {
  exec perl <(cat <<'  END_PERL'
    use strict; use warnings;
    $| = 1;
    while ( 1 ) {
      my $rex = <>;
      chomp($rex);
      my $str = <>;
      if ( $str =~ m/$rex/ ) {
        # FIXME: Sadly this die argument doesn't show anywhere:
        defined($1) or die 'group $1 unexpectedly undefined';
        print length($1);
      }
      print "\n";
    }
  END_PERL
  ) 2>/dev/tty
}

if ble/util/bgproc#open perlre_server ble/contrib/config:github302/perlre-server; then
  # The main shell can send a request to fd ${perlre_server_bgproc[1]} and can
  # read from fd ${perlre_server_bgproc[0]}.
  ble/util/print "ble/contrib/config:github30: perlre-server (${perlre_server_bgproc[4]}) has started." >&2
else
  ble/util/print 'ble/contrib/config:github30: failed to start perlre-server' >&2
  return 1
fi

## @fn ble/contrib/config:github302/perlre-match rex str
##   Matches the regex REX against the string STR and returns the length of the
##   string captured by the first matching group ($1).
##
##   @param[in] rex
##     The regex to match in "perlre" syntax.
##   @param[in] str
##     The string to be matched by REX.
##   @var[out] ret
##     The resulting length of the string matched by the first capture group is
##     stored in this variable.  When REX does not match STR, an empty value is
##     stored in this variable.
##   @exit 0 if REX successfully matches STR, or otherwise 1.
##
function ble/contrib/config:github302/perlre-match {
  local IFS=$' \t\n'

  # Only takes the first lines of both because newlines in requests confuse the
  # server.
  local rex=${1%%$'\n'*} str=${2%%$'\n'*}

  # We send the requests to fd ${perlre_server_bgproc[1]}.
  ble/util/print-lines "$rex" "$str" >&"${perlre_server_bgproc[1]}"

  # We can read the resposnes from fd ${perlre_server_bgproc[0]}.  We set a
  # timeout to `read' so that it doesn't lock forever in case that the expected
  # output is not obtained by accident (e.g., for the reason that REX did not
  # contain any capturing group accessible through $1).
  ble/bash/read-timeout 1 -r -u "${perlre_server_bgproc[0]}" ret

  [[ $ret ]]
}
