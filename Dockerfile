FROM golang:alpine AS builder
COPY . /go/src/github.com/mkrull/golang-minikube-seed
WORKDIR /go/src/github.com/mkrull/golang-minikube-seed

RUN go build -o app

FROM alpine
COPY --from=builder /go/src/github.com/mkrull/golang-minikube-seed/app /

EXPOSE 3000
CMD /app

