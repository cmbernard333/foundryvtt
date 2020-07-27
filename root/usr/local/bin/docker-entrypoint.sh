#!/bin/bash
set -Eeuo pipefail

NODE="/usr/bin/node"
FOUNDRYVTT_HOME=${FOUNDRYVTT_HOME:/home/$FOUNDRYVTT_USER}
FOUNDRYVTT_BIN=${FOUNDRYVTT_HOME}/foundrybin
FOUNDRYVTT_DATA=${FOUNDRYVTT_HOME}/foundrydata
FOUNDRYVTT_URL=${FOUNDRYVTT_URL:""}
FOUNDRYVTT_OPTS=${FOUNDRYVTT_OPTS} ./resources/app/main.js --dataPath=${FOUNDRYVTT_DATA}

# check for URL
test -n "${FOUNDRYVTT_URL}" || (echo "FOUNDRYVTT_URL not set" && false)

# remove the old zip
rm -f $FOUNDRYVTT_HOME/foundryvtt.zip

# TODO: we want foundrydata to be mountable
mkdir -p $FOUNDRYVTT_DATA $FOUNDRYVTT_BIN
wget -O $FOUNDRYVTT_HOME/foundryvtt.zip "$FOUNDRYVTT_URL"
unzip -d $FOUNDRYVTT_BIN $FOUNDRYVTT_HOME/foundryvtt.zip

cd $FOUNDRYVTT_BIN
exec 0<&-
exec ${NODE} ${FOUNDRYVTT_OPTS}
