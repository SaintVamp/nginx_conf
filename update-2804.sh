#curl -o /etc/nginx/update.sh https://gitee.com/saintvamp/nginx_conf/raw/master/update-2804.sh
curl -o /etc/nginx/nginx.conf https://gitee.com/saintvamp/nginx_conf/raw/master/nginx-2804.conf
/etc/init.d/nginx restart
