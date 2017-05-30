FROM ubuntu:16.04

MAINTAINER fujikawa <fujikawa.naoki@mac.com>

# https://www.orca.med.or.jp/receipt/download/xenial/xenial_install_50.html

RUN set -xe \
####### 0.1
    && cd /tmp \
	&& apt-get update \
	&& apt-get -qq -y install wget sudo syslinux-common \
	&& wget -q https://ftp.orca.med.or.jp/pub/ubuntu/archive.key \
	&& apt-key add archive.key \
	&& wget -q -O /etc/apt/sources.list.d/jma-receipt-xenial50.list https://ftp.orca.med.or.jp/pub/ubuntu/jma-receipt-xenial50.list \
	&& apt-get update \
	&& apt-get dist-upgrade -y
####### 0.2
	&& apt-get update \
	&& apt-get install -y jma-receipt \
    && /bin/echo -e DBENCODING="UTF-8" >> /etc/jma-receipt/db.conf \
	&& service postgresql start \
	&& jma-setup \
	&& service jma-receipt start \
	&& /bin/echo -e "password99\npassword99" | sudo -u orca /usr/lib/jma-receipt/bin/passwd_store.sh \
    && rm -rf /tmp/* \
	&& rm -rf /var/lib/apt/lists/*

####### 0.3
COPY ./start.sh /
RUN chmod +x /start.sh
EXPOSE 8000
ENTRYPOINT ["/start.sh"]


