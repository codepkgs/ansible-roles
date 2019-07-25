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
    ```

* 使用
    ```json
    - hosts: 192.168.1.1
      roles:
        - role: nginx
          tags: nginx
          vars:
            - nginx_delete_config: yes
    ```