#!/bin/bash

list=$1

command=$(cat stress.sh)
while read -r i
	do
		$command -m "$i"
		echo "$i">>sent
	done < $list




