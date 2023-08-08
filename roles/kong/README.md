# 依赖

kong 依赖于 postgresql 数据库，所以需要安装 postgresql 数据库。
可以直接使用 role/postgresql 安装，也可以使用其他方式安装。

# 创建 kong 数据库

```sql
postgres=# CREATE USER kong WITH PASSWORD 'Kong123$';
CREATE ROLE
postgres=# CREATE DATABASE kong OWNER kong;
CREATE DATABASE
postgres=# GRANT ALL PRIVILEGES ON DATABASE kong TO kong;
GRANT
postgres=#
```

# 创建 konga 数据库

```sql
postgres=# CREATE USER konga WITH PASSWORD 'Konga123$';
CREATE ROLE
postgres=# CREATE DATABASE konga OWNER konga;
CREATE DATABASE
postgres=# GRANT ALL PRIVILEGES ON DATABASE konga TO konga;
GRANT
postgres=#
```

# Kong

- 版本: `3.3.*`

# 变量

| 变量名                          | 说明                                    | 默认值                   |
| ------------------------------- | --------------------------------------- | ------------------------ |
| kong_db_host                    | kong 使用的 pg 数据库地址               | 127.0.0.1                |
| kong_db_port                    | kong 使用的 pg 数据库的端口             | 5432                     |
| kong_db_name                    | kong 使用的 pg 数据库的名称             | kong                     |
| kong_db_user                    | kong 使用的 pg 数据库的用户             | kong                     |
| kong_db_password                | kong 数据库的密码 ｜无默认值，必须指定  |
| konga_db_host                   | konga 使用的 pg 数据库地址              | 默认为 kong_db_host 的值 |
| konga_db_port                   | konga 使用的 pg 数据库的端口            | 默认为 kong_db_port 的值 |
| konga_db_name                   | konga 使用的 pg 数据库的名称            | konga                    |
| konga_db_user                   | konga 使用的 pg 数据库的用户            | konga                    |
| konga_db_password               | konga 数据库的密码 ｜无默认值，必须指定 |
| kong_proxy_http_listen_address  | kong 代理端口地址                       | 0.0.0.0                  |
| kong_proxy_http_listen_port     | kong 代理端口端口                       | 8000                     |
| kong_proxy_http_listen_backlog  | kong 代理 http backlog 大小             | 16384                    |
| kong_proxy_https_listen_address | kong 代理 https 地址                    | 0.0.0.0                  |
| kong_proxy_https_listen_port    | kong 代理 https 端口                    | 8443                     |
| kong_proxy_https_backlog        | kong 代理 https backlog 大小            | 16384                    |
| kong_admin_http_listen_address  | kong 管理端口地址                       | 127.0.0.1                |
| kong_admin_http_listen_port     | kong 管理端口端口                       | 8001                     |
| kong_admin_http_listen_backlog  | kong 管理 http backlog 大小             | 16384                    |
| kong_admin_https_listen_address | kong 管理 https 地址                    | 127.0.0.1                |
| kong_admin_https_listen_port    | kong 管理 https 端口                    | 8444                     |
| kong_admin_https_backlog        | kong 管理 https backlog 大小            | 16384                    |

# 示例

```yaml
- hosts: 172.16.158.51
  become: true
  become_user: root
  roles:
    - role: kong
      tags: kong
      vars:
        kong_db_host: "127.0.0.1"
        kong_db_port: 5432
        kong_db_name: kong
        kong_db_user: kong
        kong_db_password: "Kong123$"
        konga_db_host: "127.0.0.1"
        konga_db_port: 5432
        konga_db_name: konga
        konga_db_user: konga
        konga_db_password: "Konga123$"
        kong_proxy_http_listen_port: 80
        kong_proxy_https_listen_port: 443
```
