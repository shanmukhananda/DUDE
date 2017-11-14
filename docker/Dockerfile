FROM ubuntu:17.10
ENV DEBIAN_FRONTEND noninteractive
COPY scripts /tmp
RUN /tmp/install.sh
ADD docker/xrdp.conf /etc/supervisor/conf.d/xrdp.conf
CMD ["/usr/bin/supervisord", "-n"]
EXPOSE 3389
