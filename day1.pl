#!/usr/bin/perl -w

use strict;

my ($input) = $0 =~ /^([^.]+)/;
$input .= '_input';

print "\$input = $input\n";

my @values;
{
    local $/;
    open my $fh, "<$input" or die $!;
    @values = split "\n", <$fh>;
}

print "Number of values: " . @values . "\n";

sub elem_gt_prev {
    my $c = 0;
    for (my $i = 1; $i < @_; $i++) {
	$c++ if $_[$i-1] < $_[$i];
    }

    return $c;
}

my $c = elem_gt_prev(@values);
print "$c values were larger than the previous.\n";

my @values_avg;
for (my $i = 2; $i < @values; $i++) {
    my $x = 0;
    map {$x+=$_} @values[$i-2 .. $i];
    push @values_avg, $x;
}

$c = elem_gt_prev(@values_avg);
print "$c values were 3-elem average larger than the previous.\n";
