FROM alpine:latest
ARG AIRFLOW_UID
ENV AIRFLOW_VERSION="2.2.3"
ENV AIRFLOW_HOME=/opt/airflow
ENV AIRFLOW_UID=$AIRFLOW_UID 

ADD snowflake_connector_python-2.7.1-cp39-cp39-linux_aarch64.whl /tmp/

RUN apk update \
    && apk add --no-cache openjdk8 python3 py3-pip libpq musl \
    && export JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk/" \
    && export LD_LIBRARY_PATH="/lib/:/usr/lib/:/usr/local/lib/:$(find /usr/lib/jvm/ -type d -name server)/:$(find /usr/lib/jvm/ -type d -name server -exec dirname {} \;)/" \
    && export PATH="$PATH:$JAVA_HOME/bin" \
    && apk add --no-cache --virtual .airflow_build_deps build-base python3-dev libffi-dev libpq-dev openssl-dev musl-dev cmake curl \
    && rm -rf /var/cache/apk/* \
    && pip install --upgrade pip setuptools wheel \
    && pip install --ignore-installed packaging \
    && if [ "$(uname -m)" = aarch64 ]; then pip install /tmp/snowflake_connector_python-2.7.1-cp39-cp39-linux_aarch64.whl; fi \
    && pip install flask_admin>=1.5.8 croniter>=0.3 "apache-airflow[jdbc,postgres,snowflake]==${AIRFLOW_VERSION}" --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-$(python3 --version | cut -d " " -f 2 | cut -d "." -f 1-2).txt" \
    && airflow db init \
    && adduser "airflow" -u "${AIRFLOW_UID}" -G "root" -h "${AIRFLOW_HOME}" -D && \
    mkdir -pv "${AIRFLOW_HOME}/dags"; \
    mkdir -pv "${AIRFLOW_HOME}/logs"; \
    chown -R "airflow:root" "${AIRFLOW_HOME}"; \
    find "${AIRFLOW_HOME}" -executable -print0 -exec chmod g+x {} + && \
    find "${AIRFLOW_HOME}" -print0 -exec chmod g+rw {} + && \
    ln -s $(find /usr/lib/jvm/ -name libjvm.so) $(find /usr/lib/jvm/ -name libjvm.so | sed 's#/server##') \
    && apk del --purge .airflow_build_deps \
    && rm -rf /tmp/snowflake_connector_python

WORKDIR ${AIRFLOW_HOME}

EXPOSE 8080

USER ${AIRFLOW_UID}
ENV JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk/"
ENV LD_LIBRARY_PATH="/lib/:/usr/lib/:/usr/local/lib/:$(find /usr/lib/jvm/ -type d -name server)/:$(find /usr/lib/jvm/ -type d -name server -exec dirname {} \;)/"
ENV PATH="$PATH:$JAVA_HOME/bin"

ENTRYPOINT [ "airflow" ]
