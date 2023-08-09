#!/bin/sh
if [ "$IS_CONTAINER" != "" ]; then
  yamllint ./plugins/
else
  docker run --rm \
    --env IS_CONTAINER=TRUE \
    --volume "${PWD}:/workdir:z" \
    --entrypoint sh \
    quay.io/coreos/yamllint \
    ./hack/yamllint.sh
fi;