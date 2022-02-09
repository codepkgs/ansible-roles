# 说明

安装 zabbix 5.0

# 变量

- zabbix_php72_user
  运行 php72 的用户。默认是 www

- zabbix_nginx_servername
  指定 用于 zabbix 的 nginx 的 servername。默认是机器的 IP 地址。

- zabbix_external_database
  是否使用外部的数据库。默认是 no，表示使用本地数据库（会自动安装 MariaDB 数据库）

- zabbix_db_host
  如果使用外部数据库，则需要定义登录主机。默认是 localhost

- zabbix_db_port
  如果使用外部数据库，则需要定义数据库的端口。默认是 port

- zabbix_db_user
  如果使用外部数据库，则需要定义登录用户。默认是 zabbix

- mysql_unix_socket
  使用 socket 登录 mysql 数据库。默认的 socket 路径为：/var/lib/mysql/mysql.sock

- zabbix_db_password
  zabbix 数据库的密码。默认是 Zabbix1234!@#$

- zabbix_server_logfile
  指定 zabbix server 的日志文件路径。默认是：/var/log/zabbix/zabbix_server.log

- zabbix_server_cachesize
  指定存储 host、item、trigger 数据的共享内存的大小。默认是 128M

- zabbix_server_historycachesize
  指定存储历史数据的共享内存大小。默认是 256M

- zabbix_server_historyindexcachesize
  指定存储历史数据索引的共享内存大小。默认是 64M

- zabbix_server_treadcachesize
  指定存储趋势数据的共享内存大小。默认是 64M

- zabbix_server_valuecachesize
  指定存储 item 历史数据请求的共享内存大小。默认是 128M

- zabbix_server_alertscriptpath
  指定 alertscript 路径。默认是/usr/lib/zabbix/alertscripts

- zabbix_server_externalscriptpath
  指定 externalscript 路径。默认是 /usr/lib/zabbix/externalscripts

- zabbix_server_allowroot
  zabbix server 是否允许 root 用户运行。默认是 1（允许）。0 表示不允许
