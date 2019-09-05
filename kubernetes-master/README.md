# 说明

采用二进制方式自动部署 kubernetes master 组件，包括 kube-apiserver、kube-controller-manager、kube-scheduler

* 前提

    1. 需要下载 kubernetes 二进制程序。
        [下载链接](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.15.md#downloads-for-v1153)
    2. 需要事先产生证书，包括ca证书、etcd证书、kubernetes master所需要的证书

* 变量

    所有的证书文件、二进制程序即可以放在 kubernetes-master/files中，也可以在 ansible 控制机的本地。如果是在 kubernetes-master/files中，则需要指定相对路径，如果是在 ansible 控制机器中，则要使用绝对路径。

    ```text
    kube_apiserver_binary               kube-apiserver的二进制程序。默认是空
    kube_controller_manager_binary      kube-controller-manager的二进制程序。默认是空
    kube_scheduler_binary               kube-scheduler的二进制程序。默认是空
    kubernetes_master_certs             kubernetes-master所需要的所有证书文件。包括ca证书、etcd证书等等。
    ```