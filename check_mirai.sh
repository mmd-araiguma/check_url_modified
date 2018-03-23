#!/bin/sh

#" "の中にチェックしたいURLを書く
url="http://magicalmirai.com/2018/"

header=$(curl -I $url)
modified=$(echo $header | grep -o "Last-Modified.*GMT")
while true
do
    #5分毎に対象のサイトの更新履歴を確認
    sleep 5m
    header=$(curl -I $url)
    modified2=$(echo $header | grep -o "Last-Modified.*GMT")
    if [ "${modified}" != "${modified2}" ];
    then
	echo "magical mirai site chenged!"
	break
    fi
    modified=$modified2
done
