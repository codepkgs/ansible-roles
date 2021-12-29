# 说明

- 作用

  添加或删除 ssh public key 到指定的用户，指定的用户必须事先存在

- 变量

  ```text
  users: 指定从指定的用户中添加或删除public key。
      格式如下: users中可以指定多个用户。
      users:
        - username: username1             # 要添加或删除的用户名
          state: present | absent         # 期望的状态。absent或present。默认值是present
          key: "http://10.0.100.1/keys/user.pub"          # public key文件的名称,该文件需要放在服务器上。
          key_options: "ssh key options, if not definded, omit"
          key_from: url    # 指定key的来源。可以是url，也可以是file
        - username: username2
          state: present
          key: "~/.ssh/id_rsa.pub"
          key_from: file
  ```

- public key 文件

  ```text
  将需要添加或删除的用户的http服务器的指定目录中，并使用users变量的key参数引用该文件名即可。
  ```
