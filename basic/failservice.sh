#!/bin/bash
# Script for FailService Chaos Monkey

# Block well-known DB/Service endpoints
echo "127.0.0.1 prod.walmart.com" >> /etc/hosts
