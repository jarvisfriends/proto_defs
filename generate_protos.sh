#!/usr/bin/env bash
set -e # bail fast
set -x # Show execution, post failure debugging is a lot nicer this way

CUR_PATH=$(cd ../../../.. && pwd)
GOPATH="${GOPATH:-${CUR_PATH}}"
PATH="${PATH}:${GOPATH}/bin"
PB_OUT="${GOPATH}/src/github.com/jarvisfriends/proto_defs"
VER_DIR="jarvis/versions"

# Make sure we have protoc-gen-go and try to get it if its not found
if [[ ! $(command -v protoc-gen-go) ]]; then
  echo "Couldn't find protoc-gen-go, getting it now"
  cd ~/
  go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
  go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
  cd -
fi

# Verify we have protoc and error out if we don't
if [[ ! $(command -v protoc) ]]; then
  echo "Couldn't find protoc, Please install it and make sure it's in your path"
  exit 1
fi

rm -rf "${PB_OUT}/jarvis"
mkdir -p "${PB_OUT}"

protoc -I pbs \
 --proto_path=$(pwd) \
 --proto_path=$(pwd)/pbs \
 --go-grpc_opt=module=github.com/jarvisfriends/proto_defs \
 --go-grpc_out=. \
 --go_out=../../.. \
 $(find $(pwd)/pbs -name "*.proto")
