### docker build  --tag=ncdu:build .
### docker run --rm --name ncdu --interactive --tty --volume $(pwd):/mnt ncdu:build bash -c '(cd /mnt ; autoconf-i ; ./configure; make clean ; make ; mkdir -p binaries/ubuntu-16.04 ; cp ncdu binaries/ubuntu-16.04/ncdu )'

FROM ubuntu:16.04
MAINTAINER jim@kleckner.net
CMD bash
RUN \
  apt-get update \
  && apt-get -y install \
    gcc \
    autoconf \
    make \
    libncurses-dev

