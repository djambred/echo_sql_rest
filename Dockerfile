FROM golang:1.17-alpine AS build

ENV GO111MODULE=on
WORKDIR /app
COPY . ./
COPY ./go.mod ./
COPY ./go.sum ./
# Fetch dependencies
RUN go mod download

# Build
RUN go build main.go

FROM alpine:3.13
COPY --from=build /app /usr/local/bin/

EXPOSE 80
CMD ["main"]
