#!/bin/bash
# Script for BurnCPU Chaos Monkey

cat << EOF > /tmp/infiniteburn.sh
#!/bin/bash
while true;
    do openssl speed;
done
EOF

# shellcheck disable=SC2034
for cpuiter in {1..64}
do
    # 64 parallel 100% CPU tasks should hit even the biggest instances
    nohup /bin/bash /tmp/infiniteburn.sh >/dev/null 2>&1 &
done
