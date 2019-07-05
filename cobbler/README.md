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
    domain_name: "fdisk.cc"                                 # 定义dhcp分配的domain
    domain_name_servers: "10.100.5.201, 10.100.5.202"       # 定义dns服务器的地址
    dhcp_range: "10.100.5.202 10.100.5.210"                 # 定义分配的IP地址范围
    dhcp_network: "10.100.0.0"                              # 定义分配的IP网段
    dhcp_netmask: "255.255.240.0"                           # 定义分配的IP掩码
    dhcp_gateway: "10.100.0.1"                              # 定义分配的网关
    default_password: "$1$68LXrXWp$ptU5pvNlt95yBzER.Ut2j1"  # 装机时默认的密码，使用openssl passwd -1 'your-password'产生。默认是P@ssw0rd
    ```
