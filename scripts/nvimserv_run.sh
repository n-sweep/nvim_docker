#!/usr/bin/env bash

host="vimserv"

while getopts "h:" opt
do
    case $opt in
        h) host=$OPTARG
    esac
done

if [ -z "$1" ]
then
    # If $1 was not passed, attach to current directory
    docker run --rm -it \
        -h $host \
        -v ${PWD}:/home/work \
        nsweep/nvimserv
elif [ -d $1 ]
then
    # If $1 exists and is a directory, attach to dir with zsh
    docker run --rm -it \
        -h $host \
        -v `realpath $1`:/home/work \
        nsweep/nvimserv
else
    # If $1 exists and is not a directory, open in nvim
    target=`realpath $1`
    echo $target
    dir=`dirname $target`
    docker run --rm -it \
        -h $host \
        -v $dir:/home/work \
        --entrypoint nvim \
        nsweep/nvimserv $1
fi

