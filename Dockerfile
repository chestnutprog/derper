FROM golang:1.20-alpine AS build
RUN apk --update add build-base && \
	go install tailscale.com/cmd/derper@main

FROM alpine:3.17
RUN apk add --no-cache curl
WORKDIR /
COPY --from=build /go/bin/derper /derper
ENTRYPOINT ["/derper"]
