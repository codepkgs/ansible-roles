# 变量说明

```text
1. install_configs
需要复制的配置文件列表。
列表，里面是字典，每个字典需要有 src 和 dest 属性，格式如下：

install_configs: [
  {
    'src': 'source-config',  # 源文件名，位于 files 目录中。
    'dest': 'dest-path'      # 复制到的目标路径，绝对路径。
  }
]

2. custom_install_configs
用户自定义的配置文件列表，优先于 install_configs
列表，里面是字典，每个字典需要有 src 和 dest 属性，格式和 install_configs 一样。

3. start_php72_service
是否启动 php72-fpm 服务，默认 yes。表示启动该服务，并设置开机自动启动。
如果是 no，则表示停止服务，并取消开机自动启动。
```
