#!/usr/bin/perl -w

use strict;
use warnings FATAL => 'all';
use 5.10.0;

#use Data::Dumper;

STDOUT->autoflush(1);
STDERR->autoflush(1);

# ble.sh is eating STDERR at this point so to get feedback we do this:
$SIG{__WARN__} = sub {
  print STDERR "in perlre-server2 bgproc: ".$_[0];
};
$SIG{__DIE__}  = sub {
  print STDERR "in perlre-server2 bgproc: ".$_[0]; exit 1;
};

my $mlf = undef;   # My Log File (leave undef to disable logging)
#open($mlf, ">>/tmp/mlf") or die; $mlf->autoflush(1);

while ( 1 ) {

  # First line is regex
  chomp(my $rex = <>);
  defined($rex) or exit;   # undef might mean end of pipe.  I think
  defined($mlf) and print $mlf "from perl: \$rex: $rex\n";

  # Next line is number of lines in string to match
  chomp(my $lc = <>);
  defined($lc) or exit;    # undef might mean end of pipe.  I think
  defined($mlf) and print $mlf "from perl: \$lc: $lc\n";

  # Remaining input lines are the input string
  my $str = '';
  for ( my $ii = 0 ; $ii < $lc ; $ii++ ) {   # Get Lines
    my $nsl = <>;            # New String Line
    defined($nsl) or exit;   # undef might mean end of pipe.  I think
    $str .= $nsl;
  }
  chomp($str);   # Remove trailing "\n" of last line
  defined($mlf) and print $mlf "from perl: \$str: $str\n";

  # Respond with blank line if the match fails, otherwise with a single
  # line of the form:
  #
  #    epm eps epl g1m g1s g1l g2m g2s g2l ...
  #
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
