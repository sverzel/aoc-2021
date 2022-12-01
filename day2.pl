#!/usr/bin/perl -w

use strict;

my ($input) = $0 =~ /^([^.]+)/;
$input .= '_input';

print "\$input = $input\n";

# part 1 #
{
    open my $fh, "<$input" or die $!;
    my ($h, $d) = (0, 0);
    while (<$fh>) {
	my ($op, $n) = /^(\S+) (\d+)/;
	if ($op eq 'up') { $d -= $n }
	elsif ($op eq 'down') { $d += $n }
	elsif ($op eq 'forward') { $h += $n }
    }

    print "Horizontal: $h\n";
    print "Depth: $d\n";
    print "Product: " . $h*$d . "\n";
}

# part 2 #
{
    open my $fh, "<$input" or die $!;
    my ($h, $d, $a) = (0, 0, 0);
    while (<$fh>) {
	my ($op, $n) = /^(\S+) (\d+)/;
	if ($op eq 'up') { $a -= $n }
	elsif ($op eq 'down') { $a += $n }
	elsif ($op eq 'forward') { $h += $n; $d += $a*$n; }
    }
    
    print "Horizontal: $h\n";
    print "Depth: $d\n";
    print "Aim: $a\n";
    print "Product: " . $h*$d . "\n";
}
