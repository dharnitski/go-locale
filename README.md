# make time.LoadLocation work in docker

## Issue
[time.LoadLocation()](https://golang.org/pkg/time/#LoadLocation) requires time database file. Lightweight Docker container fails with message  `open /usr/local/go/lib/time/zoneinfo.zip: no such file or directory` if that file not presented. This samples adds file to `scratch` image

https://stackoverflow.com/questions/46531797/docker-image-for-built-golang-binary

## Build the Image

    $ docker build -t locations .

## Start the Image

    $ docker run locations:latest