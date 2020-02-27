FROM ubuntu:16.04

WORKDIR /app

RUN apt-get update \
    && apt-get install curl snmp snmpd snmp-mibs-downloader --yes \
    && curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh \
    && bash nodesource_setup.sh \
    && rm nodesource_setup.sh \
    && apt-get install nodejs --yes \
    && mkdir /data
    
COPY snmpd.conf /etc/snmp/
COPY snmp.conf /etc/snmp/
COPY snmp-process .
COPY entrypoint.sh .
    
EXPOSE 3000

CMD ["bash", "entrypoint.sh"]