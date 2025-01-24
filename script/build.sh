#!/bin/bash
CGO_ENABLED=0 GOARCH=amd64 GOOS=windows go build -o tmp/dvmf.exe -a --trimpath --ldflags="-s -w" --installsuffix cgo
CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -o tmp/dvmf -a --trimpath --ldflags="-s -w" --installsuffix cgo
ls tmp/dvmf*