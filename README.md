# Open-telemetry-collector

## Introduction

The implementation is based on
[open-telemetry/opentelemetry-collector](https://github.com/open-telemetry/opentelemetry-collector)
and
[open-telemetry/opentelemetry-collector-contrib](https://github.com/open-telemetry/opentelemetry-collector-contrib)
versions of open-telemetry-collector.

For more details about open-telemetry approach for processing traces, metrics and logs see
[https://opentelemetry.io/docs](https://opentelemetry.io/docs/)

Open-telemetry-collector approach for configuration see
[here](https://opentelemetry.io/docs/collector/configuration/)
New modules development approach see
[here](https://opentelemetry.io/docs/collector/building/)

## Supported modules

The following third-party modules are supported by this implementation of  open-telemetry-collector:

* [spanmetricsconnector](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/connector/spanmetricsconnector/README.md)
* [debugexporter](https://github.com/open-telemetry/opentelemetry-collector/blob/main/exporter/debugexporter/README.md)
* [otlpexporter](https://github.com/open-telemetry/opentelemetry-collector/blob/main/exporter/otlpexporter/README.md)
* [prometheusexporter](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/exporter/prometheusexporter/README.md)
* [jaegerexporter](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/v0.85.0/exporter/jaegerexporter)
* [healthcheckextension](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/extension/healthcheckextension/README.md)
* [pprofextension](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/extension/pprofextension/README.md)
* [batchprocessor](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/extension/pprofextension/README.md)
* [filterprocessor](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/processor/filterprocessor/README.md)
* [probabilisticsamplerprocessor](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/processor/probabilisticsamplerprocessor/README.md)
* [transformprocessor](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/processor/transformprocessor/README.md)
* [otlpreceiver](https://github.com/open-telemetry/opentelemetry-collector/blob/main/receiver/otlpreceiver/README.md)
* [jaegerreceiver](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/receiver/jaegerreceiver/README.md)
* [zipkinreceiver](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/receiver/zipkinreceiver)

Also there are custom implementations for

* [sentryreceiver](receiver/sentryreceiver), see also the [document](docs/sentry-receiver.md#sentry-envelope-mapping-to-jaeger-traces)
* [sentrymetricsconnector](connector/sentrymetricsconnector), see also the [document](docs/sentry-receiver.md#sentry-envelope-to-metrics)
* [logtcpexporter](exporter/logtcpexporter), see also the [document](docs/sentry-receiver.md#sentry-envelope-to-logs-records-graylog-mapping)  

All third-party and custom modules are listed in [componets.go](components.go).
