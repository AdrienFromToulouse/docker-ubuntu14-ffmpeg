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
