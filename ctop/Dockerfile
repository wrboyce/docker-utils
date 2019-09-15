FROM golang AS builder
WORKDIR /go/src/github.com/bcicen/ctop
ENV CTOP_VERSION v0.7.2
RUN git clone -q --branch $CTOP_VERSION https://github.com/bcicen/ctop.git .
RUN make build

FROM alpine
COPY --from=builder /go/src/github.com/bcicen/ctop/ctop /usr/bin/ctop
ENTRYPOINT ["/usr/bin/ctop"]
