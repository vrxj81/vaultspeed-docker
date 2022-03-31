FROM alpine:3.15

ARG VS_USER
ARG VS_PW
ARG ORACLE_INSTALL="N"

ENV VS_USER=${VS_USER}
ENV VS_PW=${VS_PW}
ENV ORACLE_INSTALL=${ORACLE_INSTALL}

RUN apk update \
    && apk add --no-cache git less openssh openjdk8 \
    && apk add --no-cache --virtual .agent_deps curl jq unzip \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apk/* \
    && export VS_TOKEN=$(curl -s -X POST -H 'Content-type: application/json' -d "{ \"username\": \"${VS_USER}\", \"password\": \"${VS_PW}\" }" https://training-eu.vaultspeed.com/api/login | jq -r '.access_token') \
    && curl -X GET -H 'Content-type: application/json' -H "Authorization: Bearer ${VS_TOKEN}" https://training-eu.vaultspeed.com/api/agent/download -o /tmp/agent.zip \
    && unzip -q /tmp/agent.zip -d /home \
    && mkdir /home/agent/conf \
    && mv /home/agent/*.properties /home/agent/conf/ \
    && sed -i 's#/home/agent/connection#/home/agent/conf/connection#' /home/agent/conf/client.properties \
    && rm -rf /tmp/agent.zip \
     && apk del .agent_deps

RUN apk add --update --no-cache --virtual .oracle_deps curl rpm2cpio \ 
    && if [ "$ORACLE_INSTALL" == "Y" ]; \ 
    then \
        curl https://download.oracle.com/otn_software/linux/instantclient/191000/oracle-instantclient19.10-basiclite-19.10.0.0.0-1.$(uname -m).rpm -o /tmp/instantclient.rpm && \
        curl https://download.oracle.com/otn_software/linux/instantclient/191000/oracle-instantclient19.10-sqlplus-19.10.0.0.0-1.$(uname -m).rpm -o /tmp/sqlplus.rpm && \
        cd / && \
        rpm2cpio /tmp/instantclient.rpm | cpio -idmv &&\
        rpm2cpio /tmp/sqlplus.rpm | cpio -idmv &&\
        rm -rf /tmp/*.rpm; \
    fi \
    && apk del .oracle_deps

WORKDIR /home/agent

CMD ["java", "-Djava.util.logging.config.file=/home/agent/conf/logging.properties",  "-jar", "/home/agent/vs-agent.jar",  "propsfile=/home/agent/conf/client.properties"]