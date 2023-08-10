# 依赖

vault 依赖于 postgresql 数据库，需要事先按照 postgresql 数据库或者是使用 postgresql role 安装。

并且通过 pg_user、pg_host、 pg_password 指定 postgresql 数据库的连接信息（需要有创建数据库的信息）。
如果 vault 使用的数据库也已经存在了，可以用 vault_db_created 设置为 false，不创建 vault 数据库。

# 变量

```text
vault_db_name：指定创建的vault数据库名称。默认为vault
vault_db_user: 指定vault数据库用户。默认为vault
vault_db_user_password: 指定vault数据库用户密码。必须指定。可以是md5密码。产生方式：echo "md5`echo -n 'verysecretpasswordJOE' | md5 | awk '{print $1}'`"
pg_host: 指定pg_host地址。必须指定
pg_user: 指定数据库用户。必须指定
pg_password: 指定数据库密码。必须指定
pg_port: 指定pg数据库服务器的端口。默认5432
vault_db_created: 是否创建vault数据库。默认为true。如果为false，则不创建vault数据库，表示数据库已经存在。需要用户指定vault_db_name。
vault_user_created：是否创建vault用户。默认为true。如果为false，则不创建vault用户，表示用户已经存在。需要用户指定vault_db_user和vault_db_user_password。
vault_table_created：是否创建vault表。默认为true。如果为false，则不创建vault表，表示表已经存在。
vault_cluster_name: vault集群名称。默认为vault
vault_key_shares: vault密钥共享数。默认为5
vault_key_thresholds: vault密钥阈值。默认为3
vault_init_exec: 是否执行vault init。默认false。如果为true，则执行vault init。
vault_unseal_exec: 是否执行vault unseal。默认false。如果为true，则执行vault unseal。
vault_unseal_keys: vault解密的key列表。
```

# 初始化文件

vault 初始化完成后，会将初始化产生的 key 以及 root token 保存在 /etc/vault.d/.vault-init 文件中。

# 示例

```yml
- hosts: vault
  gather_facts: true
  become: true
  become_user: root
  roles:
    - role: vault
      tags: vault
      vars:
        pg_host: "172.16.158.51"
        pg_user: postgres
        pg_password: "PostgreSql123$"
        pg_port: 5432
        vault_db_name: vault
        vault_db_user: vault
        vault_db_user_password: "Vault123$"
        vault_db_created: true
        vault_user_created: true
```
