#!/bin/bash

SCRIPT=$(realpath "${BASH_SOURCE[0]}")
SCRIPT_DIR=$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )

RPM_FILE=$("${SCRIPT_DIR}/../rpm/buildRpm.sh")
sudo alien -v -d --scripts "${RPM_FILE}"
