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

my $l = length($values[0]);

sub most_common_in_col {
    my ($l, $c) = @_;
    my %f;
    ($f{0}, $f{1}) = (0, 0);
    foreach my $value(@$l) {
	$f{ substr($value, $c, 1) }++;
    }

    return ($f{0} > $f{1} ? 0 : 1);
}

sub bin2dec {
    my $s = shift;
    my $l = length($s);
    my $n = 0;
    for (my $i = 0; $i < $l; $i++) {
	$n += substr($s, $l-$i-1, 1) * (2 ** $i);
    }

    return $n;
}

# part 1 #

my $e_s = '';
my $g_s = '';
for (my $i=0; $i < $l; $i++) {
    my $c = most_common_in_col(\@values, $i);
    $e_s .= $c;
    $g_s .= $c^1;
}

my $e = bin2dec($e_s);
my $g = bin2dec($g_s);

print "\$e = $e\n";
print "\$g = $g\n";
print "power = ", $e * $g, "\n";

# part 2 #

my @o = @values;
my @c = @values;
for (my $i = 0; $i < $l; $i++) {
    my $c_o = most_common_in_col(\@o, $i);
    @o = grep substr($_, $i, 1) eq $c_o, @o if @o > 1;

    my $c_c = most_common_in_col(\@c, $i);
    @c = grep substr($_, $i, 1) eq $c_c^1, @c if @c > 1;
}

my $o = bin2dec($o[0]);
my $c = bin2dec($c[0]);

print "\$o[0] = $o[0]\n";
print "\$c[0] = $c[0]\n";
print "\$o = $o\n";
print "\$c = $c\n";
print "life support rating = ", $o * $c, "\n";
