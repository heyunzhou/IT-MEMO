## 1.SQL执行顺序

```sql
(8) SELECT (9)DISTINCT<Select_list>
(1) FROM <left_table> (3) <join_type>JOIN<right_table>
(2) ON<join_condition>
(4) WHERE<where_condition>
(5) GROUP BY<group_by_list>
(6) WITH {CUBE|ROLLUP}
(7) HAVING<having_condtion>
(10) ORDER BY<order_by_list>
(11) LIMIT<limit_number>
```

## 2.备份数据迁移

### mysqldump

#### a. 全库备份

```sql
mysqldump --opt --single-transaction --master-data=2 --default-character-set=utf8 -h<host> -u<user> -p<password> -A > backup.sql
```

- `--opt` 如果有这个参数表示同时激活了mysqldump命令的quick，add-drop-table，add-locks，extended-insert，lock-tables参数，它可以给出很快的转储操作并产生一个可以很快装入MySQL服务器的转储文件。当备份大表时，这个参数可以防止占用过多内存
- `--single-transaction` 设置事务的隔离级别为可重复读，然后备份的时候开启事务，这样能保证在一个事务中所有相同的查询读取到同样的数据。注意，这个参数只对支持事务的引擎有效，如果有 `MyISAM` 的数据表，并不能保证数据一致性
- `-A` 导出全部数据库
- `–-default-character-set=charset` 指定导出数据时采用何种字符集
- `--master-data=2` 表示在备份过程中记录主库的 `binlog` 和 `pos` 点，并在dump文件中注释掉这一行，在使用备份文件做新备库时会用到

#### b.备份多个库

```sql
mysqldump -h<host> -u<user> -p<password> --databases <dbname1> <dbname2> > backup.sql
```

#### c.备份表指定条件

```sql
mysqldump -u<user> -p<password> --no-create-info --databases db1 --tables a1 --where="id='a'" > backup.sql
```

#### d.恢复

```sql
mysql -h<host> -u<user> -p<password> < backup.sql
```

#### 参考资料

mysql备份策略
https://segmentfault.com/a/1190000019955399
