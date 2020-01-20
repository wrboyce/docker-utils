FROM rust:slim as builder
RUN cargo install bandwhich

FROM debian:stable-slim
COPY --from=builder /usr/local/cargo/bin/bandwhich /usr/local/bin/bandwhich
ENTRYPOINT ["/usr/local/bin/bandwhich"]
