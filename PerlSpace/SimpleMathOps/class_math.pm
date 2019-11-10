package class_math;

use strict;
use warnings;

sub new
    {
        my $self = {};
        return bless $self
    }

sub math_add
    {
        my $self = shift;
        my ($a,$b) = (@_);
        return $a + $b
    }

sub math_sub
    {
        my $self = shift;
        my ($a,$b) = (@_);
        return $a - $b
    }

sub math_div
    {
        my $self = shift;
        my ($a,$b) = (@_);
        return ($a / $b)
    }

sub math_mul
    {
        my $self = shift;
        my ($a,$b) = (@_);
        return $a * $b
    }




return 1