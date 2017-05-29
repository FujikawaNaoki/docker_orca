FROM ubuntu:16.04
MAINTAINER fujikawa <fujikawa.naoki@mac.com>

# https://www.orca.med.or.jp/receipt/download/xenial/xenial_install_50.html

RUN set -xe \
    && cd /tmp \
	&& apt-get update \
	&& apt-get -qq -y install wget sudo syslinux-common \
	&& wget -q https://ftp.orca.med.or.jp/pub/ubuntu/archive.key \
	&& apt-key add archive.key \
	&& wget -q -O /etc/apt/sources.list.d/jma-receipt-xenial50.list https://ftp.orca.med.or.jp/pub/ubuntu/jma-receipt-xenial50.list \
	&& apt-get update \
	&& apt-get dist-upgrade -y \
	&& apt-get install -y jma-receipt \
	&& /bin/echo -e DBENCODING="UTF-8" >> /etc/jma-receipt/db.conf \
	&& service postgresql start \
	&& jma-setup \
	&& service jma-receipt start \
	&& /bin/echo -e "password99\npassword99" | sudo -u orca /usr/lib/jma-receipt/bin/passwd_store.sh \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 8000

ENTRYPOINT service postgresql restart && service jma-receipt restart && /bin/bash --login


