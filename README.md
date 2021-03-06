# sql-ksuid

SQL functions to create a KSUID as per the specification found in https://github.com/segmentio/ksuid.
See also https://segment.com/blog/a-brief-history-of-the-uuid/.

Please note that I've used the time offset found in https://github.com/segmentio/ksuid rather than the one stated in the blog post.

## Install the function:

Copy the contents from either mysql-ksuid.sql or postgresql-ksuid.sql and execute it in your database to create the sql function `generate_ksuid`.

## Usage:

```sql

mysql> SELECT generate_ksuid();
+-----------------------------+
| generate_ksuid()            |
+-----------------------------+
| 1pMOG1kx5dph1rWdzeEsgSOUNRQ |
+-----------------------------+
1 row in set (0.00 sec)

 ```

Inspecting the resulting ksuid using the command line tool from https://github.com/segmentio/ksuid gives:

```shell
ksuid -f inspect 1pMOG1kx5dph1rWdzeEsgSOUNRQ

REPRESENTATION:

  String: 1pMOG1kx5dph1rWdzeEsgSOUNRQ
     Raw: 0CD07A50EF4B3FCC734CF362729F020AE3343090

COMPONENTS:

       Time: 2021-03-06 11:09:52 +1100 AEDT
  Timestamp: 214989392
    Payload: EF4B3FCC734CF362729F020AE3343090

``` 