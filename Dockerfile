FROM alpine:latest

RUN apk add --no-cache \
    ca-certificates

COPY .builds /pb/

# COPY ./pb_migrations /pb/pb_migrations
# COPY ./pb_hooks /pb/pb_hooks
EXPOSE 8080
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]
