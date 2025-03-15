# Rust CI/CD Image

![Docker Image Version](https://img.shields.io/badge/version-latest-blue.svg)

A simple image which can be used for Rust ci/cd flows.

## Features

- **Base Image**: Built on the latest Rust image
- **Cargo tools**: `nextest`, `make`, `audit`, `machete`
- **General tools**: `sqlx-cli`

## Installation

You can pull this image from Docker Hub by running:

```bash
docker pull arthurdw/rust-ci:latest
```

## Usage

This image is intended for use in your Rust CI/CD processes. You can run a
container using the following command:

```bash
docker run -it --rm arthurdw/rust-ci
```

## Example Deployment

You can use this image in your PR pipelines. Here’s a brief example of how you
might configure it in a CI/CD tool:

```yaml
jobs:
  test:
    steps:
      - name: Run all tests
        uses: arthurdw/rust-ci:latest
        with:
          args: cargo nextest --all
```

## Contributing

If you have suggestions for improvements or new features, feel free to submit a pull request or open an issue in this repository.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
