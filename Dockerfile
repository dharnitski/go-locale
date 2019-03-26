# Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang:1.11 as builder
WORKDIR /go/src/app/

# Copy the local package files to the container's workspace.
ADD . /go/src/app

# download fresh version of timezone db
RUN apt-get install -y tzdata
# RUN ls /usr/share/zoneinfo

# Build the service inside the container.
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM scratch

# Copy timezone database
COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo/

# Copy app
COPY --from=builder /go/src/app/app   /
ENTRYPOINT ["/app"]