FROM debian:stable-slim

# args
ARG FOUNDRYVTT_USER="foundryvtt"
ARG FOUNDRYVTT_GROUP="foundryvtt"
ARG FOUNDRYVTT_HOME="/home/$FOUNDRYVTT_USER"

# env ars
ENV \
    FOUNDRYVTT_HOME="$FOUNDRYVTT_HOME"

# get fs
COPY root /

# install ssl for https
RUN apt update && apt install -y libssl-dev curl sudo bash wget unzip
# configure node repo and install
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
RUN apt update && apt install -y nodejs
# create foundryvtt user and group
RUN set -x \
    && groupadd -r $FOUNDRYVTT_GROUP && useradd -r -g $FOUNDRYVTT_GROUP $FOUNDRYVTT_USER \
    && mkdir $FOUNDRYVTT_HOME \
    && chown -R $FOUNDRYVTT_USER:$FOUNDRYVTT_GROUP $FOUNDRYVTT_HOME \
    && usermod -d $FOUNDRYVTT_HOME $FOUNDRYVTT_USER

EXPOSE 30000/tcp

VOLUME ["$FOUNDRYVTT_HOME/foundrydata"]

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["node"]