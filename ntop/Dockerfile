FROM alpine
RUN apk add --update --no-cache ntop
RUN ntop --set-admin-password=admin
ENTRYPOINT ["/usr/bin/ntop"]
CMD ["--http-server", "0.0.0.0:8888"]
