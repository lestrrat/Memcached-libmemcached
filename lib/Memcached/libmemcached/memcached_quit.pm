package Memcached::libmemcached::memcached_quit;

=head1 NAME

memcached_quit - Disconnect from all servers

=head1 LIBRARY

C Client Library for memcached (libmemcached, -lmemcached)

=head1 SYNOPSIS

  #include <memcached.h>

  void memcached_quit (memcached_st *ptr);

=head1 DESCRIPTION

memcached_quit() will disconnect you from all currently connected servers.
It will also reset the state of the connection (ie, any memcached_fetch() you
are in the middle of will be terminated). This function is called
automatically when you call memcached_free() on the C<memcached_st> structure.

You do not need to call this on your own. All operations to change server
hashes and parameters will handle connections to the server for you. This
function is provided mainly so that you can timeout your connections or
reset connections during the middle of a memcached_fetch().

=head1 RETURN

A value of type C<memcached_return> is returned
On success that value will be C<MEMCACHED_SUCCESS>.
Use memcached_strerror() to translate this value to a printable string.

=head1 HOME

To find out more information please check:
L<https://launchpad.net/libmemcached>

=head1 AUTHOR

Brian Aker, E<lt>brian@tangent.orgE<gt>

=head1 SEE ALSO

memcached(1) libmemcached(3) memcached_strerror(3)

=cut

1;
