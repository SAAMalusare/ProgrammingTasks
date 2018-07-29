FROM ubuntu:trusty
LABEL maintainer "suhas.malusare@hmail.com"

RUN	apt-get install perl
RUN	adduser --quiet --disabled-password --shell /bin/bash --home /home/suhas --gecos "User" suhas
RUN	echo "suhas:pass123" | chpasswd
RUN	usermod -aG sudo suhas 
RUN mkdir	/home/suhas/workdir
RUN pwd
RUN ls -lha
#copy	.\test.pl	/home/suhas/workdir/test.pl	