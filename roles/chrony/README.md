# 说明

- 功能

  该 role 用于安装并配置 `chrony` 服务，如果没有配置 `chronyd_upstream_servers` 变量，则采用阿里云的 `ntp` 服务器 (`ntp.aliyun.com`).

- 变量

  ```text
  chrony_upstram_servers: 定义 chrony upstream 服务器的地址。列表。默认为 ntp.aliyun.com
  chrony_acls: 定义允许/禁止哪些客户端进行时间同步。列表。默认为空。
  local_as_server: 本地服务器是否作为NTP Server。默认为 false。如果定义了该参数，则还需要定义 chrony_acls 变量，如果没有定义，则该功能不生效。
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

- 命令行执行

  ```shell
  # 1. 启用 chrony，本地作为客户端。
  ansible-playbook main.yaml -e '{"role": "chrony", "host": "10.100.2.1"}'

  # 2. 启用 chrony，并将本地作为NTP服务器。
  ansible-playbook main.yaml -e '{"role": "chrony", "host": "10.100.2.1", "local_as_server": true, "chrony_acls": ["allow 10.100.2.0/24"]}'
  ```
