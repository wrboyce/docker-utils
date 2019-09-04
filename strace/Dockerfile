FROM alpine
RUN apk add --update --no-cache strace
ENTRYPOINT ["/usr/bin/strace"]
CMD ["-p", "1"]
