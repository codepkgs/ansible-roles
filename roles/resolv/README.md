# 说明

用于配置 `/etc/resolv.conf`

- 变量

  ```text
  resolv_search       # 定义搜索域。列表。默认为空
  resolv_domain       # 定义所在域。字符串。默认为空
  resolv_options      # 定义域名解析时的选项。默认值: options rotate timeout:2 attempts:3
  resolv_nameservers  # 定义nameserver。列表。默认为空。如果多余3个，则取前三个。
  ```

- 使用

  ```yaml
  - hosts: all
    roles:
      - role: resolv
        vars:
          resolv_search:
            - "fdisk.cc"
            - "felix.com"
          resolv_domain: "fdisk.cc"
          resolv_options: "rotate timeout:2 attempts:3"
          resolv_nameservers:
            - "223.5.5.5"
            - "223.6.6.6"
  ```

- 命令行方式执行

  ```shell
  ansible-playbook main.yaml -e '{"host": "10.100.2.1", "role": "resolv", "resolv_domain": "fdisk.cc", "resolv_search": ["fdisk.cc"], "resolv_nameservers": ["223.5.5.5", "115.114.114.114"]}'
  ```
