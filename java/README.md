# 说明

安装java 8 或java 11

* 变量
    ```text
    java_version    # 指定要安装的java版本。可以是8或11
    ```

* 示例
    ```text
    - hosts: 10.0.100.
      roles:
        - role: java
          tags: java
          vars:
            java_version: 8
    ```