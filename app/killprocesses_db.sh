#!/bin/bash
# Script for KillProcesses Chaos Monkey

cat << EOF > /tmp/kill_loop_db.sh
#!/bin/bash
while true;
do
    pkill -KILL -f mysqld
    pkill -KILL -f mysql
    pkill -KILL -f postmaster
    pkill -KILL -f postgres
    pkill -KILL -f redis-server
    pkill -KILL -f redis-cli
    pkill -KILL -f mongod
    pkill -KILL -f mongo
    pkill -KILL -f python
    pkill -KILL -f crsd.bin
    pkill -KILL -f tnslsnrjava
    sleep 1
done
EOF

nohup /bin/bash /tmp/kill_loop_db.sh >/dev/null 2>&1 &
