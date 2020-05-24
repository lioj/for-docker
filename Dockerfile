FROM debian:latest

MAINTAINER Ramil Mintaev <ramil.mintaev@gmail.com>

RUN apt-get update && apt-get install g++ cmake\
 libboost-dev libboost-date-time-dev libboost-regex-dev\
 libboost-program-options-dev libboost-filesystem-dev\
 libboost-thread-dev libboost-random-dev\
 libpq-dev libssl-dev wget
WORKDIR /tmp
RUN wget https://github.com/emweb/wt/archive/3.6.1.tar.gz &&\
 tar -xf 3.6.1.tar.gz && mkdir wt-3.6.1/build && cd wt-3.6.1/build\
 && cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .. && make -j 2 && make install\
 && cd / && rm -r /tmp/*

