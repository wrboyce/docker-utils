FROM rust:slim as builder
RUN cargo install record-query

FROM debian:stable-slim
COPY --from=builder /usr/local/cargo/bin/rq /usr/local/bin/rq
ENTRYPOINT ["/usr/local/bin/rq"]
