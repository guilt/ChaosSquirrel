#!/bin/bash
# Script for BurnIO Chaos Monkey

cat << EOF > /tmp/loopburnio.sh
#!/bin/bash
while true;
do
    dd if=/dev/urandom of=/tmp/burn-${RANDOM} bs=1M count=65536 iflag=fullblock
done
EOF

nohup /bin/bash /tmp/loopburnio.sh >/dev/null 2>&1 &
