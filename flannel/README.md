# 说明

* 写入网络配置到etcd
  ```bash
  步骤1：创建目录(mkdir /coreos.com/network)

    ETCDCTL_API=2 etcdctl --endpoints https://10.0.100.3:2379,https://10.0.100.4:2379,https://10.0.100.5:2379 \
    --cert-file /data/ssl/flannel/flannel.pem \
    --key-file /data/ssl/flannel/flannel-key.pem \
    --ca-file /data/ssl/ca/ca.pem \
    mkdir /coreos.com/network

    步骤2：设置key的value (set /coreos.com/network/config)
    ETCDCTL_API=2 etcdctl --endpoints https://10.0.100.3:2379,https://10.0.100.4:2379,https://10.0.100.5:2379 \
    --cert-file /data/ssl/flannel/flannel.pem \
    --key-file /data/ssl/flannel/flannel-key.pem \
    --ca-file /data/ssl/ca/ca.pem \
    set /coreos.com/network/config '{"Network": "172.16.0.0/16", "SubnetLen": 24, "Backend": {"Type": "vxlan"}}'

    步骤3：获取设置的key的值 (get /coreos.com/network/config)
    ETCDCTL_API=2 etcdctl --endpoints https://10.0.100.3:2379,https://10.0.100.4:2379,https://10.0.100.5:2379 \
    --cert-file /data/ssl/flannel/flannel.pem \
    --key-file /data/ssl/flannel/flannel-key.pem \
    --ca-file /data/ssl/ca/ca.pem \
    get /coreos.com/network/config
  ```

* 变量
    ```text
    flannel_version                 指定要安装的flannel的版本。默认是0.11.0
    etcd_tls                        etcd是否启用了tls功能。默认是yes
    flannel_tls_dir                 flannel证书保存的路径。默认是/etc/flannel/certs
    flannel_etcd_cafile             flannel访问etcd集群时，使用的ca证书。相对于flannel_tls_dir目录
    flannel_etcd_certfile           flannel访问etcd集群时，使用的证书。相对于flannel_tls_dir目录
    flannel_etcd_keyfile            flannel访问etcd集群时，使用的证书私钥。相对于flannel_tls_dir目录
    flannel_etcd_endpoints          etcd的endpoints
    flannel_etcd_prefix             etcd集群存储flannel网络配置的前缀。默认是/coreos.com/network
    flannel_options                 flannel其他的配置选项。默认是空
    ```

    所有的证书存放在files/certs中

* 使用示例
    ```
    方法1: 将变量定义在defaults/main.yaml中

    flannel_version: '0.11.0'
    etcd_tls: yes
    flannel_tls_dir: '/etc/flannel/certs'
    flannel_etcd_cafile: 'ca.pem'
    flannel_etcd_certfile: 'etcd.pem'
    flannel_etcd_keyfile: 'etcd-key.pem'
    flannel_etcd_endpoints: 'https://10.0.100.3:2379,https://10.0.100.4:2379,https://10.0.100.5:2379'

    方法2: 将变量定义在每个主机中
    - hosts: 10.0.100.3
    roles:
        - role: flannel
          tags: flannel
          vars:
            - flannel_version: '0.11.0'
            - etcd_tls: yes
            - flannel_tls_dir: '/etc/flannel/certs'
            - flannel_etcd_cafile: 'ca.pem'
            - flannel_etcd_certfile: 'etcd.pem'
            - flannel_etcd_keyfile: 'etcd-key.pem'
            - flannel_etcd_endpoints: 'https://10.0.100.3:2379,https://10.0.100.4:2379,https://10.0.100.5:2379'
    ```