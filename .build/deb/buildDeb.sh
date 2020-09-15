#!/bin/bash

SCRIPT=$(realpath "${BASH_SOURCE[0]}")
SCRIPT_DIR=$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )

RPM_FILE=$("${SCRIPT_DIR}/../rpm/buildRpm.sh")
DEB_FILE=$(sudo alien -d --scripts "${RPM_FILE}" | grep -F generated | awk '{print $1}')

sudo chown -R $(id -un):$(id -gn) "${SCRIPT_DIR}/${DEB_FILE}"
ls "${SCRIPT_DIR}/${DEB_FILE}"
