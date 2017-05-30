FROM fujikawa/jma-receipt1604_50:0.1

MAINTAINER fujikawa <fujikawa.naoki@mac.com>

# https://www.orca.med.or.jp/receipt/download/xenial/xenial_install_50.html

RUN set -xe \
    && cd \
	&& apt-get update \
	&& apt-get install -y jma-receipt \
    && /bin/echo -e DBENCODING="UTF-8" >> /etc/jma-receipt/db.conf \
	&& service postgresql start \
	&& jma-setup \
	&& service jma-receipt start \
	&& /bin/echo -e "password99\npassword99" | sudo -u orca /usr/lib/jma-receipt/bin/passwd_store.sh \
    && rm -rf /tmp/* \
	&& rm -rf /var/lib/apt/lists/*
	
ENTRYPOINT /bin/bash --login


