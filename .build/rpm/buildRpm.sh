#!/bin/bash

SCRIPT=$(realpath "${BASH_SOURCE[0]}")
SCRIPT_DIR=$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )

VERSION=$(git describe --tags HEAD)
TAR_FILE=$("${SCRIPT_DIR}/../tar/buildTar.sh")

mkdir -p ~/rpmbuild/SOURCES
cp -a "${TAR_FILE}" ~/rpmbuild/SOURCES

cd ${SCRIPT_DIR} || exit 1
{
cat ChaosSquirrel.spec.in \
| sed s/@VERSION@/$VERSION/g
} > ChaosSquirrel.spec
RPM_FILE=$(rpmbuild -bb ChaosSquirrel.spec 2>&1 | grep -F Wrote: | awk '{print $2}')
[ -f "${RPM_FILE}" ] && mv "${RPM_FILE}" "${SCRIPT_DIR}"
ls "${SCRIPT_DIR}/$(basename "${RPM_FILE}")"
