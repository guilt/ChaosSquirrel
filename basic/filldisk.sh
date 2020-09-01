#!/bin/bash
# Script for FillDisk Chaos Monkey

# 256 GB should be enough to fill up many root disks!
dd if=/dev/zero of=/tmp/fillup-${RANDOM} bs=1M count=524288 &
