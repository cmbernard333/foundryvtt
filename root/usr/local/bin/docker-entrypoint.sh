#!/bin/bash
set -e

NODE="/usr/bin/node"
FOUNDRY_HOME=${FOUNDRY_HOME:/home/foundryvtt}

# remove the old zip
rm -f $FOUNDRYVTT_HOME/foundryvtt.zip

# TODO: we want foundrydata to be mountable
mkdir -p $FOUNDRYVTT_HOME/foundrydata $FOUNDRYVTT_HOME/foundrybin
wget -O $FOUNDRYVTT_HOME/foundryvtt.zip "$FOUNDRYVTT_URL"
unzip -d $FOUNDRYVTT_HOME/foundrybin $FOUNDRYVTT_HOME/foundryvtt.zip

# CMD["node resources/app/main.js --dataPath=/home/foundryvtt/foundrydata"]
cd $FOUNDRYVTT_HOME/foundrybin
exec 0<&-
exec ${NODE} ./resources/app/main.js --dataPath=$FOUNDRYVTT_HOME/foundrydata
