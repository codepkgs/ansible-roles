# 说明
* 功能  
    安装和配置cobbler, 推荐使用一台新的机器作为cobbler服务器。

* 安装的服务
    ```text
    httpd
    dhcpd
    tftpd
    cobbler
    ```

* 变量
    ```text
    cobbler_domain_name: "fdisk.cc"                                 # 定义dhcp分配的cobbler_domain
    cobbler_domain_name_servers: "10.100.5.201, 10.100.5.202"       # 定义dns服务器的地址
    cobbler_dhcp_range: "10.100.5.202 10.100.5.210"                 # 定义分配的IP地址范围
    cobbler_dhcp_network: "10.100.0.0"                              # 定义分配的IP网段
    cobbler_dhcp_netmask: "255.255.240.0"                           # 定义分配的IP掩码
    cobbler_dhcp_gateway: "10.100.0.1"                              # 定义分配的网关
    cobbler_default_password: "$1$68LXrXWp$ptU5pvNlt95yBzER.Ut2j1"  # 装机时默认的密码，使用openssl passwd -1 'your-password'产生。默认是P@ssw0rd
    ```

* 使用
    ```text
    - host: all
      roles:
        - role: cobbler
            vars:
            cobbler_domain_name: "fdisk.cc"
            cobbler_domain_name_servers: "10.0.100.1"
            cobbler_dhcp_range: "10.0.100.98 10.0.100.99"
            dobbler_dhcp_network: "10.0.100.0"
            cobbler_dhcp_netmask: "255.255.255.0"
            cobbler_dhcp_gateway: "10.100.0.254"
            cobbler_default_password: "$1$ta0cyI2Z$CHpEuSN.Nm60y2eXMrAaj."
    ```

# cobbler repo
* zabbix
    ```bash
    cobbler repo add --name zabbix-4.2 --arch x86_64 --mirror https://repo.zabbix.com/zabbix/4.2/rhel/7/x86_64
    ```

* salt
    ```bash
    cobbler repo add --name salt-latest --arch x86_64 --mirror http://repo.saltstack.com/yum/redhat/7/x86_64/latest
    ```

# 客户端重装系统
* koan
    ```text
    1. 安装koan
    yum install -y koan

    2. 查看profiles、systems
    koan --server <cobbler_server> --port <cobbler_port> --profiles
    koan --server <cobbler_server> --port <cobbler_port> --systems

    3. 重装系统

    指定使用的profile:
    koan --server <cobbler_server> --port <cobbler_port> --profile <profile> -r

    指定使用的system:
    koan --server <cobbler_server> --port <cobbler_port> --system <system> -r

    4. reboot
    ```