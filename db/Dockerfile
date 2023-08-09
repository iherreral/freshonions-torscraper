FROM mariadb:10.2
ENV MYSQL_USER=torscraper
ENV MYSQL_PASSWORD=password
ENV MYSQL_DATABASE=tor
ENV MYSQL_ROOT_PASSWORD=somethingcomplicated
COPY maxallowedpacket.cnf /etc/mysql/conf.d/
COPY schema.sql /docker-entrypoint-initdb.d/
