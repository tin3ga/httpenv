FROM golang:alpine AS builder
COPY httpenv.go /go
RUN go build httpenv.go

FROM scratch
COPY --from=builder /go/httpenv /httpenv
CMD ["/httpenv"]
EXPOSE 8888
