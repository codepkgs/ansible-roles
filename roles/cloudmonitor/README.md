# 说明

升级或卸载过程中，会将老版本（java 和 golang 版本）的云监控插件卸载。

1. 通过将 cms_op_type 设置为 uninstall，支持卸载云监控插件。
2. 通过将 cms_op_type 设置为 upgrade，支持升级云监控插件到最新版本(C++版本)。

# 变量说明

- cms_version
  指定要安装的 C++ 版本的 cloudmonitor 的版本。默认是 3.5.5。该变量仅仅在第一次安装的时候生效，如果已经安装，则不会再执行安装或升级

- cms_op_type
  指定操作类型。默认是 upgrade，表示升级云监控插件到最新版本。
  如果是 uninstall，则表示卸载云监控插件
