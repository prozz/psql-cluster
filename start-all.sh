#!/bin/bash

# if starting of any node fails on mac, execute following:
# sudo sysctl -w kern.sysv.shmall=65536

for file in `find . -type d -name "box*"`; do
    $file/bin/pg_ctl -D $file/data -l $file/output.log -w start
done
