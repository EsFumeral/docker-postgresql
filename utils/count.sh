#!/bin/bash

# This script counts params
# is an example

echo ""
echo count.sh started
echo ""

remaining=4

for i in "$@"
do
case $i in
    -codapp=*|--codapp=*)
    LOAD_CODAPP="${i#*=}"
    let "remaining--"
    shift # past argument=value
    ;;
    -app=*|--app=*)
    LOAD_APP="${i#*=}"
    let "remaining--"
    shift # past argument=value
    ;;
    -pass=*|--password=*)
    LOAD_BDPASSAPP="${i#*=}"
    let "remaining--"
    shift # past argument=value
    ;;
    -p=*|--port=*)
    LOAD_BDPORTAPP="${i#*=}"
    let "remaining--"
    shift # past argument=value
    ;;
    *)
          # unknown option
    ;;
esac
done

if [[ remaining -eq 0 ]]; then
    export LOAD_PARAM=true
    echo Load params $LOAD_PARAM
else
    echo Loading defaults
fi