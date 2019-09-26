FROM alpine as downloader
RUN uname -a
RUN apk add --update --no-cache bash curl \
    && curl -sSLf https://raw.githubusercontent.com/dflemstr/rq/master/install.sh | bash -s -- -y -y \
    && apk del bash curl

FROM scratch
COPY --from=downloader /usr/local/bin/rq /rq
ENTRYPOINT ["/rq"]
