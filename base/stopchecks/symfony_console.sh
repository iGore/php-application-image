#!/bin/bash
# This script exits with code 1 as long as a symfony console is running on the container
if [ $(ps -aux | grep $PROJECT_BINARIES/console | wc -l) -gt "1" ]; then
  exit 1
fi;
exit 0;