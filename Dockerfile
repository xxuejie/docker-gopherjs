# Build
FROM golang:1.9-alpine3.6 as builder
MAINTAINER Xuejie Xiao <xxuejie@gmail.com>
RUN apk --no-cache add git gcc g++ musl-dev
RUN go get -u github.com/gopherjs/gopherjs

# Run
FROM node:alpine
MAINTAINER Xuejie Xiao <xxuejie@gmail.com>
RUN npm install --global source-map-support
COPY --from=builder /go/bin/gopherjs /bin/gopherjs
CMD ["/bin/gopherjs", "--help"]

