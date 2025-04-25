# Stage 1: Build
FROM golang:1.24.2-alpine3.21 AS builder

ARG OTEL_VERSION=0.124.0

WORKDIR /build

# Copy the manifest file and other necessary files
COPY builder-config.yaml builder-config.yaml
COPY ./collector ./collector
COPY ./connector ./connector
COPY ./exporter ./exporter
COPY ./receiver ./receiver
COPY ./utils ./utils

# Install the builder tool
RUN go install go.opentelemetry.io/collector/cmd/builder@v${OTEL_VERSION} \
    && CGO_ENABLED=0 builder --config=builder-config.yaml

# Stage 2: Final Image
FROM alpine:3.21

ENV USER_ID=65534

WORKDIR /app

# Copy the generated collector binary from the builder stage
COPY --from=builder /build/collector/qubership-otec /app/qubership-otec

# Copy the configuration file
#COPY config.yaml .

# Expose necessary ports
EXPOSE 4317/tcp 4318/tcp 13133/tcp

USER ${USER_ID}

# Set the default entrypoint and command
ENTRYPOINT ["/app/qubership-otec"]
CMD ["--config=config.yaml"]
