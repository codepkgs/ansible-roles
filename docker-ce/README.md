# 说明

* 功能
    ```
    1. 安装docker-ce。使用阿里云yum源。
    2. 设置docker补全
    3. 配置docker加速。使用docker_daemon_config变量控制。默认是true
    ```

* 变量
    ```
    docker_daemon_config        # 是否修改/etc/docker/daemon.json文件。默认是yes\
    docker_flannel              # docker是否和flannel集成。默认是no
    ```

* 使用
    ```json
    - hosts: docker
      roles:
        - role: docker
          tags: docker
          vars:
            docker_daemon_config: yes
            docker_flannel: yes
    ```