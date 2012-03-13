#!/bin/bash

for file in `find . -type d -name "box*"`; do
    $file/bin/pg_ctl -D $file/data -l $file/output.log -w stop
done
