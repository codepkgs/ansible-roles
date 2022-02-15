# 说明

- 功能

  ```
  1. 安装docker-ce。使用阿里云yum源。
  2. 设置docker补全
  3. 是否强制覆盖 docker/daemon.json。使用docker_daemon_force变量控制。默认是no
  4. 如果不存在 daemon.json，则创建，否则不修改，可以用 docker_daemon_force 确定是否强制覆盖。
  ```

- 变量

  ```
  docker_daemon_force         # 是否强制覆盖 docker/daemon.json，默认是 no。
  docker_flannel              # docker是否和flannel集成。默认是no
  docker_compose              # 是否安装 docker-compose，默认是 yes
  ```

- 使用
  ```json
  - hosts: docker
    roles:
      - role: docker-ce
        tags: docker
        vars:
          docker_daemon_force: yes
  ```
