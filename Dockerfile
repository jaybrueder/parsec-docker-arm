FROM resin/rpi-raspbian

RUN apt-get update && \
  apt-get -y install wget pulseaudio

RUN wget https://s3.amazonaws.com/parsec-build/package/parsec-rpi.deb

RUN apt-get update && \
  dpkg -i parsec-rpi.deb || true && \
  yes | apt-get -f install && \
  apt-get clean && \
  echo enable-shm=no >> /etc/pulse/client.conf && \
  useradd -ms /bin/bash parsec

USER parsec
WORKDIR /home/parsec

CMD ["/usr/bin/parsec"]