#!/usr/bin/env bash

cd "$(dirname "$0")"

./ocb version || (
    curl --proto '=https' --tlsv1.2 -fL -o ocb \
    https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/cmd%2Fbuilder%2Fv0.122.1/ocb_0.122.1_linux_amd64
    chmod +x ocb
    ) || exit 1

./ocb --ldflags="" --gcflags="" --verbose --config ./builder-config.yml

