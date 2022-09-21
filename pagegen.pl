#!/usr/bin/env perl
# https://i.ytimg.com/vi/<video_id>/default.jpg

use strict;
use warnings;

use Text::CSV_XS qw(csv);
use Template;

use Data::Dumper;
use Carp;

my $tt = Template->new({
    INCLUDE_PATH => '/./tt',
    #INTERPOLATE  => 1,
}) || die "$Template::ERROR\n";

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
        warn 'html/' . $lineup . '.html'; 
        my $fname = 'html/' . $lineup . '.html';
        open $fout, '>', $fname 
             || croak "Can't open";
        warn $fout;
        say $fout '<TABLE>';
        warn "abled";
    } else {
        warn $row->[2];
        my $vars = {
            title => $row->[2],
            url   => $row->[5],
            image => "",
        };  
        my $out;
        $tt->process('row.tt', $vars, \$out)
            || croak $tt->error(), "\n";
        say $fout $out;
    }
}


sleep(30);