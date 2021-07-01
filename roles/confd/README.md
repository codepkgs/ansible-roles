# 说明

安装 `confd`，默认安装的版本是 `0.16.0`，可以通过 `confd_version` 变量指定要安装的版本。

* 使用

```shell
# 使用默认版本
ansible-playbook main.yaml -e host=10.100.2.2 -e role=confd

# 指定版本
ansible-playbook main.yaml -e host=10.100.2.2 -e role=confd -e confd_version=0.16.0
```
