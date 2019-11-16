#! usr/bin/perl -w
use strict;
use Getopt::Long;

my ($path);

GetOptions ("p=s" => \$path);   # Path to Dir or Path to Sngle File
chomp $path;

print "==========================================================\n";
print "Bsoft Operations started at ". scalar locatime() ."\n";
print "==========================================================\n";
if ($path)
    {
        if (-f $path)
            {
                print "File provided as an input\n";
                print "processing file:- $path";
            }
        else
            {
                print "Directory provided as an input\n";
                print "processing files in Dir:- $path \n";

                opendir (DIR, $path) or die $!;
                my @files = readdir DIR;
                closedir DIR;

                my  $ignore_list =  GetIgnoreList();
                my  %ignorelist = %$ignore_list;
                foreach (@files)
                    {
                        next if $_ eq '.';
                        next if $_ eq '..';
                        next if (exists($ignorelist{$_}));
                        next if (-d $_);
                        my $each_file = "$path//$_";
                        chomp $each_file;
                        print "Processing file:- $each_file \n";
                        PerformOps($each_file);
                    }


            }    
    }
print "Bsoft Operations ended at ". scalar locatime() ."\n";    
print "==========================================================\n";    

sub GetIgnoreList
    {
        my  %ignorelist;
        open (IN, 'ignore.list') or die $!;
        while (<IN>)
            {
                next if $_ == " ";
                $ignorelist{$_}=1
            }
        close IN;    
        return \%ignorelist;    
    }

sub PerformOps
    {
        my ($file) = (@_);
        
        my  $bing_op = $file;
            $bing_op =~s/\.mrc/\_out\.mrc/gi;
        my  $mask_output_file = $file;
            $mask_output_file =~s/\.mrc/\_mask\.mrc/gi;
        my  $bop_op_file = $mask_output_file;
            $bop_op_file =~s/\_mask\.mrc/\_cutoff\.mrc/gi;
        
        print "Executing BIMG Command:- \n";
        my  $bimg_cmd = 'bimg -ver 7 -datatype u '. "$file" .' '."$bing_op \&";
            print "$bimg_cmd\n";
            $bimg_cmd = `$bimg_cmd`;

        print "Executing BMASK Command:- \n";
        my  $bmask_cmd = 'bmask -ver 7 -datatype u -create 1270,1022,1 -origin 634,510,0 -radius 0,100 '."$mask_output_file"." "."$file";
            print "$bmask_cmd\n";
            $bmask_cmd=`$bmask_cmd`;

        print "Apply MASK : Executing BOP Command:- \n";
        my  $bop_cmd = 'bop -datatype u -ver 4 -multi 1,0 '."$file".' '."$mask_output_file".' '."$bop_op_file";
        print "$bop_cmd\n";
            $bop_cmd = `$bop_cmd`;

    }
