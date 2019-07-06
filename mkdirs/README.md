# 说明

创建目录

* 变量
    ```text
    dirs: 列表。定义要创建的目录。每一个目录可以单独指定owner、group以及mode。path为必选。

    示例：
    dirs:
    - path: /data/logs
        owner: root
        group: root
        mode: 755

    如果没有指定owner、group，则默认为root，如果没有指定mode，默认为755
    ```