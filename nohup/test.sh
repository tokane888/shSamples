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
	sleep 3
	echo test > log.txt
}

echo "nohup直前"
export -f sub
nohup bash -c sub > /dev/null 2>&1
echo "完了"

