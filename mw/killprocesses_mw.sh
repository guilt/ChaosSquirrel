#!/bin/bash
# Script for KillProcesses Chaos Monkey

cat << EOF > /tmp/kill_loop_mw.sh
#!/bin/bash
while true;
do
    pkill -KILL -f java
    pkill -KILL -f python
    pkill -KILL -f activemq
    pkill -KILL -f tibco
    pkill -KILL -f tibemsd
    sleep 1
done
EOF

nohup /bin/bash /tmp/kill_loop_mw.sh &
