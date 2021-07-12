# 说明

- 功能

  该 role 用于安装并配置 `ntp` 服务，并关闭 `chronyd` 服务，如果没有配置 `ntp_servers` 变量，则采用阿里云的 `ntp` 服务器(`ntp.aliyun.com`).

- 变量

  ```text
  local_as_server: 是否启用本地时间服务器。默认False，即不启用。
  ntp_servers: 定义ntp服务器的地址。列表。默认为 ntp.aliyun.com
  ntp_restrict: 定义允许哪些客户端进行时间同步。列表，列表中的每一项为字典，每个字典需要有 `network` 和 `netmask` 字段。默认为空。
  ```

- 使用角色

  ```text
  - hosts: all
    roles:
      - role: ntp
        tags: ntp
        vars:
          ntp_servers:
            - ntp.aliyun.com
          ntp_restricts:
            - network: 10.0.100.0
              netmask: 255.255.0.0
  ```

- 命令行使用 `role`

  ```shell
  ansible-playbook main.yaml -e '{"role": "ntpd", "host": "10.100.2.1", "local_as_server": "yes", "ntp_restricts": [{"network": "10.100.2.0", "netmask": "255.255.255.0"}]}'
  ```
