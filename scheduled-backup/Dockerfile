FROM alpine:latest

RUN apk add --no-cache py-pip py-setuptools ca-certificates gnupg mysql-client && \
    pip install s3cmd  && \
    rm -rf /var/cache/apk/*

RUN apk add tzdata && \
    cp /usr/share/zoneinfo/US/Eastern /etc/localtime && \
    echo "US/Eastern" > /etc/timezone && \
    apk del tzdata

COPY s3cfg /root/.s3cfg
COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh

VOLUME /work

WORKDIR /root
CMD ["sh", "/root/start.sh"]
