FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive
COPY scripts /tmp
RUN /tmp/install.sh
ADD docker/xrdp.conf /etc/supervisor/conf.d/xrdp.conf
CMD ["supervisord", "-n"]
EXPOSE 3389
VOLUME /root/dude
