#!/bin/bash
# Script for NullRoute Chaos Monkey

ip route add blackhole 10.0.0.0/8
ip route add blackhole 172.16.0.0/12
ip route add blackhole 192.168.0.0/16
