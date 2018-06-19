#!/bin/bash
# Script for KillProcesses Chaos Monkey

cat << EOF > /tmp/kill_loop_app.sh
#!/bin/bash
while true;
do
    pkill -KILL -f java
    pkill -KILL -f scala
    pkill -KILL -f python
    pkill -KILL -f ruby
    pkill -KILL -f perl
    pkill -KILL -f php
    pkill -KILL -f node
    pkill -KILL -f httpd
    pkill -KILL -f nginx
    pkill -KILL -f haproxy
    sleep 1
done
EOF

nohup /bin/bash /tmp/kill_loop_app.sh &
