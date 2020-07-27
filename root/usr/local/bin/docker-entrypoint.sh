#!/bin/bash
set -e

NODE="/usr/bin/node"
FOUNDRYVTT_HOME=${FOUNDRYVTT_HOME:/home/$FOUNDRYVTT_USER}
FOUNDRYVTT_URL=${FOUNDRYVTT_URL:""}
FOUNDRYVTT_OPTS=${FOUNDRYVTT_OPTS} ./resources/app/main.js --dataPath=$FOUNDRYVTT_HOME/foundrydata

# check for URL
test -n "${FOUNDRYVTT_URL}" || (echo "FOUNDRYVTT_URL not set" && false)

# remove the old zip
rm -f $FOUNDRYVTT_HOME/foundryvtt.zip

# TODO: we want foundrydata to be mountable
mkdir -p $FOUNDRYVTT_HOME/foundrydata $FOUNDRYVTT_HOME/foundrybin
wget -O $FOUNDRYVTT_HOME/foundryvtt.zip "$FOUNDRYVTT_URL"
unzip -d $FOUNDRYVTT_HOME/foundrybin $FOUNDRYVTT_HOME/foundryvtt.zip

# CMD["node resources/app/main.js --dataPath=/home/foundryvtt/foundrydata"]
cd $FOUNDRYVTT_HOME/foundrybin
exec 0<&-
exec ${NODE} ${FOUNDRYVTT_OPTS}
