# 说明

安装capistrano相关的软件包。依赖于gem，需要ruby>=2.2.6

* 使用
    ```text
    - hosts: 10.0.100.1 
    roles:
        - role: ruby
        - role: capistrano
    ```