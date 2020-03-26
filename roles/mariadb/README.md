# 说明
* 功能
    ```text
    1. 安装mariadb并启动
    2. 修改bind-address的地址
    ```

* 变量
    ```text
    mariadb_bind_address        # 修改mariadb的bind-address。默认是127.0.0.1
    ```

* 使用
    ```json
    - hosts: 192.168.1.1
      roles:
        - role: mariadb
          tags: mariadb
          vars:
            - mariadb_bind_address: 127.0.0.1
    ```