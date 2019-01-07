FROM alpine:latest

RUN apk add --no-cache py-pip py-setuptools ca-certificates gnupg tzdata ssmtp && \
    cp /usr/share/zoneinfo/US/Eastern /etc/localtime && \
    echo "US/Eastern" > /etc/timezone && \
    pip install s3cmd  && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

RUN apk add --no-cache mysql-client && \
    rm -rf /var/cache/apk/*

COPY s3cfg /root/.s3cfg
COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh

VOLUME /work

WORKDIR /root
CMD ["sh", "/root/start.sh"]