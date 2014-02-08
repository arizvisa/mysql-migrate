#!/usr/bin/perl
use DBI;

%params;
@options = qw(user password host);
foreach $key (@options) {
    ($k) = split(//, $key);
    foreach (@ARGV) {
        if ((m/^--$key=(.*)$/) || (m/^-$k(.*)$/)) {
            $params{$key} = $1;
        }
    }
}

if (keys %params == 0) {
    print "dumps all the databases of a specific server\n";
    print "valid options ->\n";
    @_ = @options;
    @shorts = map { ($_) = split(//, $_); } @_;
    @_ = map { sprintf('-%s, --%s', $shorts[$_], $options[$_]) } 0..$#options;
    print join("\n", @_);
    print "\n";
    exit;
}

$dsn = sprintf('dbi:mysql:database=information_schema;host=%s', $params{host});
$dbh = DBI->connect($dsn, $params{user}, $params{password}) ||
    die DBI->errstr();

$q = 'select schema_name from schemata where schema_name != "information_schema"';
$argh = $dbh->selectall_arrayref($q, {Slice => {}});
@argh = map { $_->{schema_name} } @{$argh};
print join("\n", @argh) . "\n";
