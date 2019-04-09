FROM debian:8
RUN apt-get -y update
RUN apt-get install -y curl supervisor git openssl build-essential libssl-dev wget vim curl unzip autoconf libtool automake ed
WORKDIR /apps/
RUN wget -O SQUID-360-peering-for-SslBump.zip https://github.com/measurement-factory/squid/archive/SQUID-360-peering-for-SslBump.zip 
RUN unzip SQUID-360-peering-for-SslBump.zip \
    && cd /apps/squid-SQUID-360-peering-for-SslBump/ \
    && ./bootstrap.sh \
    && ./configure --prefix=/apps/squid --enable-icap-client --enable-ssl --with-openssl --enable-ssl-crtd --enable-security-cert-generators=file --enable-auth --enable-basic-auth-helpers="NCSA" --with-default-user=nobody \
    && make -j4 \
    && make install \
    && cd /apps \
    && rm -rf /apps/squid-SQUID-360-peering-for-SslBump
ADD . /apps/

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN chmod +x /apps/init_and_run.sh

EXPOSE 3128
