FROM alpine
RUN apk add --update --no-cache tcpdump
ENTRYPOINT ["/usr/sbin/tcpdump"]
CMD ["-i", "any"]
