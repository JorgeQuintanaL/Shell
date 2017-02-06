#!/bin/bash

TO_CONVERT="$1"

for file in ./*
do
	iconv -f latin1 -t ${TO_CONVERT}//TRANSLIT  ${file#*\/} >converted2_${file#*\/}
done
