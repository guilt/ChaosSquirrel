#!/bin/bash
# Script for NetworkLoss Chaos Monkey

# Drops 7% of packets, with 25% correlation with previous packet loss
# 7% is high, but it isn't high enough that TCP will fail entirely
ip -o link show | awk -F': ' '{print $2}' | while read -r IF; do
	tc qdisc add dev "${IF}" root netem loss 7% 25% &
done

wait
