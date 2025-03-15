FROM rust:latest

# Install mold and dependencies
RUN apt-get update && apt-get install -y mold=1.10.1+dfsg-1 clang=1:14.0-55.7~deb12u1 lld=1:14.0-55.7~deb12u1 jq=1.6-2.1 --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

# Set mold as the default linker
ENV RUSTFLAGS="-C link-arg=-fuse-ld=mold"
ENV CARGO_PROFILE_RELEASE_LTO=true

# Install Rust tools
RUN cargo install cargo-nextest cargo-make sqlx-cli cargo-audit cargo-machete cargo-release sccache

ENV RUSTC_WRAPPER="$(which sccache)"
