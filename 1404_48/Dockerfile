# Reference to http://www.orca.med.or.jp/receipt/download/trusty/trusty_install_48.html.
FROM ubuntu:14.04
MAINTAINER fujikawa 

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
	&& apt-get install -y jma-receipt \
    && wget https://ftp.orca.med.or.jp/pub/data/receipt/outline/update/claim_update.tar.gz \
    && tar xvzf claim_update.tar.gz \
    && bash claim_update.sh \
	&& service postgresql start \
	&& jma-setup \
	&& service jma-receipt start \
	&& /bin/echo -e "password99\npassword99" | sudo -u orca /usr/lib/jma-receipt/bin/passwd_store.sh \
    && rm -rf /tmp/* \
	&& rm -rf /var/lib/apt/lists/*

COPY ./start.sh /
RUN chmod +x /start.sh
EXPOSE 8000
ENTRYPOINT ["/start.sh"]