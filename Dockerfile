FROM golang:1.10-alpine3.8 AS builder
WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o hello_fc


FROM scratch
COPY --from=builder /go/src/app/hello_fc /hello_fc
CMD ["/hello_fc"]