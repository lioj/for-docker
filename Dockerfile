FROM lioj/wt-3-on-debian:latest

MAINTAINER Ramil Mintaev <ramil.mintaev@gmail.com>

RUN apt-get update && \
 apt-get upgrade -y && \
 apt-get install -y libz-dev libcurl4-gnutls-dev

WORKDIR /tmp
RUN wget https://github.com/aws/aws-sdk-cpp/archive/version1.8.zip\
 && unzip version1.8.zip && mkdir aws-sdk-cpp-version1.8/build\
 && cd aws-sdk-cpp-version1.8/build\
 && wget https://github.com/awslabs/aws-c-common/archive/master.zip\
 && unzip master.zip && mkdir aws-c-common-master/build && cd aws-c-common-master/build\
 && cmake .. -DCMAKE_PREFIX_PATH=/usr -DCMAKE_INSTALL_PREFIX:PATH=/usr && make && make install\
 && cd ../.. && rm master.zip && wget https://github.com/awslabs/aws-checksums/archive/master.zip\
 && unzip master.zip && mkdir aws-checksums-master/build && cd aws-checksums-master/build\
 && cmake .. -DCMAKE_PREFIX_PATH=/usr -DCMAKE_INSTALL_PREFIX:PATH=/usr && make && make install\
 && cd ../.. && rm master.zip && wget https://github.com/awslabs/aws-c-event-stream/archive/master.zip\
 && unzip master.zip && mkdir aws-c-event-stream-master/build && cd aws-c-event-stream-master/build\
 && cmake .. -DCMAKE_PREFIX_PATH=/usr -DCMAKE_INSTALL_PREFIX:PATH=/usr && make && make install\
 && cd ../.. && cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr -DBUILD_ONLY="s3;email" && make && make install\
 && cd / && rm -r /tmp/*
  

