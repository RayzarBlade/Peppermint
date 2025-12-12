FROM ubuntu:24.04

ARG NODE_VERSION=24

# Define working directory
WORKDIR /var/www/html

ENV DEBIAN_FRONTEND=noninteractive

# Install apache2
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils curl zip unzip git apache2 apache2-utils tzdata
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN add-apt-repository ppa:ondrej/apache2
RUN apt-get update
RUN apt-get install -y php8.4
RUN apt-get install -y php8.4-common php8.4-cli
RUN apt-get install -y php8.4-bz2
RUN apt-get install -y php8.4-curl
RUN apt-get install -y php8.4-intl
RUN apt-get install -y php8.4-mysql
RUN apt-get install -y php8.4-readline
RUN apt-get install -y php8.4-xml
RUN apt-get install -y php8.4-bcmath
RUN apt-get install -y php8.4-mbstring
RUN apt-get install -y php8.4-xdebug
RUN apt-get install -y php8.4-gd
RUN apt-get install -y php8.4-zip
RUN apt-get install -y libapache2-mod-php8.4
RUN apt-get update
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
ENV NVM_DIR="/root/.nvm"
RUN . "$NVM_DIR/nvm.sh" &&  \
    nvm install $NODE_VERSION
RUN apt-get install -y composer
RUN apt-get clean

# expose the port 80
EXPOSE 80

# Define default command
ENTRYPOINT [ "/usr/sbin/apache2ctl" ]
CMD ["-D", "FOREGROUND" ]