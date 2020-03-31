# 变量说明
```text
1. nfs_server
默认 yes。是否作为 nfs 服务器端。如果是 no，则表示作为客户端，只安装一些 nfs 软件，不配置 /etc/exports

2. nfs_exports
作为服务器端时，对外共享的目录，列表。
shared_dir 指定共享目录。不存在，则会创建，默认创建的权限为 777，owner 和 group 均为 root。
hosts_perms 指定目标主机的权限，格式和 exports 的格式相同，如 172.16.0.0/16(rw,sync,root_squash)

默认值：
nfs_exports:
  - shared_dir: /data/nfs
    hosts_perms: "*(rw,sync,no_subtree_check,no_root_squash)"
```