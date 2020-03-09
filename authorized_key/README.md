# 说明
* 作用

    添加或删除ssh public key到指定的用户，指定的用户必须事先存在

* 变量
    ```text
    users: 指定从指定的用户中添加或删除public key。
        格式如下: users中可以指定多个用户。
        users:
          - name: username1             # 要添加或删除的用户名
            state: present | absent     # 期望的状态。absent或present。默认值是present
            key: username1.pub          # public key文件的名称,该文件需要位于files中。
            key_options: "ssh key options, if not definded, omit"
          - name: username2
            state: absent
            key: username2.pub
    ```

* public key文件
    ```text
    将需要添加或删除的用户的public key放在files目录中，并使用users变量的key参数引用该文件名即可。
    ```
