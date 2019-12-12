#!/usr/bin/perl
#
# Base64 Decode
#

use strict;
use warnings;
use MIME::Base64;


my $encoded = "YWJlQHVzLmlibS5jb206TVlQYXNzd29yZA==";
my $decoded = "";

$decoded = decode_base64($encoded);

print "\nEncoded: $encoded \nDecoded: $decoded\n";

