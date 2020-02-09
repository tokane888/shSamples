#!/bin/bash

set -eux

read -n1 -p "ok? (y/N): " yn
if [[ $yn = [yY] ]]; then
  echo hello
else
  echo abort
  exit 0
fi

sub() {
  echo $(date +%T)
  echo "sub started"
	sleep 3
  echo "sleep ended"
  #exit 1
  echo $(date +%T)
  echo "sub ended"
}

echo "Working in the background. Log will be outputted to test.log."
export -f sub
set +e
nohup bash -c sub > test.log 2>&1
result=$?
set -e
if [ $result != 0 ]; then
  echo "Failed inside nohup. Please see test.log for detail."
  exit 1
fi

echo "完了"

