#!/usr/bin/env perl
# https://i.ytimg.com/vi/<video_id>/default.jpg

use strict;
use warnings;
use open qw( :std :encoding(UTF-8) );

use Text::CSV_XS qw(csv);
use Template;

use Data::Dumper;
use Carp;

`rm html/*`;
<<<<<<< HEAD
=======

my $tt = Template->new({
    INCLUDE_PATH => './tt',
#    PRE_PROCESS  => 'header',
#    POST_PROCESS => 'footer',
    #INTERPOLATE  => 1,
}) || die "$Template::ERROR\n";
>>>>>>> 6a83380 (Update to new Trond format)

my $tt = Template->new(
    {
        INCLUDE_PATH => './tt',
    }
) || die "$Template::ERROR\n";

my $csv = Text::CSV_XS->new( { binary => 1, auto_diag => 1 } );
open my $fh, "<:encoding(utf8)", "deep.csv" or croak "deep.csv: $!";

my $lineup;
my $fout;

<<<<<<< HEAD
my $headers = $csv->getline($fh);
while ( my $row = $csv->getline($fh) ) {
    $lineup = $row->[0];
    my $fname = 'html/' . $lineup . '.html';
    open $fout, '>>', $fname
      || croak "Can't open $fname";
=======
my $headers = $csv->getline($fh);   
while (my $row = $csv->getline ($fh)) {
    # $row->[0] contains the file name
    $lineup = $row->[0];
    my $fname = 'html/' . $lineup . '.html';
    open $fout, '>>', $fname 
         || croak "Can't open $fname";

    
>>>>>>> 6a83380 (Update to new Trond format)

    {
        my $url = $row->[5];
        my $image;

<<<<<<< HEAD
        if ( $url =~ /youtube/x ) {
            my @junk = split( /v=/, $url );
            if ( defined $junk[1] ) {
                $image =
                  "https://i.ytimg.com/vi/" . $junk[1] . "/hqdefault.jpg";
            }

            #warn $image;
        }

        if ( $url =~ /youtu.be/x ) {
            my @junk = split( /\//, $url );

            #warn Dumper(\@junk), $junk[3];
            if ( defined $junk[3] ) {
                $image =
                  "https://i.ytimg.com/vi/" . $junk[3] . "/hqdefault.jpg";
            }

            #warn $image;
            #exit ;
        }

        my $vars = {
            title    => $row->[2],
            date     => $row->[3],
            duration => $row->[4],
            url      => $row->[5],
            image    => $image,
        };
        my $out;
        $tt->process( 'row.tt', $vars, \$out ) || croak $tt->error(), "\n";

        say $fout $out;
        close($fout);
=======
        if ($url =~ /youtube/) {
            my @junk = split (/v=/, $url);
            if (defined $junk[1]) {
                $image = "https://i.ytimg.com/vi/" . $junk[1] . "/hqdefault.jpg";
            }
            #warn $image;
        }
        
        my $vars = {
            title => $row->[2],
            url   => $row->[5],
            image => $image,
        };
        my $out;
        $tt->process('row.tt', $vars, \$out) || croak $tt->error(), "\n";

        say $fout $out;
        close ($fout);
>>>>>>> 6a83380 (Update to new Trond format)
    }
}

close $fh;
<<<<<<< HEAD
=======

>>>>>>> 6a83380 (Update to new Trond format)

