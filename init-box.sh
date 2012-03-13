#!/bin/bash

if [ ! -f ./postgresql-9.1.3.tar.bz2 ]
then
	wget http://ftp.postgresql.org/pub/source/v9.1.3/postgresql-9.1.3.tar.bz2
        tar xvjf postgresql-9.1.3.tar.bz2
        ln -s postgresql-9.1.3 src
fi

if [ -d "box-$1" ]
then
    echo "error: box $1 exist"
    exit 1;
fi

box="box-$1"

mkdir $box
cd $box

prefix=`pwd`

ln -s ../postgresql-9.1.3 sources
cd sources;
./configure --prefix=$prefix --with-pgport=`echo "6555 + $1" | bc` && make clean && make && make install

if [ $? -eq 0 ]
then
    cd $prefix
    mkdir data
    bin/initdb -D data
fi
