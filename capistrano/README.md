# 说明

安装capistrano相关的软件包。依赖于gem，需要ruby>=2.2.6

* 依赖
    ```text
    该role依赖于role ruby，会自动安装ruby
    ```

* 使用
    ```text
    - hosts: 10.0.100.1 
    roles:
        - role: ruby
        - role: capistrano
    ```