FROM ubuntu:latest
MAINTAINER gpwclark

# install ubuntu prereqs to install nfd
RUN apt-get update && apt-get install -y \
  vim \
  software-properties-common

# install nfd
RUN  add-apt-repository -y ppa:named-data/ppa
RUN  apt-get update
RUN  apt-get install -y nfd

# ndn defaults
EXPOSE 6363

COPY nfd.conf.sample /etc/ndn/nfd.conf

# Housekeeping
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#run nfd
CMD ["/usr/bin/nfd"]
