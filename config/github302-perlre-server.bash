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
  # We redirect 2>/dev/tty here to ensure errors show up
  exec perl <(cat <<'  END_PERL'
    use strict; use warnings; use warnings FATAL => 'all'; use 5.10.0;
    use Data::Dumper;
    STDOUT->autoflush(1);
    STDERR->autoflush(1);
    # ble.sh is eating STDERR at this point so to get feedback we do this:
    $SIG{__WARN__} = sub {
      print STDERR "in perlRegexServer bgproc: ".$_[0];
    };
    $SIG{__DIE__}  = sub {
      print STDERR "in perlRegexServer bgproc: ".$_[0]; exit 1;
    };
    my $mlf = undef;   # My Log File (leave undef to disable logging)
    #open($mlf, ">>/tmp/mlf") or die; $mlf->autoflush(1);
    while ( 1 ) {
      chomp(my $rex = <>);   # First line is regex
      defined($rex) or exit;   # undef might mean end of pipe.  I think
      defined($mlf) and print $mlf "from perl: \$rex: $rex\n";
      chomp(my $lc = <>);    # Next line is number of lines in string to match
      defined($lc) or exit; # undef might mean end of pipe.  I think
      defined($mlf) and print $mlf "from perl: \$lc: $lc\n";
      my $str = '';          # String to match
      for ( my $ii = 0 ; $ii < $lc ; $ii++ ) {   # Get Lines
        my $nsl = <>;   # New String Line
        defined($nsl) or exit;   # undef might mean end of pipe.  I think
        $str .= $nsl;
      }
      chomp($str);   # Remove trailing "\n" of last line
      defined($mlf) and print $mlf "from perl: \$str: $str\n";
      # Respond with blank line if the match fails, otherwise with a single
      # line of the form:
      #    epm eps epl g1m g1s g1l g2m g2s g2l ...
      # where epm/eps/epl are Entire Pattern Matched (1)/Start/Length and
      # g1m/g1s/g1l are (capture) Group 1 Matched (0 or 1)/Start/Lengh, etc.
      # (where Start/Length may be 'undef').  Note that epm is always 1 since
      # we return an empty line if the match fails.
      if ( $str =~ m/$rex/ ) {
        print
          join(
            ' ',
            map {
              defined($+[$_])
              ? "1 $-[$_] ".($+[$_] - $-[$_])
              : '0 undef undef'
            }
            (0 .. $#+) );
      }
      print "\n";
    }
  END_PERL
  ) 2>/dev/tty
}

# restart so user can easily try again if they send a bad regex.
# kill-timeout=0 because on some terminals ble.sh will end up exiting slowly
# if we wait before sending SIGTERM
if ble/util/bgproc#open perlre_server ble/contrib/config:github302/perlre-server restart:kill-timeout=0; then
  # The main shell can send a request to fd ${perlre_server_bgproc[1]} and can
  # read from fd ${perlre_server_bgproc[0]}.
  ble/util/print "ble/contrib/config:github30: perlre-server (${perlre_server_bgproc[4]}) has started." >&2
else
  ble/util/print 'ble/contrib/config:github30: failed to start perlre-server' >&2
  return 1
fi

## @fn ble/contrib/config:github302/perlre-match rex str
##
##   Matches the regex REX against the string STR
##
##   @param[in] rex
##     The regex to match in "perlre" syntax.   Must be exactly one line long.
##   @param[in] str
##     The string to be matched by REX.  May be multiple lines.
##   @var[out] ret
##     A blank line if the match failed, otherwise a single line of the form:
##       epm eps eml g1m g1s g1l g2m g2s g2l ...
##     where epm/eps/epl are Entire Pattern Matched (1)/Start/Length and
##     g1m/g1s/g1l are (capture) Group 1 Matched (0 or 1)/Start/Lengh, etc.
##     (where Start/Length may be 'undef').  Note that epm is always 1 here
##     since we return an empty line if the match fails.
##   @exit 0 if REX successfully matches STR, or otherwise 1.
##
function ble/contrib/config:github302/perlre-match {

  # FIXXME: could use #post instead of #use followed by echo but I'm too lazy
  # and scared to figure how to get all the lines through correctly right now

  ble/util/bgproc#use perlre_server

  {                               \
    echo "$1"                     \
    &&                            \
    local tmp="${2//[!$'\n']/}"   \
    &&                            \
    echo $((${#tmp} + 1))         \
    &&                            \
    echo "$2";                    \
  }                               \
  >&"${perlre_server_bgproc[1]}";

  # We can read the resposnes from fd ${perlre_server_bgproc[0]}.  We set a
  # timeout to `read' so that it doesn't lock forever in case that the expected
  # output is not obtained by accident.
  ble/bash/read-timeout 1 -r -u "${perlre_server_bgproc[0]}" ret

  [[ $ret ]]
}
