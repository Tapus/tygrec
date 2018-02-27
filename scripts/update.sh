#!/bin/bash

set -e

BUILD_DIR=$(cd $(dirname "$0"); pwd)
source $BUILD_DIR/common.sh

kubectl set image $DEPLOYMENT $CONTAINER=$REGISTRY:$VERSION -n $NAMESPACE
