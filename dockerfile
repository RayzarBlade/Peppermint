FROM ubuntu:21.10

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
RUN apt-get install -y php8.1
RUN apt-get install -y php8.1-common php8.1-cli -y
RUN apt-get install -y php8.1-bz2
RUN apt-get install -y php8.1-curl
RUN apt-get install -y php8.1-intl
RUN apt-get install -y php8.1-mysql
RUN apt-get install -y php8.1-readline
RUN apt-get install -y php8.1-xml
RUN apt-get install -y php8.1-bcmath
RUN apt-get install -y php8.1-mbstring
RUN apt-get install -y php8.1-xdebug
RUN apt-get install -y php8.1-gd
RUN apt-get install -y php8.1-zip
RUN apt-get install -y libapache2-mod-php8.1
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y composer
RUN apt-get clean

# expose the port 80
EXPOSE 80

# Define default command
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "apache2ctl", "-D", "FOREGROUND" ]