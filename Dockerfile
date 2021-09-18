FROM debian:11-slim

ENV NMAP_DOWNLOAD_LINK="https://nmap.org/dist/nmap-7.92.tar.bz2"

RUN apt update && apt install -y \
      build-essential \
      curl \
 && curl -sL $NMAP_DOWNLOAD_LINK \
 |  bzip2 -cd - | tar xvf - \
 && cd nmap-7.92 \
 && ./configure \
 && make install

ENTRYPOINT /usr/local/bin/ncat

CMD ["--help"]
