# 说明

* 功能
    ```text
    1. 安装并初始化nginx。
    2. 目录
        certs       # 存储所有的SSL证书
        conf.d      # 存储所有的nginx配置，以.conf结尾的文件会被导入。
    3. 日志目录
        日志存储在/data/logs/nginx下。

    4. nginx logrotate
        logrotate目录为/data/logs/nginx/*.log结尾的文件。
        脚本位置: /opt/scripts/logroate_nginx
        执行频率: 每天23:59分执行
        保留时间: 7天
    ```

* 变量
    ```text
    nginx_delete_config     # 是否删除nginx的默认配置。默认配置位于/etc/nginx/conf.d/default.conf。yes或no
    nginx_certs_dir         # nginx certs目录的位置，不要以/结尾。
    nginx_config_dir        # nginx 配置文件的目录位置，不要以/结尾。
    ```

* 注意
    ```text
    nginx_config_dir和nginx_certs_dir会删除目标机器目录上的文件，这些文件没有出现在源目录中。
    如果想关闭这种行为，需要在tasks/main.yaml中，将delete设置为no
    ```

* 使用
    ```json
    - hosts: 192.168.1.1
      roles:
        - role: nginx
          tags: nginx
          vars:
            - nginx_delete_config: yes
            - nginx_certs_dir: ~/nginx/certs
            - nginx_config_dir: ~/nginx/conf.d
    ```