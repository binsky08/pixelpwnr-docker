FROM rust:1.64.0 as builder

RUN git clone https://github.com/timvisee/pixelpwnr --depth 1 /opt/pixelpwnr
WORKDIR /opt/pixelpwnr
RUN cargo build --release


FROM debian:bullseye-slim
COPY --from=builder /opt/pixelpwnr/target/release/pixelpwnr /usr/local/bin/pixelpwnr

ENTRYPOINT ["pixelpwnr"]
