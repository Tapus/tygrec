#!/bin/bash

set -e

kubectl patch deployment/la-quete -n la-quete -p \
    "{\"spec\":{\"template\":{\"metadata\":{\"labels\":{\"date\":\"`date +'%s'`\"}}}}}"
