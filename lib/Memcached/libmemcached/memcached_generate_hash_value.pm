package Memcached::libmemcached::memcached_generate_hash_value;

=head1 NAME

memcached_generate_hash_value - Hash a key value

=head1 LIBRARY

C Client Library for memcached (libmemcached, -lmemcached)

=head1 SYNOPSIS

  #include <memcached.h>

  uint32_t
    memcached_generate_hash_value (const char *key,
                                   size_t key_length,
                                   memcached_hash_t hash_algorithm);

  uint32_t 
    memcached_generate_hash (memcached_st *ptr,
                             const char *key, 
                             size_t key_length);

=head1 DESCRIPTION

memcached_generate_hash_value() allows you to hash a key using one of
the hash functions defined in the library. This method is provided for
the convenience of higher-level language bindings and is not necessary
for normal memcache operations.

The allowed hash algorithm constants are listed in the manpage for
memcached_behavior_set().

memcached_generate_hash() takes a memcached_st struture and produces
the hash value that would have been generated based on the defaults
of the memcached_st structure.

As of version 0.36 all hash methods have been placed into the library
libhashkit(3) which is linked with libmemcached(3).

=head1 RETURN

A 32-bit integer which is the result of hashing the given key.
For 64-bit hash algorithms, only the least-significant 32 bits are
returned.

=head1 HOME

To find out more information please check: 
L<https://launchpad.net/libmemcached>

=head1 AUTHOR

Brian Aker, E<lt>brian@tangent.orgE<gt>

=head1 SEE ALSO

memcached(1) libmemcached(3) memcached_behavior_set(3) libhashkit(3)

=cut

1;
