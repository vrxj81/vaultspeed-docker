FROM postgres:alpine

ENV POSTGRES_USER vaultspeed
ENV POSTGRES_PASSWORD Vs123456
ENV POSTGRES_DB moto

#COPY dump/motodata.exp /tmp/
# Copier les scripts d'init dans : 
ADD scripts/*.sql /docker-entrypoint-initdb.d/

COPY docker-healthcheck /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-healthcheck

HEALTHCHECK CMD ["docker-healthcheck"]