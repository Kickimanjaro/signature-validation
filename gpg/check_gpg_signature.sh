#!/usr/bin/env bash
# 2020-05-07, OV
WORKSPACE=$HOME/workspace/in/*
VERIFIED=$HOME/workspace/verified
CLEAR_TEXT_SIGNATURE_FILE=.asc
DETACHED_SIGNATURE_FILE=.sig
RESULT=$?

# Clear text (--clear-sign) signature
for i in $WORKSPACE
do
  if [ "${i}" != "${i%${CLEAR_TEXT_SIGNATURE_FILE}}" ];then
    echo "Clear text signature found: $i"
    #echo "Verifying..."
    gpg --verify $i &> /dev/null
      if [ $RESULT = 0 ]; then
        echo "Verified! Return code: $? Moving the file to the verified directory..."
        mv $i $VERIFIED
      else
        echo "Failed! Return code: $?"
      fi
  fi
done

# Detached (--detach-sign) signature
for i in $WORKSPACE
do
  if [ "${i}" != "${i%${DETACHED_SIGNATURE_FILE}}" ];then
    echo "Detached signature found: $i"
    #echo "Verifying..."
    gpg --verify $i &> /dev/null
      if [ $RESULT = 0 ]; then
        echo "Verified! Return code: $?"
      else
        echo "Failed! Return code: $?"
      fi
  fi
done
