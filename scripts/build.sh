#!/bin/bash

set -e

BUILD_DIR=$(cd $(dirname "$0"); pwd)
source $BUILD_DIR/common.sh

sudo docker build -t $REGISTRY/$IMAGE:$VERSION -t $REGISTRY/$IMAGE:latest .

sudo docker push $REGISTRY/$IMAGE:$VERSION
sudo docker push $REGISTRY/$IMAGE:latest
