# sql-ksuid

SQL functions to create a KSUID as per the specification found in https://segment.com/blog/a-brief-history-of-the-uuid/.

## Install the function:

Copy the contents from either mysql-ksuid.sql or postgresql-ksuid.sql and execute it in your database to create the sql function `generate_ksuid`.
## Usage:

```sql

mysql> SELECT generate_ksuid();
+-----------------------------+
| generate_ksuid()            |
+-----------------------------+
| 1sYMGEyKzqR4km32gyz94UJoAVa |
+-----------------------------+
1 row in set (0.00 sec)

 ```

Inspecting the resulting ksuid using the command line tool from https://github.com/segmentio/ksuid gives:

```shell
ksuid -f inspect 1sYMGEyKzqR4km32gyz94UJoAVa

REPRESENTATION:

  String: 1sYMGEyKzqR4km32gyz94UJoAVa
     Raw: 0D2CE0EBA75235A73259BAAD05CA04F085E4E92E

COMPONENTS:

       Time: 2021-05-15 12:16:11 +1000 AEST
  Timestamp: 221044971
    Payload: A75235A73259BAAD05CA04F085E4E92E

``` 