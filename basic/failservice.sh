#!/bin/bash
# Script for FailService Chaos Monkey

# Block well-known Cloud endpoints
{
cat <<EOF
amazon.com
amazonaws.com
google.com
oracle.com
okta.com
windows.net
onmicrosoft.com
cloudapp.net
azure.com
azurecr.io
msecnd.net
aka.ms
microsoft.com
onmicrosoft.com
azureedge.net
trafficmanager.net
visualstudio.com
mysql
cassandra
redis
db-service
auth-service
EOF
} | while read DOMAIN; do
echo "127.0.0.1 ${DOMAIN}" | tee -a /etc/hosts
done
