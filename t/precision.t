#!perl
use Test::More;
use DateTime;
use DateTime::Format::GeekTime;

if ($ENV{SLOW_TESTS}) {
    plan tests=>65536;
}
else {
    plan skip_all => 'Slow test, set $ENV{SLOW_TESTS} to run it';
}

for my $i (0..65535) {
    my $gkt=sprintf '0x%04X on day 0x000',$i;
    my $dt=DateTime::Format::GeekTime->parse_datetime($gkt);
    my $round_trip=DateTime::Format::GeekTime->format_datetime($dt);
    is(substr($round_trip,0,19),$gkt);
}
