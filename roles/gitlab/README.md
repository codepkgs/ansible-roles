# 说明

用于安装和配置 gitlab-ee

# 变量

- gitlab_config_force_update
  是否强制更新 gitlab 的配置。如果之前已经有配置，如果发现不一致，是否强制更新。默认 yes

- gitlab_external_url
  gitlab external url 的地址。必须以 https:// 或 http:// 开头。后面的部分会作为域名部分（gitlab_domain_name），为配置证书做准备。
  如 gitlab_external_url: https://gitlab.fdisk.cc，则gitlab_domain_name为gitlab.fdisk.cc。
  默认为机器的 IP 地址。

- gitlab_ssl_cert 和 gitlab_ssl_key
  配置 SSL 证书。如果这两个变量没有定义，则不会配置证书。无默认值。
  该证书文件为本地的文件路径。
