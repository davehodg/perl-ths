# Spreadsheet list of videos to lists of video with dates and clickable thumbnails

This is a noddy script to take a CSV list of videos and create and HTML page for each lineup with clickable thumbnails.

The fields, not all used, are:

    Lineup,Members,Where,Date,Running Time,URL,URL2,URL3,Notes

It only uses these CPAN modules:

    use Text::CSV_XS qw(csv);
    use Template;

As always, patches welcome. For example we need to get the thumbnail of the ARTE video. Duration would be nice.

Some minor things to do to make perlcritic happy.