FROM fujikawa/jma-receipt1604_50:0.2

MAINTAINER fujikawa <fujikawa.naoki@mac.com>

# https://www.orca.med.or.jp/receipt/download/xenial/xenial_install_50.html
COPY ./start.sh /
RUN chmod +x /start.sh
EXPOSE 8000
ENTRYPOINT ["/start.sh"]





