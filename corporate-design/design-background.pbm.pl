#!/usr/bin/perl
use strict;
use warnings;
use v5.20;

my $white = '255 255 255 ';
my $gray  = '240 240 240 ';
my $fsfw1 = '44 171 183 ';
my $fsfw2 = '107 186 0 ';
my $fsfw3 = '90 64 198 ';
my @colordist = (
    ($gray) x 20,
    ($fsfw1) x 4,
    ($fsfw2) x 1,
    ($fsfw3) x 1,
);

my $raster_size = 16;
my $block_size = 12;
my $blocks_x = 100;
my $blocks_y = 100;

my $padding = $raster_size - $block_size;
my $padding1 = int($padding / 2);
my $padding2 = $padding - $padding1;
my $pixels_x = $blocks_x * $raster_size;
my $pixels_y = $blocks_y * $raster_size;
say "P3 $pixels_x $pixels_y 255";

for my $i (1..$blocks_y) {
    my $blocks_line = '';
    say $white x $padding1 x $pixels_x;
    for my $j (1..$blocks_x) {
        my $color = $colordist[rand @colordist];
        $blocks_line .= $white x $padding1 . $color x $block_size . $white x $padding2;
    }
    say $blocks_line x $block_size;
    say $white x $padding2 x $pixels_x;
}
