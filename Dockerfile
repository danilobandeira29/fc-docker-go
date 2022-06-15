FROM golang:latest as builder

WORKDIR /app

COPY *.go ./

RUN go mod init fullcycle && go build -o main

FROM scratch

WORKDIR /app

COPY --from=builder /app .

ENTRYPOINT ["./main"]
