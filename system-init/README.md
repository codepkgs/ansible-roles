# 说明

* 作用

  该模块主要用于实现系统初始化的功能。

* 变量
    ```text
    packages: 列表。指定需要安装的软件包。

    limits: 列表。设置limit。

    tzname: 设置时区。默认是Asia/Shanghai

    disable_services: rhel系列的机器会关闭的服务。

    disable_services_rhel6: rhel6系列会关闭的服务。

    disable_services_rhel7: rhel7系列会关闭的服务。
    ```