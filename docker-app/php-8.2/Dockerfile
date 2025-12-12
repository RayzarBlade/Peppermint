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
RUN apt-get install -y php8.2
RUN apt-get install -y php8.2-common php8.2-cli
RUN apt-get install -y php8.2-bz2
RUN apt-get install -y php8.2-curl
RUN apt-get install -y php8.2-intl
RUN apt-get install -y php8.2-mysql
RUN apt-get install -y php8.2-readline
RUN apt-get install -y php8.2-xml
RUN apt-get install -y php8.2-bcmath
RUN apt-get install -y php8.2-mbstring
RUN apt-get install -y php8.2-xdebug
RUN apt-get install -y php8.2-gd
RUN apt-get install -y php8.2-zip
RUN apt-get install -y libapache2-mod-php8.2
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