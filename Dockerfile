FROM alpine:3.12 AS builder

RUN apk --no-cache -U add \
  git \
  build-base \
  autoconf \
  automake \
  libtool \
  alsa-lib-dev \
  libdaemon-dev \
  popt-dev \
  libressl-dev \
  soxr-dev \
  avahi-dev \
  libconfig-dev

RUN mkdir /root/shairport-sync && \
  git clone https://github.com/mikebrady/shairport-sync.git /root/shairport-sync

WORKDIR /root/shairport-sync

RUN autoreconf -i -f \
  && ./configure \
  --with-alsa \
  --with-pipe \
  --with-avahi \
  --with-ssl=openssl \
  --with-soxr \
  --with-metadata \
  --sysconfdir=/etc \
  && make \
  && make install

##############################################

FROM alpine:3.12

RUN apk add --no-cache \
  dbus \
  alsa-lib \
  libdaemon \
  popt \
  libressl \
  soxr \
  avahi \
  libconfig \
  && rm -rf \
  /etc/ssl \
  /lib/apk/db/* \
  /root/shairport-sync

COPY --from=builder /etc/shairport-sync* /etc/
COPY --from=builder /usr/local/bin/shairport-sync /usr/local/bin/shairport-sync

ENV AIRPLAY_NAME Docker

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
