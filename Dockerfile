FROM debian:jessie
MAINTAINER maintainer@codeship.com

RUN apt-get update && \
    apt-get install -y locales && \
    rm -rf /var/lib/apt/lists/* && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get update && \
    apt-get install -y postgresql-9.4 postgresql-contrib-9.4 && \
    rm -rf /var/lib/apt/lists/*

RUN pg_dropcluster --stop 9.4 main && \
    pg_createcluster --locale en_US.UTF-8 --start 9.4 main

RUN echo "\
synchronous_commit = off\n\
fsync = off\n\
full_page_writes = off\n\
checkpoint_segments = 100\n\
wal_writer_delay = 5000ms\n\
listen_addresses = '*'\n\
" >> /etc/postgresql/9.4/main/postgresql.conf

RUN echo 'host all all 0.0.0.0/0 password' >> /etc/postgresql/9.4/main/pg_hba.conf

RUN service postgresql start && \
    su postgres -c "psql -c \"ALTER USER postgres PASSWORD 'password'\"" && \
    service postgresql stop

USER postgres
CMD ["/usr/lib/postgresql/9.4/bin/postgres", "-D", "/var/lib/postgresql/9.4/main", "-c", "config_file=/etc/postgresql/9.4/main/postgresql.conf"]
