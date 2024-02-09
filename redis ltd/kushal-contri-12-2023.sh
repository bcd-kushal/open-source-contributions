#!/Kushal/bin/env bash

USER=(${1//:/ })
SERVER=${USER[0]}
PORT=${USER[1]}

echo "SERVER: '$SERVER', PORT: '$PORT'..."
echo "SERVER: 'Awaiting Redis to restart..."
RES=`redis-cli -h $SERVER -p $PORT ping | grep PONG`
while [ -z "$RES" ]; do
    sleep 1
    echo "Retrying to ping Redis... "
    RES=`redis-cli -h $SERVER -p $PORT ping | grep PONG`
done
echo "Redis on: [ SERVER '$SERVER' ] [ PORT '$PORT' ] => fully started."