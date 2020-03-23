# 创建用户
```text
变量：create_users，字典形式

username：必选，要创建的用户名
home: 用户的家目录。默认 /home
shell:  用户的默认 shell。默认是 /bin/bash
group:  用户的主组。默认和用户名相同。
groups: 用户的附属组。默认空。如果用户要启用 sudo，则要增加 wheel。
comment: 用户的注释。默认由系统决定。
system: 是否为系统用户。默认 no
create_home: 是否创建用户的家目录。默认是 yes
generate_ssh_key: 是否为用户产生 ssh key pair，默认 no

# 示例
vars:
  create_usrs:
    - username: zhangsan
      shell: /bin/zsh
      groups: ['wheel']
      create_home: yes
```

# 删除用户
```text
变量：delete_users，字典形式。

username: 要删除的用户名，必选
remove_home: 删除用户的同时，是否删除用户家目录。默认 yes。

# 示例
vars:
  delete_users:
    - username: zhangsan
      remote_home: yes
```