# 说明
用于安装和配置openresty

# 变量
```text
openresty_user: 指定运行openresty的用户。默认是nginx
openresty_group: 指定运行openresty的组。默认是nginx
openresty_log_dir: 指定openresty的日志目录。默认是/usr/local/openresty/nginx/logs
openresty_pid_dir: 指定openresty的pid目录。默认是/run
openresty_certs_dir: 指定openresty的证书目录。默认是/usr/local/openresty/nginx/conf/certs
openresty_extra_config_dir: 指定openresty额外的配置目录，用户主配置文件include。默认是/usr/local/openresty/nginx/conf/conf.d
```

# 使用
```yaml
- hosts: 10.0.100.1
  roles:
    - role: openresty
      tags: openresty
      vars:
        openresty_log_dir: /data/logs/nginx
```