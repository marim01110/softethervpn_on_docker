FROM ubuntu:21.04
MAINTAINER Kohei Yoshikawa <marimo3418@neko2.net>
WORKDIR /run
RUN apt update \
    && apt upgrade -y \
    && apt install software-properties-common -y
RUN add-apt-repository ppa:paskal-07/softethervpn \
    && apt remove software-properties-common -y \
    && apt autoremove -y
RUN apt update \
    && apt install softether-vpnserver -y
RUN mkdir softether \
    && chmod 755 softether
COPY ./startup.sh /opt/startup.sh
RUN chmod +x /opt/startup.sh
ENTRYPOINT [ "/opt/startup.sh" ]
#CMD sleep infinity