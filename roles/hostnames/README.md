# 说明

- 模块功能  
   该角色用于修改机器的主机名。

- 变量

  ```text
  需要传递一个变量 hostnames，其中host定义了该主机在inventory中的名称，hostname表示要设置的主机名
  ```

- 使用

  ```text
  - host: all
    roles:
      - role: hostnames
        vars:
          hostnames:
            - host: 10.0.100.1
              hostname: vm01.test.com
  ```
