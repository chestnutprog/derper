FROM golang:1.18-alpine AS build
RUN apk --update add build-base && \
    go install tailscale.com/cmd/derper@main

FROM alpine:3.15
WORKDIR /
COPY --from=build /go/bin/derper /derper
ENTRYPOINT ["/derper"]
