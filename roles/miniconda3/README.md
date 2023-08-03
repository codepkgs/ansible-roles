# 说明

用于安装最新版本的 miniconda3 到/opt/miniconda3 目录下。可以使用 miniconda3_install_parent_dir 指定安装目录。

默认会在当前用户下执行 conda init 命令。如果想其他用户也使用 miniconda3，则可以在当前用户下执行 conda init 命令。

# 使用

```yaml
- hosts: 172.16.158.51
  gather_facts: true
  become: true
  become_user: root
  roles:
    - role: miniconda3
      tags:
        - conda
        - conda3
        - miniconda3
      vars:
        miniconda3_install_parent_dir: /opt
```
