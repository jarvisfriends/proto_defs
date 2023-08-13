#!/bin/bash

PATH="${PATH}:${HOME}/go/bin"
OUTPUT="output"
mkdir -p ${OUTPUT}

# Install
# brew install protoc-gen-grpc-web
# npm install -g protoc-gen-js

if [[ ! $(command -v protoc-gen-go) ]]; then
  echo "Couldn't find protoc-gen-go, getting it now"
  cd ~/ && go install google.golang.org/protobuf/cmd/protoc-gen-go@latest ; cd -
fi
if [[ ! $(command -v protoc-gen-go-grpc) ]]; then
  echo "Couldn't find protoc-gen-go-grpc, getting it now"
  cd ~/ && go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest ; cd -
fi

protoc --go-grpc_out=${OUTPUT} \
  jarvis/versions/Application.proto \
  jarvis/versions/App_info.proto \
  jarvis/versions/Job_execution.proto \
  jarvis/versions/Machine_stats.proto \
  thoughts/Run_program.proto

#  --js_out=import_style=commonjs:${OUTPUT} \
#  --grpc-web_out=import_style=commonjs,mode=grpcwebtext:${OUTPUT} \