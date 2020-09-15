#!/bin/bash
# Script for FillDisk Chaos Monkey

cat << EOF > /tmp/loopfill.sh
#!/bin/bash
while true;
do
    # this should be enough to fill up
    # many root disks!
    dd if=/dev/zero of=/tmp/fillup-${RANDOM} bs=1M count=524288 &
    dd if=/dev/zero of=/var/tmp/fillup-${RANDOM} bs=1M count=524288 &
done
EOF

nohup /bin/bash /tmp/loopfill.sh >/dev/null 2>&1 &
