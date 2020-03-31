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

3. nfs_mounts
作为 nfs 客户端时，挂载其他的 nfs 服务器端的共享目录。
nfs_mounts:
  - src: 10.0.100.2:/data/nfs  # 指定挂载的源路径
    dest: /data/nfs # 指定挂载的目标路径。
    state: present # 指定状态。默认值 present
    opts: _netdev,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2  # 指定挂载选项。默认值 _netdev,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2'
```