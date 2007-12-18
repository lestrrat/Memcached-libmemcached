#include "common.h"

char *memcached_strerror(memcached_st *ptr, memcached_return rc)
{
  switch (rc)
  {
  case MEMCACHED_SUCCESS:
    return "SUCCESS";
  case MEMCACHED_FAILURE:
    return "FAILURE";
  case MEMCACHED_HOST_LOOKUP_FAILURE:
    return "HOSTNAME LOOKUP FAILURE";
  case MEMCACHED_CONNECTION_FAILURE:
    return "CONNECTION FAILURE";
  case MEMCACHED_CONNECTION_BIND_FAILURE:
    return "CONNECTION BIND FAILURE";
  case MEMCACHED_READ_FAILURE:
    return "READ FAILURE";
  case MEMCACHED_UNKNOWN_READ_FAILURE:
    return "UNKNOWN READ FAILURE";
  case MEMCACHED_PROTOCOL_ERROR:
    return "PROTOCOL ERROR";
  case MEMCACHED_CLIENT_ERROR:
    return "CLIENT ERROR";
  case MEMCACHED_SERVER_ERROR:
    return "SERVER ERROR";
  case MEMCACHED_WRITE_FAILURE:
    return "WRITE FAILURE";
  case MEMCACHED_CONNECTION_SOCKET_CREATE_FAILURE:
    return "CONNECTION SOCKET CREATE FAILURE";
  case MEMCACHED_DATA_EXISTS:
    return "CONNECTION DATA EXISTS";
  case MEMCACHED_DATA_DOES_NOT_EXIST:
    return "CONNECTION DATA DOES NOT EXIST";
  case MEMCACHED_NOTSTORED:
    return "NOT STORED";
  case MEMCACHED_STORED:
    return "STORED";
  case MEMCACHED_NOTFOUND:
    return "NOT FOUND";
  case MEMCACHED_MEMORY_ALLOCATION_FAILURE:
    return "MEMORY ALLOCATION FAILURE";
  case MEMCACHED_PARTIAL_READ:
    return "PARTIAL READ";
  case MEMCACHED_SOME_ERRORS:
    return "SOME ERRORS WERE REPORTED";
  case MEMCACHED_NO_SERVERS:
    return "NO SERVERS DEFINED";
  case MEMCACHED_END:
    return "SERVER END";
  case MEMCACHED_DELETED:
    return "SERVER DELETE";
  case MEMCACHED_VALUE:
    return "SERVER VALUE";
  case MEMCACHED_STAT:
    return "STAT VALUE";
  case MEMCACHED_ERRNO:
    return "SYSTEM ERROR";
  case MEMCACHED_FAIL_UNIX_SOCKET:
    return "COULD NOT OPEN UNIX SOCKET";
  case MEMCACHED_NOT_SUPPORTED:
    return "ACTION NOT SUPPORTED";
  case MEMCACHED_FETCH_NOTFINISHED:
    return "FETCH WAS NOT COMPLETED";
  case MEMCACHED_NO_KEY_PROVIDED:
    return "A KEY LENGTH OF ZERO WAS PROVIDED";
  case MEMCACHED_TIMEOUT:
    return "A TIMEOUT OCCURRED";
  case MEMCACHED_MAXIMUM_RETURN:
    return "Gibberish returned!";
  default:
    return "Gibberish returned!";
  };
}
