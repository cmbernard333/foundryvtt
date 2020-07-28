#!/usr/bin/env bash

# docker-entrypoint.sh script for Foundryctt Docker container
# License: MIT
# Github: https://github.com/cmbernard333/foundryvtt.git
set -Eeuo pipefail

NODE="/usr/bin/node"
FOUNDRYVTT_BIN=${FOUNDRYVTT_HOME}/foundrybin
FOUNDRYVTT_DATA=${FOUNDRYVTT_HOME}/foundrydata
FOUNDRYVTT_CERT=${FOUNDRYVTT_HOME}/foundrycert
FOUNDRYVTT_URL="${FOUNDRYVTT_URL}"
FOUNDRYVTT_OPTS="${FOUNDRYVTT_OPTS} ./resources/app/main.js --dataPath=${FOUNDRYVTT_DATA}"

# check for URL
test -n "${FOUNDRYVTT_URL}" || (echo "FOUNDRYVTT_URL not set" && false)

# TODO: we want foundrydata to be mountable
mkdir -p $FOUNDRYVTT_DATA $FOUNDRYVTT_BIN $FOUNDRYVTT_CERT

# remove the old zip
rm -f $FOUNDRYVTT_HOME/foundryvtt.zip
wget -O $FOUNDRYVTT_HOME/foundryvtt.zip "$FOUNDRYVTT_URL"
unzip -d $FOUNDRYVTT_BIN $FOUNDRYVTT_HOME/foundryvtt.zip

cd $FOUNDRYVTT_BIN
exec 0<&-
exec ${NODE} ${FOUNDRYVTT_OPTS}
