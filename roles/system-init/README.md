# 说明

- 作用

  该模块主要用于实现系统初始化的功能。

- 变量

  ```text
  disable_password_authentication: 是否关闭ssh密码认证。yes或no。除非你知道会发生什么，否则将该选项设置为no。

  permit_root_login: 是否允许root用户登录。PermitRootLogin选项。默认是no，表示不允许root用户登录。

  packages: 列表。指定需要安装的软件包。

  limits: 列表。设置limit。

  tzname: 设置时区。默认是Asia/Shanghai

  disable_services: rhel系列的机器会关闭的服务。

  disable_services_rhel6: rhel6系列会关闭的服务。

  disable_services_rhel7: rhel7系列会关闭的服务。

  disable_swap: 是否关闭swap。默认是yes

  sysctl_config: 设置sysctl内核参数
  ```
