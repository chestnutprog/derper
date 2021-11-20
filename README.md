# derper

Pre-built Docker Image of [tailscale derper](https://github.com/tailscale/tailscale/tree/main/cmd/derper)

## Usgae 

```sh
docker run -p 443:443 -p 3478:3478/udp -d -t arbal/derper -hostname example.net -stun
```
