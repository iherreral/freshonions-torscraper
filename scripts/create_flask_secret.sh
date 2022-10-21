#!/bin/sh
DIR=$( cd "$(dirname "$0")" ; pwd -P )
. $DIR/env.sh
python2.7 $SCRIPTDIR/create_flask_secret.py
