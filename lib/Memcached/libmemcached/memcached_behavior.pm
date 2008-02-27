package Memcached::libmemcached::memcached_behavior;

=head1 NAME

memcached_behavior_get memcached_behavior_set

=head1 LIBRARY

C Client Library for memcached (libmemcached, -lmemcached)

=head1 SYNOPSIS

  #include <memcached.h>

  uint64_t
    memcached_behavior_get (memcached_st *ptr,
                            memcached_behavior flag);

  memcached_return
    memcached_behavior_set (memcached_st *ptr,
                            memcached_behavior flag,
                            uint64_t data);

=head1 DESCRIPTION

libmemcached(3) behavior can be modified by use memcached_behavior_set().
Default behavior is the library strives to be quick and accurate. Some
behavior, while being faster, can also result in not entirely accurate
behavior (for instance, memcached_set() will always respond with
C<MEMCACHED_SUCCESS>).

memcached_behavior_get() takes a behavior flag and returns whether or not
that behavior is currently enabled in the client.

memcached_behavior_set() changes the value of a particular option of the
client. It takes both a flag (listed below) and a value. For simple on or
off options you just need to pass in a value of 1. Calls to 
memcached_behavior_set() will flush and reset all connections.

=over 4

=item MEMCACHED_BEHAVIOR_NO_BLOCK

Causes libmemcached(3) to use asychronous IO. This is the fastest transport
available for storage functions. For read operations it is currently 
similar in performance to the non-blocking method (this is being
looked into).

=item MEMCACHED_BEHAVIOR_TCP_NODELAY

Turns on the no-delay feature for connecting sockets (may be faster in some
environments).

=item MEMCACHED_BEHAVIOR_HASH

Makes the default hashing algorithm for keys use MD5. The value can be set to either MEMCACHED_HASH_DEFAULT, MEMCACHED_HASH_MD5, MEMCACHED_HASH_CRC, MEMCACHED_HASH_FNV1_64, MEMCACHED_HASH_FNV1A_64, MEMCACHED_HASH_FNV1_32, MEMCACHED_HASH_FNV1A_32, MEMCACHED_HASH_KETAMA. The behavior for all hashes but MEMCACHED_HASH_DEFAULT is identitical to the Java driver written by Dustin Sallings.

=item MEMCACHED_BEHAVIOR_DISTRIBUTION

Using this you can enable different means of distributing values to servers.
The default method is MEMCACHED_DISTRIBUTION_MODULA. You can enable
consistent hashing by setting MEMCACHED_DISTRIBUTION_CONSISTENT. 
Consistent hashing delivers better distribution and allows servers to be 
added to the cluster with minimal cache losses. 

=item MEMCACHED_BEHAVIOR_CACHE_LOOKUPS

Memcached can cache named lookups so that DNS lookups are made only once.

=item MEMCACHED_BEHAVIOR_SUPPORT_CAS

Support CAS operations (this is not enabled by default at this point in the server since it imposes a slight performance penalty).

=item MEMCACHED_BEHAVIOR_POLL_TIMEOUT

Modify the timeout value that is used by poll(). The default value is -1. An signed int pointer must be passed to memcached_behavior_set() to change this value. For memcached_behavior_get() a signed int value will be cast and returned as the unsigned long long.

=item MEMCACHED_BEHAVIOR_USER_DATA

This allows you to store a pointer to a specifc piece of data. This can be
retrieved from inside of memcached_fetch_execute(). Cloning a memcached_st

will copy the pointer to the clone. This was deprecated in 0.14 in favor
of memcached_callback_set(3). This will be removed in 0.15.

=item MEMCACHED_BEHAVIOR_BUFFER_REQUESTS

Enabling buffered IO causes commands to "buffer" instead of being sent. Any
action that gets data causes this buffer to be be sent to the remote
connection. Quiting the connection or closing down the connection will also
cause the buffered data to be pushed to the remote connection. 

=item MEMCACHED_BEHAVIOR_VERIFY_KEY

Enabling this will cause libmemcached(3) to test all keys to verify that they 
are valid keys.

=item MEMCACHED_BEHAVIOR_SORT_HOSTS

Enabling this will cause hosts that are added to be placed in the host list in 
sorted order. This will defeat consisten hashing.

=item MEMCACHED_BEHAVIOR_CONNECT_TIMEOUT

In non-blocking mode this changes the value of the timeout during socket
connection.

=back

=head1 RETURN

memcached_behavior_get() returns either the current value of the get, or 0
or 1 on simple flag behaviors (1 being enabled). memcached_behavior_set()
returns whether or not the behavior was enabled.

=head1 NOTES

memcached_behavior_set() in version .17 was changed from taking a pointer
to data value, to taking a uin64_t. 

=head1 HOME

To find out more information please check:
L<http://tangent.org/552/libmemcached.html>

=head1 AUTHOR

Brian Aker, E<lt>brian@tangent.orgE<gt>

=head1 SEE ALSO

memcached(1) libmemcached(3) memcached_strerror(3)

=cut

1;
