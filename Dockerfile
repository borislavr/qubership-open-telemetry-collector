FROM golang:1.23.4-alpine3.21 AS builder

ARG GOPROXY=""
ENV GOSUMDB=off \
    GO111MODULE=on

WORKDIR /workspace

COPY go.mod go.mod
COPY go.sum go.sum

COPY *.go ./
COPY connector/ connector/
COPY exporter/ exporter/
COPY receiver/ receiver/
COPY utils/ utils/

RUN go mod download -x

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o qubership-open-telemetry-collector .

FROM alpine:3.21.0
COPY --from=builder --chown=10001:0 /workspace/qubership-open-telemetry-collector /otec
