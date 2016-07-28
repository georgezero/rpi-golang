FROM hypriot/rpi-alpine-scratch:v3.4

COPY repositories /etc/apk/repositories

RUN apk add --no-cache ca-certificates git go@community

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

COPY go-wrapper /usr/local/bin/
