#!/usr/bin/perl
#
# Generate Virtual MAC address
#

use strict;
use warnings;
use Term::ANSIColor;

#my $temp = "9.207.141.5";
my $temp = $ARGV[0];

#  \d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5]
#   if ( $_ =~ /^#/ || $_ !~ /(\d+\.?)+/ );
#if ($temp !~ /(\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])+/) {
#if ($temp ne /(\d+\.?)+/ ) {
$_ = $temp;
#if ($_ !~ /^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})$/ )  {
#if ($_ !~ /^((\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5]))$/ )  {
if ($_ !~ /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?).){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/) {
  printf ("$temp -- INVALID IP ADDRESS\n");
  exit();
}

my ($ip1, $ip2, $ip3, $ip4) = split /\./, $temp;
my ($hex1, $hex2, $hex3, $hex4) = split / /, sprintf("%02X %02X %02X %02X", $ip1, $ip2, $ip3, $ip4);

#print "temp: $temp \n ip1: $ip1 \n ip2: $ip2 \n ip3: $ip3 \n ip4: $ip4\n";
#print color ("bold white");
printf ("\nInput: $temp\n");
#print color('bold blue');
printf ("  IP1: %3d --> %s\n", $ip1, lc $hex1);
printf ("  IP2: %3d --> %s\n", $ip2, lc $hex2);
printf ("  IP3: %3d --> %s\n", $ip3, lc $hex3);
printf ("  IP4: %3d --> %s\n", $ip4, lc $hex4);

#printf ("ip5: %3d --> %02X \n", $ip1, lc sprintf("%02X", $ip1));
#printf ("ip1: %3d", $ip1) . printf(" --> %02X \n", $ip1);
#printf ("ip2: %3d", $ip2) . printf(" --> %02X \n", $ip2);
#printf ("ip3: %3d", $ip3) . printf(" --> %02X \n", $ip3);
#printf ("ip4: %3d", $ip4) . printf(" --> %02X \n", $ip4);

#printf ("hex1: $hex1 \n");
#printf ("hex2: $hex2 \n");
#printf ("hex1: $hex3 \n");
#printf ("hex1: $hex4 \n");

#print "ip1: $ip1 --> " . lc sprintf("%02X", $ip1) ."\n";
#print "ip2: $ip2 --> " . lc sprintf("%02X", $ip2) ."\n";
#print "ip3: $ip3 --> " . lc sprintf("%02X", $ip3) ."\n";
#print "ip4: $ip4 --> " . lc sprintf("%02X", $ip4) ."\n";

my $mac = "42" . sprintf("%02X", $ip1). "." . sprintf("%02X", $ip2) . sprintf("%02X", $ip3) . "." . sprintf("%02X", $ip4) ."00";
my $hex = sprintf("%02X", $ip1) . sprintf("%02X", $ip2) . sprintf("%02X", $ip3) . sprintf("%02X", $ip4);

$mac = lc $mac;
$hex = lc $hex;
#print color ('bold white');
print "\n  Hex: $hex / 0x$hex\n";
#print color ('bold yellow');
print "  Mac: 42 $hex 00 / $mac\n";

print color("reset");
