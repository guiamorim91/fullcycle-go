FROM golang:1.20 AS builder
WORKDIR /usr/src/app

COPY rocks.go .
RUN go build rocks.go && ./rocks

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .
ENTRYPOINT [ "./rocks" ]