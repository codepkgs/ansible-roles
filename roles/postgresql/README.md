# 目标机器安装依赖

```bash
yum install -y python2-psycopg2
```

# 变量说明

```text
pg_version： 指定要安装的pg数据库的版本。默认是15。支持11、12、13、14、15
pg_data：指定pg数据库的安装目录。
pg_root_password：指定postgres用户的密码
pg_listen_addresses：指定监听的地址。多个地址使用逗号分隔。默认0.0.0.0
pg_listen_port：指定监听端口。默认5432
```
