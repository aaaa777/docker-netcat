FROM debian:11-slim

ENV NMAP_DOWNLOAD_LINK="https://nmap.org/dist/nmap-7.92.tar.bz2"

RUN apt update && apt install -y \
      build-essential \
      curl \
 && mkdir nmap && cd nmap \
 && curl -sL $NMAP_DOWNLOAD_LINK \
 |  bzip2 -cd - | tar xvf - --strip-compornents 1 \
 && cd nmap \
 && ./configure \
 && make install

CMD ["ncat", "-v"]
