### docker build  --tag=ncdu:build .
### docker run --rm --name ncdu --interactive --tty ncdu:build
### docker run --rm --name ncdu --interactive --tty --volume $(pwd):/mnt ncdu:build bash -c '(cd /mnt ; autoconf -i ; ./configure; make clean ; make ; mkdir -p binaries/ubuntu-16.04 ; cp ncdu binaries/ubuntu-16.04/ncdu )'

#FROM ubuntu:16.04
FROM ubuntu:latest
MAINTAINER jim@kleckner.net
RUN \
  apt-get update \
  && apt-get -y install \
    apt-utils \
    gcc \
    autoconf \
    pkg-config \
    make \
    libncurses-dev

ENV build_dir=/ncdu
WORKDIR $build_dir

ADD src/ $build_dir/src/
ADD static/ $build_dir/static/
ADD deps/ $build_dir/deps/
ADD doc/ $build_dir/doc/
ADD ChangeLog configure.ac COPYING Dockerfile Makefile.am README $build_dir/

VOLUME /mnt

CMD bash -c "autoreconf -if && ./configure&& make clean && make && mkdir -p /mnt/ncdu-binaries/ubuntu-16.04 && cp ncdu /mnt/ncdu-binaries/ubuntu-16.04/ncdu"

# docker run --rm --name ncdu --interactive --tty --volume /tmp:/mnt ncdu:latest

# docker run --rm --name ncdu --interactive --tty --volume /tmp:/mnt ncdu:latest bash -c '(cd /ncdu ; autoreconf -if ; ./configure; make clean ; make ; mkdir -p /mnt/binaries/ubuntu-16.04 ; cp ncdu /mnt/binaries/ubuntu-16.04/ncdu )'

# COPY src .
# COPY static .
# COPY ChangeLog .
# COPY configure.ac .
# COPY COPYING .
# COPY Dockerfile .
# COPY Makefile.am .
# COPY README .

# docker run --rm --name ncdu --interactive --tty --volume /tmp:/mnt ncdu:latest bash -c '(cd /ncdu ; autoreconf -if ; ./configure; make clean ; make ; mkdir -p /mnt/binaries/ubuntu-16.04 ; cp ncdu /mnt/binaries/ubuntu-16.04/ncdu )'

# docker run --rm --name ncdu --interactive --tty --volume $(pwd):/mnt ncdu:build bash -c '(cd /mnt ; autoreconf -i ; ./configure; make clean ; make ; mkdir -p binaries/ubuntu-16.04 ; cp ncdu binaries/ubuntu-16.04/ncdu )'

#   RUN apt-get update
#   RUN apt-get -y install apt-utils
#   RUN \
#     apt-get -y install \
#       apt-utils \
#       gcc \
#       autoconf \
#       make \
#       libncurses-dev
#
