#image name
FROM ubuntu:latest

# labelling
LABEL name="Artur N."
LABEL maintainer="hrobbin@student.21-school.ru"

#running commands in the image to update, upgrade, and install wget
#server, databeses, and PHP
#fpm - Process Manager of FastCGI, mysql, mbstring provides support for multi-byte strings
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install wget sudo bash nginx vim software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    sudo apt-get -y install python3.8 python3-venv python3-pip python3-dev libpq-dev postgresql postgresql-contrib && \
    export PATH=$PATH:/usr/lib/postgresql/12/bin && \
    pip install --upgrade pip && \
    pip3 install psycopg2


#copy everything to container
COPY ./srcs/* .

#phpMyAdmin setup: create dir, download a., decompress a., remove a., move a. to dir

#SSL setup. SSL (Secure Sockets Layer). Cert-s cryptographically establish an encrypted link between a web server and a browser.
#Certificate Signing Request is a message sent from applicant to registration authority  to obtain a digital cert.
#An X.509 certificate contains a public key and an identity, and is either signed by a certificate authority or self-signed.
#nodes = not to encrypt the output key
#2048 because is the minimal size to obtain the cert

#setup nginx
#setup wordpress
#set workdir
WORKDIR /var/www/hrobbin
RUN sudo service postgresql start
# then run 'sudo -u postgres -i' to get into databases
#specify the ports to listen (does not actually publish them)
EXPOSE 80 443

#specifying what is run when we run the image
ENTRYPOINT /bin/bash