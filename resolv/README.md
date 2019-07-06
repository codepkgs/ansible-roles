# 说明

用于配置/etc/resolv.conf

* 变量
    ```text
    resolv_search       # 定义搜索域。列表。默认为空
    resolv_domain       # 定义所在域。字符串。默认为空
    resolv_options      # 定义域名解析时的选项。列表。如果没有定义，使用默认值: options rotate timeout:2 attempts:3
    resolv_nameservers  # 定义nameserver。列表。默认为空。
    ```

* 使用
    ```text
    - hosts: all
      roles:
        - role: resolv
          vars:
            resolv_search:
              - "fdisk.cc"
              - "felix.com"
            resolv_domain: "fdisk.cc"
            resolv_options:
              - "timeout:2"
              - "attempts:3"
            resolv_nameservers:
              - "223.5.5.5"
              - "223.6.6.6"
    ```