#!/bin/sh
DIR=$( cd "$(dirname "$0")" ; pwd -P )
. $DIR/env.sh
curl --socks5-hostname $SOCKS_PROXY --retry 1 --connect-timeout 10 $1| grep -E -o '[0-9a-zA_Z]+\.onion'
