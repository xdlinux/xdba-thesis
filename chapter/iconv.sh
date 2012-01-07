#!/bin/bash
for file in `ls|grep '\.tex$'`
do
    iconv -f GBK -t utf8 $file -o "../chapter-utf8/$file"
done
