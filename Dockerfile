FROM rust:latest

RUN cargo install cargo-nextest cargo-make sqlx-cli cargo-audit cargo-machete
