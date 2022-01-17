# 说明

- 功能
  受支持的版本：10.5、10.6、10.7。默认安装 10.6 版本

- 变量

  ```text
  mariadb_version               # 要安装的mariadb版本。默认10.6
  mariadb_client_configs        # 存放MariaDB Client端的配置信息。字典形式
  mariadb_server_configs        # 存放MariaDB Server端的配置信息。字典形式。默认绑定的地址：127.0.0.1
  ```

- 使用
  ```json
  - hosts: 192.168.1.1
    roles:
      - role: mariadb
        tags: mariadb
  ```
