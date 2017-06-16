#!/usr/bin/env bash
# listRDSSnap.sh
# Description: lists RDS snapshots in more pretty way 
# Linux server / desktop.
# Author: Forlidar Macias
# Date: 12/Sep/2017


# main logic
if [ -n "$1" ];then
	 aws rds describe-db-snapshots --output text --db-instance-identifier $1 | awk -F" "  '{print $6}'
else 
	aws rds describe-db-snapshots --output text | awk -F" "  '{print $6}'
fi
