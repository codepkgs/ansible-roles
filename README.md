# 说明

- ansible version

  ```text
  ansible [core 2.14.2]
  config file = None
  configured module search path = ['/Users/myname/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/Cellar/ansible/7.2.0/libexec/lib/python3.11/site-packages/ansible
  ansible collection location = /Users/myname/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.11.4 (main, Jun 20 2023, 16:59:59) [Clang 14.0.3 (clang-1403.0.22.14.1)] (/usr/local/Cellar/ansible/7.2.0/libexec/bin/python3.11)
  jinja version = 3.1.2
  libyaml = True
  ```

- python version

  ```text
  Python 3.10.12
  ```

- redis 缓存

  ```text
  可以使用 redis 存储 facts 信息。可以在 ansible.cfg 中修改。

  安装redis模块：pip install redis

  gathering = smart
  fact_caching = redis
  fact_caching_timeout = 604800
  fact_caching_connection = <redis-host>:<redis-port>:<redis-db>:<redis-password>
  ```

- 系统

  ```text
  roles主要针对 RedHat 系列，主要是 CentOS 7. 其他的系统没有做过充分的测试。
  ```

- role.yaml

  执行单独的 role 时使用该文件。

  ```text
  该文件为 anbile-roles 的入口文件，使用该文件时需要传递如下几个变量：
  1. host。指定要操作的机器或机器组。
  2. role。指定要使用的角色名。
  3. facts。是否启用gather_facts功能。默认是yes。

  针对roles中的一些变量，需要使用-e参数传递。

  示例：使用hostname这个role修改主机名
  ansible-playbook main.yaml -e host=10.100.2.1 -e role=hostname -e hostname='vm01.fdisk.cc'
  ```

- main.yaml

  所有机器的 ansible 配置的入口文件。
