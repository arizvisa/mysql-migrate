#!/usr/bin/perl
use Data::Dumper;
use DBI;

%params;
@options = qw(database catalog schema user password host);
foreach $key (@options) {
    ($k) = split(//, $key);
    foreach (@ARGV) {
        if ((m/^--$key=(.*)$/) || (m/^-$k(.*)$/)) {
            $params{$key} = $1;
        }
    }
}

if (keys %params == 0) {
    print "dumps all the tables of a specific database\n";
    print "valid options ->\n";
    @_ = @options;
    @shorts = map { ($_) = split(//, $_); } @_;
    @_ = map { sprintf('-%s, --%s', $shorts[$_], $options[$_]) } 0..$#options;
    print join("\n", @_);
    print "\n";
    exit;
}

$dsn = sprintf('dbi:mysql:database=%s;host=%s', $params{database}, $params{host});
$dbh = DBI->connect($dsn, $params{user}, $params{password}) ||
    die DBI->errstr();

@_ = map { m/^`(.*)`$/} $dbh->tables(@params{qw(catalog schema})});

print join("\n", @_);
