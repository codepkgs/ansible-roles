# 说明

安装 zabbix 5.0

# 变量

- zabbix_server_address
  zabbix agent 模式时，zabbix server 的地址。

- zabbix_agent_active
  zabbix agent 工作的模式。True 则为 active 模式，默认为 passive 模式。

- zabbix_agent_hostmetadataitem
  zabbix agent 工作在 active 模式时的主机元数据条目。默认是 system.uname。通过该参数可区分是 Linux 还是 Windows。

- zabbix_agent_refreshactivechecks
  zabbix agent 工作在 active 模式时，多长时间更新一次数据。默认是 60。最小为 60
