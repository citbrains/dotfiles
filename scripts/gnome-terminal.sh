#!/bin/bash

# System startup wait time.
sleep 10
# Specify display
export DISPLAY=:0

gnome-terminal --geometry=80x24+70+30 --working-directory=/home/cit/robocup/for2050/src/pyfiles &
