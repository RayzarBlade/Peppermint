FROM ubuntu:21.04

# Copy ssh key
COPY etc/ssh /opt/docker/etc/ssh
COPY etc/entrypoint.sh entrypoint.sh


# Define working directory
WORKDIR /root

# Create Entry point
COPY etc/entrypoint.sh entrypoint.sh
RUN chmod +x /entrypoint.sh


# Create ssh key in file structure
RUN mkdir ~/.ssh
RUN cp /opt/docker/etc/ssh/authorized_keys ~/.ssh/

# Install apache2
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y apache2
RUN apt-get install -y apache2-utils
RUN apt-get install -y git
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN add-apt-repository ppa:ondrej/apache2
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y php8.0-common php8.0-cli -y
RUN apt-get install -y php8.0-bz2
RUN apt-get install -y php8.0-curl
RUN apt-get install -y php8.0-intl
RUN apt-get install -y php8.0-mysql
RUN apt-get install -y php8.0-readline
RUN apt-get install -y php8.0-xml
RUN apt-get install -y php8.0-bcmath
RUN apt-get install -y php8.0-mbstring
RUN apt-get install -y php8.0-xdebug
RUN apt-get install -y php8.0-gd
RUN apt-get install -y php8.0-zip
RUN apt-get install -y libapache2-mod-php8.0
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y composer
RUN apt-get clean

# expose the port 80
EXPOSE 80

# Define default command
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "apache2ctl", "-D", "FOREGROUND" ]