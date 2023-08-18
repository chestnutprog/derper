FROM golang:1.21-alpine AS build
RUN apk --update add build-base && \
	go install tailscale.com/cmd/derper@v1.48.0

FROM alpine:3.18
RUN apk add --no-cache curl
WORKDIR /
COPY --from=build /go/bin/derper /derper
ENTRYPOINT ["/derper"]
