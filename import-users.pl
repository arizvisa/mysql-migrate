#!/usr/bin/perl -n
chomp;

($user, $pass, $dbs) = split(/:/, $_);
print "create user '$user' identified by '$pass';\n";

@_ = map { "grant all on `$_`.* to '$user'\@'%';" } split(/,/, $dbs);
print join("\n", @_) . "\n";
