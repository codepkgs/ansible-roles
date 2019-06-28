# 说明
* 作用
    ```text
    设置sudo免密码登录。
    
    1. 如果ansible_os_family为redhat，则免密码登录的组为wheel
    2. 如果ansible_os_family为debian，则免密码登录的组为sudo
    ```
