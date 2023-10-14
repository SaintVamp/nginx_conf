#curl -o /etc/nginx/update.sh https://gitee.com/saintvamp/nginx_conf/raw/master/update-404.sh
host_name=$(uci get system.@system[0].hostname)
if [ "$host_name" = 'R404' ]; then
    curl -o /etc/nginx/nginx.conf https://gitee.com/saintvamp/nginx_conf/raw/master/nginx-404.conf
elif [ "$host_name" = 'R2804' ]; then
    curl -o /etc/nginx/nginx.conf https://gitee.com/saintvamp/nginx_conf/raw/master/nginx-2804.conf
fi
sleep 2
/etc/init.d/nginx restart
