# 说明

安装 java 8 或 java 11

- 变量

  ```text
  java_version    # 指定要安装的java版本。可以是8或11
  ```

- 示例

  ```text
  - hosts: 10.0.100.1
    roles:
      - role: java
        tags: java
        vars:
          java_version: 8
  ```

- 通过 playbook 执行

  ```text
  ansible-playbook main.yaml -e '{"role": "java", "host": "10.100.2.1", "java_version": "11"}'
  ```
