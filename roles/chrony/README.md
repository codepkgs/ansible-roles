# 说明

- 功能

  该 role 用于安装并配置`chrony`服务，并关闭`ntpd`服务，如果没有配置 chronyd_upstream_servers 变量，则采用阿里云的 ntp 服务器(`ntp.aliyun.com`).

- 变量

  ```text
  chrony_upstram_servers: 定义 chrony upstream 服务器的地址。列表。默认为 ntp.aliyun.com
  chrony_acls: 定义允许/禁止哪些客户端进行时间同步。列表。默认为空。
  ```

- 使用角色
  ```text
  - hosts: all
    roles:
      - role: chrony
        tags: chrony
        vars:
          chrony_upstream_servers:
            - ntp.aliyun.com
          chrony_acls:
            - "allow 10.0.100.0/24"
            - "allow 192.168"
  ```
