# 说明

安装并配置 PHP72。
默认会创建 www 用户，并且将 php72-php-fpm 的进程 user 和 group 均使用该用户运行。

日志目录：/data/logs/php-seaslog 和 /data/logs/php-fpm

# 变量

- php72_service_start
  安装完成后是否启动 php-fpm。如果设置为 no，如果 php-fpm 已经启动，则会停止。

- php72_configs
  定义 PHP72 的配置，是一个列表，列表中的每一项是一个字典。字典需要至少包含 3 个选项：
  path: 配置文件的路径。
  name: 配置的参数名
  value: 参数名对应的参数值。
  regexp（可选）: 表示搜索的内容，默认等同于 name。如果 name 中包含有特殊字符，则要使用 regexp。

- php72_extra_configs
  用户自定义的额外的配置，格式等同于 php72_configs。用户自定义的参数会覆盖 php72_configs 同名参数。
