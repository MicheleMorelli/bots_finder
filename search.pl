#!bin/usr/perl

use strict;
use warnings;
my $file1 = "agents.txt";
my $file2 = "test.txt";
my @a = ();

open my $agents, $file1 or die "no $file1: $!";

while(my $line = <$agents>){
    #print STDERR "now evaluating $line";
    
    open my $bots, $file2 or die "no $file2: $!";
    while(my $l = <$bots>) {
    	if ($line=~ m/$l*/i) {
		push(@a,$line);
		last; 
	    }
	    #print STDERR "now evaluating $l";
	}
	close $bots;
}
close $agents;

my $b = "";
foreach my $i (@a){
    $b .= " and requester_user_agent <> $i ";
    }
print $b;
