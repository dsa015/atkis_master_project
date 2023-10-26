FROM postgres:16

RUN apt-get update && \
    apt-get install -y postgis
#-----------------------------------
COPY *.sql /docker-entrypoint-initdb.d/dbfiles/
COPY *.dat /docker-entrypoint-initdb.d/dbfiles/
USER postgres
