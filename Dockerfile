FROM rust:latest

# Install mold and dependencies
RUN apt-get update && apt-get install -y mold clang lld jq --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

# Set mold as the default linker
ENV RUSTFLAGS="-C link-arg=-fuse-ld=mold"
ENV CARGO_PROFILE_RELEASE_LTO=true

# Install Rust tools
RUN cargo install cargo-nextest cargo-make sqlx-cli cargo-audit cargo-machete cargo-release sccache

ENV RUSTC_WRAPPER="sccache"
