FROM ubuntu:14.04
MAINTAINER mehdi devop@edge.com

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

RUN echo "deb http://de.archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse\n deb http://de.archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse\n deb http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse" >> /etc/apt/sources.list.d/pkgs.list
RUN apt-get update
RUN apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install curl git-core unzip vim-tiny build-essential python-software-properties  software-properties-common locate pwgen wget tzdata htop 

RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer


