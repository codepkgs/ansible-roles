# 说明

创建或删除目录，以及修改目录的权限。

* 变量
    ```text
    dirs: 列表。定义要创建的目录。每一个目录可以单独指定owner、group以及mode。path为必选。state可以是absent或directory。

    示例：
    dirs:
    - path: /data/logs
      state: directory
      owner: root
      group: root
      mode: 755

    如果没有指定owner、group，则默认为root，如果没有指定mode，默认为755。默认的state为directory
    ```