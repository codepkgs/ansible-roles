# 说明

* 功能
    * 安装nodejs和pm2，安装的版本为最新的nodejs版本。
    * 指定运行nodejs项目的用户，默认是www。
    * 为运行pm2的项目设置logrotate
    * 设置logroate的crontab，crontab在指定的用户下。

* 变量
    ```text
    nodejs_user         # 指定运行nodejs项目的用户。默认是www
    nodejs_logs         # 保留多少份日志。默认是5天
    ```

* 使用
    ```json
    - hosts: 10.0.100.1
      roles:
        - role: nodejs
          tags: nodejs
          vars:
            - nodejs_user: root
            - nodejs_logs: 10
    ```