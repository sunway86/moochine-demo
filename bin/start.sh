# set global variables
#export OPENRESTY_HOME=/usr/local/openresty
#export MOOCHINE_HOME=/your/path/to/moochine

PWD=`pwd`

NGINX_FILES=$PWD"/nginx_runtime"

mkdir -p $NGINX_FILES
mkdir -p $NGINX_FILES"/conf"
mkdir -p $NGINX_FILES"/logs"

cat $PWD/conf/nginx.conf | sed -e "s|__MOOCHINE_HOME_VALUE__|$MOOCHINE_HOME|"\
                         | sed -e "s|__MOOCHINE_APP_VALUE__|$PWD|"\
                         > $NGINX_FILES/conf/p-nginx.conf 

$OPENRESTY_HOME/nginx/sbin/nginx -p $NGINX_FILES/ -c conf/p-nginx.conf

echo "nginx started!"
