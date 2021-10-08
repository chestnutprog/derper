FROM golang:1.17-alpine AS build
RUN go install tailscale.com/cmd/derper@main

FROM alpine:3.14
WORKDIR /
COPY --from=build /go/bin/derper /derper
ENTRYPOINT ["/derper"]