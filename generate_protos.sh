#/bin/bash

PROTOC_BIN=~/Downloads/protoc-3.6.0-osx-x86_64/bin/protoc
PATH="${PATH}:/Users/amarcum/go/bin"

echo ""

${PROTOC_BIN} -I jarvis/versions jarvis/versions/Application.proto App_info.proto --go_out=plugins=grpc:jarvis/versions

