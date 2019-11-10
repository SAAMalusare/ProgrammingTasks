use strict;
use warnings;
use lib 'D:/Suhas/Develp/PerlSpace/MathOpsArgs';
use class_math;
use Getopt::Long;
system "cls";

my ($a,$b,$o);

GetOptions ("a=i" => \$a,    # First Number 
            "b=i" => \$b,    # Second string
            "o=s" => \$o);   # Operator

if ($a && $b && $o)
    {
        chomp ($a,$b,$o);
        my  $obj_math = class_math->new();
        print "\n***********************************************************";
        if    ($o eq '+'){ print "\nAddition ==> ".$obj_math->math_add($a,$b)}
        elsif ($o eq '-'){ print "\nSubstraction ==> ".$obj_math->math_sub($a,$b)}
        elsif ($o eq '*'){ print "\nMultiplication ==> ".$obj_math->math_mul($a,$b)}
        elsif ($o eq '/'){ print "\nDivision ==> ".$obj_math->math_div($a,$b)}
        else { print "\nOperator not defined !!!"}
        print "\n***********************************************************";
    }


