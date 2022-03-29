# 说明

- 功能

  安装并配置 jenkins

- 变量

  ```text
  所有的变量均可选。

  jenkins_secret_show: no                 # 是否展示 jenkins 的 secret。默认是 no。
  jenkins_shell: /bin/bash                # 设置jenkins的bash。默认是/bin/bash
  jenkins_ssh_key: yes                    # 是否产生jenkins ssh key, 只有当jenkins_shell为/bin/bash可用。默认为yes
  jenkins_http_port: 8080                 # 定义jenkins监听的端口。默认8080
  jenkins_http_listen_address: ''         # 定义jenkins监听的地址。默认0.0.0.0
  jenkins_https_port: ''                  # 定义jenkins监听的https端口。默认空。
  jenkins_https_listen_address: ''        # 定义jenkins监听的https地址。默认0.0.0.0
  jenkins_https_keystore: ''              # 定义jenkins的keystore。默认空
  jenkins_https_keystore_password: ''     # 定义jenkins的keystore的密码。默认空
  jenkins_handler_max: '100'              # 定义jenkins最大启动的http worker进程数量。默认100
  jenkins_handler_idle: '20'              # 定义jenkins最大的空闲的http worker进程数量。默认20
  jenkins_args: ''                        # jenkins启动的其他参数。
  ```
