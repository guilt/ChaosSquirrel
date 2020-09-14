#!/bin/bash
# Script for NetworkCorruption Chaos Monkey

# Corrupts 5% of packets
ip -o link show | awk -F': ' '{print $2}' | while read -r IF; do
	tc qdisc add dev "${IF}" root netem corrupt 5% &
done

wait
