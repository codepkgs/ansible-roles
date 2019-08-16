# 说明

* 变量

    [配置参考](https://github.com/etcd-io/etcd/blob/master/Documentation/op-guide/configuration.md)

    ```
    member配置:

    etcd_name       # 设置节点的名称。默认是default
    etcd_data_dir   # 数据目录。默认是/var/lib/etcd/default.etcd
    etcd_wal_dir    # wal目录。默认和数据目录在同一个目录下。
    etcd_snapshot_count # 多少个提交事务会触发快照到磁盘的操作。默认是100000
    etcd_heartbeat_interval # 发送心跳的时间间隔。默认是100。单位是ms
    etcd_election_timeout   # 选举超时。默认是1000。单位是ms
    etcd_max_snapshots      # 最大快照数。默认是5
    etcd_max_wals           # 最大wal数量。默认是5
    etcd_listen_client_urls # 监听客户端请求的URL。默认是http://localhost:2379。多个地址使用逗号隔开。
    etcd_listen_peer_urls   # 监听peer流量的URL。默认是http://localhost:2380。多个地址使用逗号隔开。

    集群配置:
    etcd_cluster                        # 是否启用集群功能。yes或no。默认是no
    etcd_advertise_client_urls          # 该节点通告的用于接收客户端请求的URL。必选参数
    etcd_initial_advertise_peer_urls    # 该节点通告的用于peer之间通信的地址和端口。必选参数。
    etcd_initial_cluster                # 初始化集群配置。集群各个节点配置应该一致。必须参数
    etcd_initial_cluster_token          # 初始化集群的token。默认是etcd-cluster。集群各个节点配置应该一致。
    etcd_initial_cluster_state          # etcd集群初始化的状态。new或existing。默认是new

    TLS配置:
    etcd_tls                            # 是否启用TLS功能。默认是no。
    etcd_tls_dir                        # etcd tls证书文件目录。默认是/etc/etcd/certs。所有的证书均相对于该目录
    etcd_cert_file                      # etcd证书文件名称。
    etcd_key_file                       # etcd证书私钥名称。
    etcd_client_cert_auth               # 是否验证客户端证书。默认是false
    etcd_trusted_ca_file                # 授信的CA证书文件名称。
    etcd_auto_tls                       # 是否使用自签的TLS。默认false
    etcd_peer_cert_file                 # peer之间通信的证书。
    etcd_peer_key_file                  # peer之间通信的证书的私钥。
    etcd_peer_client_cert_auth          # 是否验证peer客户端的证书。默认是false
    etcd_peer_trusted_ca_file           # peer之间授信的CA证书
    etcd_peer_auto_tls                  # peer之间是否使用自签的TLS。默认是false

    metrics配置:
    etcd_listen_metrics_urls            # 对外暴露/metrics和/health的URL。默认是空。格式是http://ip:port
    ```

* etcd集群配置示例
    ```yaml
    - hosts: 10.0.100.3
      roles:
        - role: etcd
          tags: etcd
          vars:
            etcd_name: "infra01"
            etcd_enable_v2: yes
            etcd_data_dir: "/data/etcd"
            etcd_listen_client_urls: "https://10.0.100.3:2379"
            etcd_listen_peer_urls: "https://10.0.100.3:2380"
            etcd_advertise_client_urls: "https://10.0.100.3:2379"
            etcd_initial_advertise_peer_urls: "https://10.0.100.3:2380"
            etcd_initial_cluster_token: "infra-cluster"
            etcd_initial_cluster: "infra01=https://10.0.100.3:2380,infra02=https://10.0.100.4:2380,infra03=https://10.0.100.5:2380"
            etcd_tls: yes
            etcd_cert_file: "etcd.pem"
            etcd_key_file: "etcd-key.pem"
            etcd_client_cert_auth: yes
            etcd_trusted_ca_file: "ca.pem"
            etcd_auto_tls: no
            etcd_peer_cert_file: "etcd.pem"
            etcd_peer_key_file: "etcd-key.pem"
            etcd_peer_client_cert_auth: yes
            etcd_peer_trusted_ca_file: "ca.pem"
            etcd_peer_auto_tls: no
            etcd_listen_metrics_urls: "http://10.0.100.3:2381"

    - hosts: 10.0.100.4
      roles:
        - role: etcd
          tags: etcd
          vars:
            etcd_name: "infra02"
            etcd_enable_v2: yes
            etcd_data_dir: "/data/etcd"
            etcd_listen_client_urls: "https://10.0.100.4:2379"
            etcd_listen_peer_urls: "https://10.0.100.4:2380"
            etcd_advertise_client_urls: "https://10.0.100.4:2379"
            etcd_initial_advertise_peer_urls: "https://10.0.100.4:2380"
            etcd_initial_cluster_token: "infra-cluster"
            etcd_initial_cluster: "infra01=https://10.0.100.3:2380,infra02=https://10.0.100.4:2380,infra03=https://10.0.100.5:2380"
            etcd_tls: yes
            etcd_cert_file: "etcd.pem"
            etcd_key_file: "etcd-key.pem"
            etcd_client_cert_auth: yes
            etcd_trusted_ca_file: "ca.pem"
            etcd_auto_tls: no
            etcd_peer_cert_file: "etcd.pem"
            etcd_peer_key_file: "etcd-key.pem"
            etcd_peer_client_cert_auth: yes
            etcd_peer_trusted_ca_file: "ca.pem"
            etcd_peer_auto_tls: no
            etcd_listen_metrics_urls: "http://10.0.100.4:2381"

    - hosts: 10.0.100.5
      roles:
        - role: etcd
          tags: etcd
          vars:
            etcd_name: "infra03"
            etcd_enable_v2: yes
            etcd_data_dir: "/data/etcd"
            etcd_listen_client_urls: "https://10.0.100.5:2379"
            etcd_listen_peer_urls: "https://10.0.100.5:2380"
            etcd_advertise_client_urls: "https://10.0.100.5:2379"
            etcd_initial_advertise_peer_urls: "https://10.0.100.5:2380"
            etcd_initial_cluster_token: "infra-cluster"
            etcd_initial_cluster: "infra01=https://10.0.100.3:2380,infra02=https://10.0.100.4:2380,infra03=https://10.0.100.5:2380"
            etcd_tls: yes
            etcd_cert_file: "etcd.pem"
            etcd_key_file: "etcd-key.pem"
            etcd_client_cert_auth: yes
            etcd_trusted_ca_file: "ca.pem"
            etcd_auto_tls: no
            etcd_peer_cert_file: "etcd.pem"
            etcd_peer_key_file: "etcd-key.pem"
            etcd_peer_client_cert_auth: yes
            etcd_peer_trusted_ca_file: "ca.pem"
            etcd_peer_auto_tls: no
            etcd_listen_metrics_urls: "http://10.0.100.5:2381"
    ```

* 执行
    ```bash
    步骤1:
    ansible-playbook main.yaml --tags etcd

    步骤2: 重启服务
    ansible etcd -m service -a 'name=etcd state=restarted enabled=yes'
    ```

* 产生etcdctl客户端证书用于测试
    ```
    1. ca-config.json文件
    cat > ca-config.json <<- EOF
    {
        "signing": {
            "default": {
                "expiry": "87600h"
            },
            "profiles": {
                "server": {
                    "expiry": "87600h",
                    "usages": [
                        "signing",
                        "key encipherment",
                        "server auth"
                    ]
                },
                "client": {
                    "expiry": "87600h",
                    "usages": [
                        "signing",
                        "key encipherment",
                        "client auth"
                    ]
                },
                "peer": {
                    "expiry": "87600h",
                    "usages": [
                        "signing",
                        "key encipherment",
                        "server auth",
                        "client auth"
                    ]
                }
            }
        }
    }
    EOF

    2. etcd-client-csr.json
    cat > etcd-client-csr.json <<- EOF
    {
        "CN": "etcd cluster",
        "hosts": [""],
        "key": {
            "algo": "rsa",
            "size": 2048
        },
        "names": [
            {
                "C": "CN",
                "L": "Beijing",
                "ST": "Beijing",
                "O": "fdisk.cc",
                "OU": "DevOps"
            }
        ]
    }
    EOF

    3. 产生证书
    cfssl gencert \
        -ca /data/ssl/ca/ca.pem \
        -ca-key /data/ssl/ca/ca-key.pem \
        -config /data/ssl/ca-config.json \
        -profile client /data/ssl/etcd-client-csr.json | cfssljson -bare client
    ```

* 测试
    ```bash
    1. ETCDCTL_API=2查看集群的状态
    ➜  certs etcdctl --endpoints https://10.0.100.5:2379 \
    --ca-file ca.pem \
    --cert-file client.pem \
    --key-file client-key.pem \
    member list
    28d929f1eb9e7241: name=infra01 peerURLs=https://10.0.100.3:2380 clientURLs=https://10.0.100.3:2379 isLeader=true
    64fb4891b9a8b9f5: name=infra02 peerURLs=https://10.0.100.4:2380 clientURLs=https://10.0.100.4:2379 isLeader=false
    8a15427dec98dc32: name=infra03 peerURLs=https://10.0.100.5:2380 clientURLs=https://10.0.100.5:2379 isLeader=false
    ➜  certs

    2. ETCDCTL_API=3查看集群的状态
    export ETCDCTL_API=3
    ➜  certs etcdctl --endpoints  https://10.0.100.3:2379,https://10.0.100.4:2379,https://10.0.100.5:2379 --cacert ca.pem --cert client.pem --key client-key.pem -w table endpoint status
    +-------------------------+------------------+---------+---------+-----------+-----------+------------+
    |        ENDPOINT         |        ID        | VERSION | DB SIZE | IS LEADER | RAFT TERM | RAFT INDEX |
    +-------------------------+------------------+---------+---------+-----------+-----------+------------+
    | https://10.0.100.3:2379 | 28d929f1eb9e7241 |  3.3.11 |   20 kB |      true |        14 |         89 |
    | https://10.0.100.4:2379 | 64fb4891b9a8b9f5 |  3.3.11 |   20 kB |     false |        14 |         89 |
    | https://10.0.100.5:2379 | 8a15427dec98dc32 |  3.3.11 |   20 kB |     false |        14 |         89 |
    +-------------------------+------------------+---------+---------+-----------+-----------+------------+
    ➜  certs

    ➜  certs etcdctl --endpoints  https://10.0.100.3:2379,https://10.0.100.4:2379,https://10.0.100.5:2379 --cacert ca.pem --cert client.pem --key client-key.pem -w table endpoint health
    https://10.0.100.3:2379 is healthy: successfully committed proposal: took = 4.65308ms
    https://10.0.100.4:2379 is healthy: successfully committed proposal: took = 4.791261ms
    https://10.0.100.5:2379 is healthy: successfully committed proposal: took = 5.815671ms
    ➜  certs
    ```