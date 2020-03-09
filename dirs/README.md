# 说明

创建或删除目录，以及修改目录的权限。

* 变量
    ```text
    dirs: 列表。定义要创建或删除的目录列表。每一个目录可以单独指定owner、group以及mode。
      path：必选项目，指定要创建的目录的路径。
      state：指定是创建目录还是删除目录，默认是 directory。absent 表示删除目录。directory 表示创建目录。
      owner 和 group：指定要创建的目录的 owner 和 group。默认是 root
      mode：目录的权限。默认是755

    示例：
    dirs:
    - path: /data/logs
      state: directory
      owner: root
      group: root
      mode: 755
    ```