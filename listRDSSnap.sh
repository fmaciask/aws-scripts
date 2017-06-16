#!/usr/bin/env bash
# listRDSSnap.sh
# Description: lists RDS snapshots in more pretty way 
# Linux server / desktop.
# Author: Forlidar Macias
# Date: 16/Jun/2017

while getopts "h" OPCION; do
case $OPCION in
	"h")
	echo $"Usage: $0 InstanceName"
	echo $"For example: $0 myrdsname01"
	exit 1
	;;
esac
done

# main logic
if [ -n "$1" ];then
	 aws rds describe-db-snapshots --output text --db-instance-identifier $1 | awk -F" "  '{print $6}'
else 
	aws rds describe-db-snapshots --output text | awk -F" "  '{print $6}'
fi
