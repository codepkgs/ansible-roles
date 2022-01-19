# 作用

用于安装 salt-master 和 salt-minion。

# 变量

```text
salt_role: master # 指定salt角色，master或minion
master_interface：master监听的地址。默认是0.0.0.0
salt_masters: ['127.0.0.1'] # salt master 服务器的地址，可以指定多个，minion 端使用。必须定义
master_publish_port: 4505 # master publish port，默认是4505
master_ret_port: 4506 # minion return port，默认是4506
master_worker_threads：启动多少个线程。默认是10个

# file_roots 配置
file_roots:
  base:
    - /srv/salt/base   # 这里指定的目录会自动创建

# pillar_roots 配置
pillar_roots:
  base:
    - /srv/salt/pillar

# 定义自动签发的主机列表。如果不需要自动签发，则不用定义该变量。定义在master角色的节点。
# 默认所有私网地址自动签发
autosign_hosts:
  - 10(\.\d{1,3}){2}\.\d{1,3}
  - 172\.1[6-9]\.\d{1,3}\.\d{1,3}
  - 172\.2[0-9]\.\d{1,3}\.\d{1,3}
  - 172\.31\.\d{1,3}\.\d{1,3}
  - 192\.168\.\d{1,3}\.\d{1,3}

# minion_id: <minion_id> # 使用每个机器的FQDN作为minion_id，默认为主机IP地址

# 是否仅显示差异（发生变化的ID）
state_output_diff: False
```
