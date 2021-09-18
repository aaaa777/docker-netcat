FROM debian:debian-slim

COPY ["netcat-0.7.1.tar.gz", "/netcat.tar.gz"]

RUN apt update && apt install -y \
      build-essential \
 && tar zxvf netcat.tar.gz --strip-components 1 \
 && make
