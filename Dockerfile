FROM ubuntu:14.04

MAINTAINER Adrien

####
# Install Node.js
RUN apt-get update && \
    apt-get -y install curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
    apt-get install --yes nodejs

####
# Install ffmpeg
RUN apt-get install software-properties-common python-software-properties -y && \
    add-apt-repository multiverse && \
    add-apt-repository ppa:djcj/hybrid && \
    apt-get update -y && \
    apt-get install ffmpeg -y

RUN apt-get install unzip wget

####
# Install AWS x-ray http://docs.aws.amazon.com/xray/latest/devguide/xray-daemon.html
RUN wget https://s3.amazonaws.com/aws-xray-assets.us-east-1/xray-daemon/aws-xray-daemon-linux-2.x.zip -P /tmp
RUN unzip /tmp/aws-xray-daemon-linux-2.x.zip -d /usr/local/bin

CMD /usr/local/bin/xray --log-file /var/log/xray-daemon.log &
