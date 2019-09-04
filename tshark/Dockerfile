FROM alpine
RUN apk add --update --no-cache tshark
ENTRYPOINT ["/usr/bin/tshark"]
CMD ["-i", "any"]
