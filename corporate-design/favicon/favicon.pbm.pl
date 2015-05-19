#!/usr/bin/perl
use strict;
use warnings;
use v5.20;

my $white = '255 255 255 ';
my $fsfw1 = '44 171 183 ';
my $fsfw2 = '107 186 0 ';
my $fsfw3 = '90 64 198 ';

say 'P3 16 16 255';

say $white x 16 x 1;
for my $i (1..6) {
   say $white . $fsfw1 x 6 . $white x 2 . $fsfw2 x 6 . $white;
}
say $white x 16 x 2;
for my $i (1..6) {
   say $white . $fsfw3 x 6 . $white x 2 . $fsfw1 x 6 . $white;
}
say $white x 16 x 1;
