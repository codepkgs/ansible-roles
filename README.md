# 说明
* ansible version
    ```text
    测试所使用的 ansible 版本为2.9.11
    ```

* redis
    ```text
    测试时使用了 redis 存储 facts 信息，需要本地启用 redis-server，且没有密码，默认使用的 db 为15
    可以在 ansible.cfg 中修改。

    gathering = smart
    fact_caching = redis
    fact_caching_timeout = 604800
    fact_caching_connection = localhost:6379:15
    ```

* 系统
    ```text
    roles主要针对 RedHat 系列，主要是 CentOS 7. 其他的系统没有做过充分的测试。
    ```

* main.yaml
    ```text
    该文件为 anbile-roles 的入口文件，类似于 salt 的 top.sls。
    ```

