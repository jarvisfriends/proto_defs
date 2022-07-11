#!/usr/bin/env sh
#set -x

GO_RELEASER_IMAGE=goreleaser/goreleaser:v1.10.1
APK_PACKAGES="bash protoc protobuf-dev gcc go musl-dev"

runInDocker ()
{
  RUN_CMD="${1}"
  docker run --rm \
   -v "${PWD}":/go/src/github.com/jarvisfriends/proto_defs \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -w /go/src/github.com/jarvisfriends/proto_defs --entrypoint="" ${GO_RELEASER_IMAGE} \
    bash -c \
   "${RUN_CMD}"
}

Generate()
{
  runInDocker "
 apk add --no-cache ${APK_PACKAGES} && \
 ./generate_protos.sh"
}

# Call any 'exported' function, aka any function that begins with a capital first letter
# First, get the first character.
FIRST_LETTER=$(echo "$1" | cut -c 1-1 )
FIRST_CAP=$(echo "${FIRST_LETTER}" | tr '[a-z]' '[A-Z]')

# Safety check: First char must be a capital letter :).
if [ "${FIRST_LETTER}" = "${FIRST_CAP}" ]; then
  $1
else
  echo "Enter a valid function"
  bash declare -F
fi