# 说明

- 模块功能  
   该角色用于修改机器的主机名。

- 变量

  ```text
  hostname: 修改后的主机名。
  ```

- 使用

  ```text
  - host: 10.0.100.1
    roles:
      - role: hostname
        vars:
          hostname: vm01.test.com
  ```
