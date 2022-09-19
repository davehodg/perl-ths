#!/usr/bin/env perl
# https://i.ytimg.com/vi/<video_id>/default.jpg

use strict;
use warnings;

use Text::CSV_XS qw(csv);
use Data::Dumper;
use Carp;

my $csv = Text::CSV_XS->new ({ binary => 1, auto_diag => 1 });
open my $fh, "<:encoding(utf8)", "deep.csv" or croak "deep.csv: $!";

my $lineup; 
my $fout;

my $headers = $csv->getline($fh);   
while (my $row = $csv->getline ($fh)) {
    if ($row->[0] ne '') {
        # maybe say to fout here regardless
        if (defined $fout) {
            say $fout '</TABLE>';
            close $fout;
        }
         $lineup = $row->[0];
        warn 'html/' . $lineup . '.html'; sleep(5);
        open $fout, '>','html/' . $lineup . '.html' or croak 'Cannot write';
        say $fout '<TABLE>';
    } else {
        my $video = $row->[2];
        my $url   = $row->[[5];
        say $fout '<TR><TD><A HREF=' . $video . '</TD></TR>';
        warn $video;
    }
}

sleep(30);