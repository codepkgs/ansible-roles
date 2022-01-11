# 说明

安装 java 8 或 java 11 或 最新版本（latest）

支持 RedHat 、Debian 系列的机器。

- 变量

  ```text
  java_version    # 指定要安装的java版本。默认是11。redhat和debian支持的版本不同。
  ```

- 示例

  ```text
  - hosts: 10.0.100.1
    roles:
      - role: java
        tags: java
        vars:
          java_version: 11
  ```

- 通过 playbook 执行

  ```text
  ansible-playbook main.yaml -e '{"role": "java", "host": "10.100.2.1", "java_version": "11"}'
  ```
