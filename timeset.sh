#!/bin/bash

date -s "$(ls -l --full-time /home/cit/robocup/for2050/src/ | grep CMakeFiles | awk '{print $6, $7}' | sed "s/\.[0-9]*//g" | sed "s/://g" | sed "s/-//g" | sed "s/[0-9][0-9]\$//g")"
