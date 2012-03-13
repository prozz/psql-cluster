#!/bin/bash

if [ ! -d "box-$1" ]
then
    echo "error: box $1 does not exist"
    exit 1;
fi

$EDITOR box-$1/data/postgresql.conf
