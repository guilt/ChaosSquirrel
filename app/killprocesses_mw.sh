#!/bin/bash
# Script for KillProcesses Chaos Monkey

cat << EOF > /tmp/kill_loop_mw.sh
#!/bin/bash
while true;
do
    pkill -KILL -f activemq
    pkill -KILL -f tibco
    pkill -KILL -f tibemsd
    pkill -KILL -f emqttd
    sleep 1
done
EOF

nohup /bin/bash /tmp/kill_loop_mw.sh >/dev/null 2>&1 &
