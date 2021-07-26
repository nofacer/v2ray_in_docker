FROM alpine:3.14

RUN apk add bash
WORKDIR app
COPY v2ray-linux-64.zip v2ray-linux-64.zip
COPY go.sh go.sh
RUN ./go.sh -l v2ray-linux-64.zip
RUN rm v2ray-linux-64.zip
RUN rm go.sh

VOLUME /etc/v2ray
EXPOSE 1080
EXPOSE 8001

CMD /usr/bin/v2ray/v2ray -config /etc/v2ray/config.json
