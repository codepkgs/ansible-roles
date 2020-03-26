# 作用和变量
* 作用
```text
用于安装和配置 dhcp 服务器端以及 DHCP RELAY。
```

* DHCP Relay 相关的变量
```text
enable_role: dhcrelay # 启动 dhcp relay 功能。 如果要同时启动 dhcp server 和 dhcp relay 功能，指定为 all。

dhcrelay:     # dhcp relay 相关的参数
  dhcp_servers: ['10.0.100.1', '10.0.100.2']  # dhcp 服务器的地址，可以指定多个。
  listen_interfaces: ['eth0']   # dhcp relay 监听的接口，可以指定多个。
```

* DHCP 服务器端相关的变量
```text
启动 dhcp 功能。
enable_role: dhcp

1. global段，用于指定全局配置
listen_address：指定 dhcp 服务器监听的地址，如果没有定义，则监听在所有地址。必须是一个有效的 IP 地址。
ddns_update_style：ddns 更新类型，有效的值有 none、interim、ad-hoc
allow_bootp：是否允许 bootp
unknown_clients：是否允许为未知的客户端分配地址。默认是 True。
default_lease_time：指定默认租期时间。如果没有指定，则默认是14400s
max_lease_time：指定最大租期时间。如果没有指定，则默认是28800s
domain_name: 指定分配的域名
domain_name_servers：指定分配的 dns 服务器。

2. subnets段，定义分配的子网信息，可以定义多个。列表
subnets:
  - network: 10.0.100.0             # 定义分配的子网，必须。
    netmask: 255.255.255.0          # 定义分配的子网掩码，必须。
    start_ip: 10.0.100.101          # 定义分配的起始 IP 地址，必须。
    end_ip: 10.0.100.109            # 定义分配的结束 IP 地址，必须。
    gateway: 10.0.100.254           # 定义分配的网关地址，必须。
    domain_name: "fdisk.cc"         # 定义domain_name。可省略。
    domain_name_servers: ['1.1.1.1', '2.2.2.2'] # 定义 name server。可省略。
    extra_options:                  # 定义 subnet 级别的自定义选项。可省略。
      option_ntp_server: ntp.fdisk.cc # 自定义选项，需满足 DHCP 的配置规范。
    fixed_addresses:                # 分配固定 IP 地址。可省略该字段。可以定义多个。
      - hostname: vm02.fdisk.cc     # 如果客户端没有定义主机名（localhost.locadomain），则使用分配的主机名。必须。
        ip_address: 172.16.1.1      # 分配的固定 IP 地址。必须。
        mac_address: 00:00:00:00:01   # 客户端的 MAC 地址。必须
        extra_options:              # 为该主机设置额外的选项。可省略。
          next_server: 1.1.1.1      # 用户自定义的针对该主机的配置。需满足 DHCP 的配置规范。
```