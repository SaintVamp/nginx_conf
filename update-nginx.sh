#!/bin/bash
if [ ! "$1" ]
then
    echo "please open backup-port to visit luci or ssh!!!"
    echo "please open backup-port to visit luci or ssh!!!"
    echo "please open backup-port to visit luci or ssh!!!"
    echo "after 10 sec ,run script."
    sleep 1
    echo "after 9 sec ,run script."
    sleep 1
    echo "after 8 sec ,run script."
    sleep 1
    echo "after 7 sec ,run script."
    sleep 1
    echo "after 6 sec ,run script."
    sleep 1
    echo "after 5 sec ,run script."
    sleep 1
    echo "after 4 sec ,run script."
    sleep 1
    echo "after 3 sec ,run script."
    sleep 1
    echo "after 2 sec ,run script."
    sleep 1
    echo "after 1 sec ,run script."
    sleep 1
fi
ca_path=/etc/nginx/ca/
if [ -d $ca_path ]
then
    echo "path exist"
    ssl_cer=/etc/nginx/ca/svsoft.fun.cer
    ssl_key=/etc/nginx/ca/svsoft.fun.key
    if [ ! -e "$ssl_cer" ]; then
        curl -o /etc/nginx/ca/svsoft.fun.cer https://gitee.com/saintvamp/nginx_conf/raw/master/svsoft.fun.cer
    fi
    if [ ! -e "$ssl_key" ]; then
        curl -o /etc/nginx/ca/svsoft.fun.key https://gitee.com/saintvamp/nginx_conf/raw/master/svsoft.fun.key
    fi
else
    mkdir /etc/nginx/ca/
    curl -o /etc/nginx/ca/svsoft.fun.cer https://gitee.com/saintvamp/nginx_conf/raw/master/svsoft.fun.cer
    curl -o /etc/nginx/ca/svsoft.fun.key https://gitee.com/saintvamp/nginx_conf/raw/master/svsoft.fun.key
fi

hostname=$(uci get system.@system[0].hostname)
if [ "$hostname" = "R404" ]; then
    curl -o /etc/nginx/nginx.conf https://gitee.com/saintvamp/nginx_conf/raw/master/nginx-404.conf
elif [ "$hostname" = "R2804" ]; then
    curl -o /etc/nginx/nginx.conf https://gitee.com/saintvamp/nginx_conf/raw/master/nginx-2804.conf
fi
sleep 2
uci set nginx.global.uci_enable=false
/etc/init.d/nginx restart