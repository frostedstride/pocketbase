FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o pocketbase ./examples/base

FROM alpine:latest

RUN apk add --no-cache \
    ca-certificates

COPY --from=builder /app/pocketbase /usr/local/bin/pocketbase

# Uncomment the following lines if you have migrations or hooks to copy
# COPY ./pb_migrations /pb/pb_migrations
# COPY ./pb_hooks /pb/pb_hooks

EXPOSE 8080
CMD ["/usr/local/bin/pocketbase", "serve", "--http=0.0.0.0:8080"]
