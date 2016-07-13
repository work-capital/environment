#!/bin/bash
# stop synergy server
ps -ef | grep synergys | grep -v grep | awk '{print $2}' | xargs kill
printf "synergy server stoped"
