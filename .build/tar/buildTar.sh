#!/bin/bash

SCRIPT=$(realpath "${BASH_SOURCE[0]}")
SCRIPT_DIR=$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )

VERSION=$(git describe --tags HEAD)
ROOT=$(git rev-parse --show-toplevel)
cd "${ROOT}" && git archive --format=tar HEAD --prefix="ChaosSquirrel-${VERSION}/" --output="${SCRIPT_DIR}/${VERSION}.tar.gz"
ls "${SCRIPT_DIR}/${VERSION}.tar.gz"
