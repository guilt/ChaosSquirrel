#!/bin/bash

SCRIPT=$(realpath "${BASH_SOURCE[0]}")
SCRIPT_DIR=$( cd "$( dirname "${SCRIPT}" )" >/dev/null 2>&1 && pwd )

RPM_FILE=$(rpmbuild -bb ChaosSquirrel.spec 2>&1 | grep -F Wrote: | awk '{print $2}')
[ -f "${RPM_FILE}" ] && mv "${RPM_FILE}" "${SCRIPT_DIR}"
ls "${SCRIPT_DIR}/$(basename "${RPM_FILE}")"
