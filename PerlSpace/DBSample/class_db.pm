package class_db;

use DBI;
use strict;
use warnings;
use lib 'D:/Suhas/Develp/PerlSpace/DBSample';
use class_cmn;

sub new
    {
        my $self = {};
        return bless $self
    }


sub db_conxn
    {
        my  $self=shift;
        my  ($db_name, $db_server, $port, $user, $pwd) = (@_);
        chomp ($db_name, $db_server, $port, $user, $pwd);
        my  $dsn = "DBI:mysql:database=$db_name;host=$db_server;port=$port";
        my  $dbh = DBI->connect($dsn, $user, $pwd,{'RaiseError' => 1});
        
        if(!$dbh)
            {
                die "failed to connect to MySQL database DBI->errstr()";
            }
        else
            {
                return $dbh
            }
    }

sub db_pre_record_check
    {
        my  $self=shift;
        my  $Obj_cmn = class_cmn->new();
        my  ($db_name, $db_server, $user, $pwd, $port) = $Obj_cmn->get_db_info();
        my  $dbh = $self->db_conxn($db_name, $db_server, $port, $user, $pwd);
        my  ($flag,$emp_id)=(@_);

        if  ($flag && $emp_id)
            {
                chomp ($flag,$emp_id);
                if ($flag == 1)
                    {
                      my $rs;   # Record Status
                      eval 
                        {
                          my $qry = "SELECT count(emp_id) from db_emp.tbl_emp where emp_id = $emp_id";
                          my $sth = $dbh->prepare($qry);
                             $sth->execute();
                          if ($sth->fetchrow_arrayref->[0] == 0)
                            {
                               $rs = 'N'  # Not found
                            }
                          else
                            {
                                $rs = 'E'  # Exists
                            }  
                          
                        }; print "Error: Select Statement failed !!!: $@\n" if $@;
                        return $rs;
                    }
                else
                    {
                        print "\nDisconnecting DB connection...";
                        $dbh->disconnect();
                    }     
            }
    }


sub db_insert
    {
        my  $self=shift;
        my  $Obj_cmn = class_cmn->new();
        my  ($db_name, $db_server, $user, $pwd, $port) = $Obj_cmn->get_db_info();
        my  $dbh = $self->db_conxn($db_name, $db_server, $port, $user, $pwd);
        my  ($flag,$emp_id,$emp_name,$emp_email,$emp_dept)=(@_);

        if  ($flag && $emp_id && $emp_name && $emp_email && $emp_dept)
            {
                chomp ($flag,$emp_id,$emp_name,$emp_email,$emp_dept);
                if ($flag == 1)
                    {
                        eval {
                                $dbh->do("INSERT INTO tbl_emp VALUES ($emp_id,\"$emp_name\",\"$emp_email\",\"$emp_dept\")");
                            };
                                print "Error: Insert record failed !!!: $@\n" if $@;
                    }
                else
                    {
                        print "\nDisconnecting DB connection...";
                        $dbh->disconnect();
                    }     
            }    
    }















return 1