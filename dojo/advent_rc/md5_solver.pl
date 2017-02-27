#!/usr/bin/env perl

#use "strict";
#use "warnings";

use Digest::MD5 qw(md5_hex);
use Data::Dumper;
$key = 'abbhdwsy';

@a;
$count = 0;
while($#a < 7){
  $md5 = md5_hex("${key}${count}");
  push @a, $md5 if $md5 =~ /^00000/;
  $count++;
}

$answer = join "", map { (split(//, $_))[5] } @a;
print $answer, "\n";
