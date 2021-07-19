# 说明

给用户或者组设置 sudo 免密码登录。

- 变量

  ```text
  1. sudo_users：列表。列表的每一项是一个字典，包含 name 和 state 字段。设置要免密码登录的用户列表。
  2. sudo_groups：列表。列表的每一项是一个字典，包含 name 和 state 字段。设置要免密码登录的组列表。
  ```

- 命令行方式执行

  ```shell
  ansible-playbook main.yaml -e '{"host": "10.100.2.1", "role": "sudo", "sudo_users": [{"name": "zhangsanfeng", "state": "present"}], "sudo_groups": [{"name": "wheel", "state": "present"}]}'
  ```
