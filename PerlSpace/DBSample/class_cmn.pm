package class_cmn;
use strict;
use warnings;

sub new
    {
        my $self = {};
        return bless $self
    }

sub get_db_info
    {
        my  $self=shift;
        open (FH,'db_secret') or die $!;
        my @filebuf = <FH>;
        close FH; 
        my $db_info = join ('',@filebuf);
           $db_info=~s{db_name\=(.+?)\s+db_host\=(.+?)\s+db_user\=(.+?)\s+db_pass\=(.+?)\s+db_port\=(\d+?)$}
                      {
                          if ($1 && $2 && $3 && $4 && $5)
                            {
                                return $1,$2,$3,$4,$5
                            }
                      }exgsi;
    }

return 1;