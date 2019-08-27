# 说明

    安装和配置php-fpm。

    默认会创建www用户和组，用来运行php-fpm。
    
    pm相关的配置：
    pm = static
    pm.max_children = 100
    pm.start_servers = 5
    pm.min_spare_servers = 5
    pm.max_spare_servers = 35

    listen配置：
    listen = 127.0.0.1:9000
    listen.backlog = 32768
    listen.allowed_clients = 127.0.0.1

* 变量
    ```text
    php_log_dir         指定php日志目录。
    ```