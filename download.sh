#!/bin/bash
set -euox pipefail
cd "$(dirname "$0")"

# The format of glibc source files.
# After downloading: glibc-[GLIBC_VERSION][FILE_EXT]
# After extracting: glibc-[GLIBC_VERSION]
GLIBC_VERSION="$1"
SOURCE_DIR="$2"
FILE_EXT=".tar.gz"
FILE_NAME="glibc-${GLIBC_VERSION}${FILE_EXT}"

# Download the source.
DOWNLOAD_URL="https://ftp.gnu.org/gnu/glibc/${FILE_NAME}"
wget -O "${SOURCE_DIR}/${FILE_NAME}" "${DOWNLOAD_URL}"
tar -xvf "${SOURCE_DIR}/${FILE_NAME}" -C "${SOURCE_DIR}"
rm -rf "${SOURCE_DIR}/${FILE_NAME}"

