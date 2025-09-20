#!/bin/bash

echo "All the variables passed to script: $@"
echo "All the variables passed to script: $*"
echo "script name $0"
echo "current directory $PWD"
echo "who is running $USER"
echo "Home directory of user $HOME"
echo "PID of the script $$"
sleep 50 &
echo "PID of last command in background: $!"