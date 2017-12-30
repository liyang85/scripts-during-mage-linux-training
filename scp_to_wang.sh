#!/bin/bash
# scp19.sh: scp files to teacher's computer quickly

server="wang@172.18.0.7:"
scp -r "$@" ${server}
