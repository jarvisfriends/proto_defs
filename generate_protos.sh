#!/bin/bash

PATH="${PATH}:${HOME}/go/bin"

protoc -I jarvis/versions jarvis/versions/Application.proto App_info.proto --go_out=plugins=grpc:jarvis/versions

