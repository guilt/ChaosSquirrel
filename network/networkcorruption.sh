#!/bin/bash
# Script for NetworkCorruption Chaos Monkey

# Corrupts 5% of packets
tc qdisc add dev eth0 root netem corrupt 5% &
tc qdisc add dev bond0 root netem corrupt 5% &
tc qdisc add dev bond1 root netem corrupt 5% &
wait
