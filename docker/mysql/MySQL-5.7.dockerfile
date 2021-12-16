FROM mysql:5.7

ADD conf/mysql-docker.cnf /etc/mysql/conf.d/z99-docker.cnf
