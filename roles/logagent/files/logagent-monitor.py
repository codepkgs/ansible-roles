
import os
import socket

import dingtalk

command = "ps aux | grep '/usr/local/logagent/bin' | grep -v 'grep' | wc -l"
restart_command = "/etc/init.d/logagent restart"
logagent_counts = int(os.popen(command).read().split()[0])
hostname = socket.gethostname()
access_token = "your-token"

at_mobiles = ('your-mobile',)

if logagent_counts:
    print('{}: logagent is running'.format(hostname))
else:
    msg = '{}: logagent is not running'.format(hostname)
    dt = dingtalk.DingTalk(access_token)
    dt.send_text(msg, at_mobiles=at_mobiles)

    os.popen(restart_command)
