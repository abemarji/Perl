#!/usr/bin/perl
#
# Base64 Encode
#

use strict;
use warnings;
use MIME::Base64;


my $encoded = "";
my $decoded = "abe\@us.ibm.com:MYPassword";

$encoded = encode_base64($decoded);
#$decoded = decode_base64($encoded);

print "\nDecoded: $decoded \nEncoded: $encoded\n";

