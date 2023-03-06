#!/usr/bin/env python
import argparse
import json
import sys

all_hosts_default = {
    "ansible_user": "root",
    "ansible_port": 10622
}

all_hosts = {
    "172.16.152.242": {
        "ansible_host": "172.16.152.242"
    },
    "172.16.152.243": {
        "ansible_host": "172.16.152.243"
    },
    "172.16.152.244": {
        "ansible_host": "172.16.152.244"
    }
}


class DynamicInventory:
    """
    ansible动态inventory要求如下：
    1. 文件必须要有可执行权限。
    2. 需要接收两个参数：
        --list：列出所有的组，以及每个组的主机。同时要有一个_meta key，包含每个机器的参数
        --host：返回每个机器的参数。
    """
    def __init__(self) -> None:
        args = self.parse_args()
        if args.list:
            hosts = self.list_running_hosts()
            json.dump(hosts, sys.stdout)
        else:
            detail = self.get_host_details(args.host)
            json.dump(detail, sys.stdout)

    @staticmethod
    def parse_args():
        parser = argparse.ArgumentParser(
            description="ansible dynamic inventory")
        group = parser.add_mutually_exclusive_group(required=True)
        group.add_argument('--host', help="list host detail")
        group.add_argument("--list", action="store_true",
                           help="list all groups and hosts")
        return parser.parse_args()

    def get_host_details(self, host) -> dict:
        detail = all_hosts.get(host, {})
        if detail:
            detail.update(**all_hosts_default)
        return detail

    def list_running_hosts(self) -> dict:
        hosts = list(all_hosts.keys())
        hostvars = {}
        for h, v in all_hosts.items():
            hostvars[h] = v
            hostvars[h].update(**all_hosts_default)
        return {"group": hosts, "_meta": {"hostvars": hostvars}}


if __name__ == '__main__':
    DynamicInventory()
