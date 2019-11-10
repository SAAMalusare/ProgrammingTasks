use strict;
use warnings;
use lib 'D:/Suhas/Develp/PerlSpace/DBSample';
use class_db;
use Getopt::Long;
system "cls";

my $file;
GetOptions ("f=s" => \$file);   # Employee file with Path
chomp ($file) if $file;

print "\n***************** Started at: ".scalar localtime(). "**************";
print "\n\tSample code to demonstrate File Handlers, REGEX and MySQL DB";
print "\n********************************************************************";

if  ($file)
    {
       my  $Obj_db = class_db->new();
  
       open (ED, "$file") or die $!;
       while (<ED>)
            {
                my  $line = $_;
                next if ($line=~/^\#/g);
                next if $line eq " ";
                
                $line=~s{^(\d+?),(\w.+?),(\w.+?),(\w.+?)$}
                        {
                           my $record_chk = $Obj_db->db_pre_record_check(1,$1);

                           if ($record_chk eq 'N')
                            {
                                $Obj_db->db_insert(1,$1,$2,$3,$4), if ($1 && $2 && $3 && $4);
                            }
                           else
                            {
                                print "\n$1 already exists in database.. ignoring..."
                            } 
                           
                        }exgsi;
            }
        close ED;
        $Obj_db->db_insert(0,,,,);  # just send DB disconnect signal
        
    }
else
    {
        usage();
    }    
print "\n****************** Ended at: ". scalar localtime() ."***************\n";

sub usage
    {
        print "\nUsage:\t $0 -f <FileName with Path>";
        print "\n\te.g. $0 -f D:/myPath/Empdata";

    }
