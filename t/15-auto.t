
# tests for functions documented in memcached_auto.pod

use strict;
use warnings;

use Test::More tests => 10;

BEGIN {
use_ok( 'Memcached::libmemcached',
#   functions explicitly tested by this file
qw(
  memcached_increment
  memcached_decrement
),
#   other functions used by the tests
qw(
  memcached_set
));
}

use lib 't/lib';
use libmemcached_test;

my $memc = libmemcached_test_create();
ok $memc;

my $t1= time();
my $k1= "$0-test-key-$t1"; # can't have spaces
my $v1= 42;
my $v2=0;

print "memcached_increment the not yet stored value\n";
is scalar memcached_increment($memc, $k1, 1, $v2), 'SUCCESS',
    'should not exist yet and so should return undef';

print "memcached_set\n";
is memcached_set($memc, $k1, $v1), "SUCCESS";

print "memcached_increment the just stored value\n";
is scalar memcached_increment($memc, $k1, 1, $v2), 'SUCCESS',
    'should increment existing value';
is $v2, $v1+1;

is scalar memcached_increment($memc, $k1, 1, $v2), 'SUCCESS',
    'should increment existing value';
is $v2, $v1+2;

is scalar memcached_decrement($memc, $k1, 1, $v2), 'SUCCESS',
    'should increment existing value';
is $v2, $v1+1;

# repeat for value with a null byte to check value_length works