#!/bin/bash
set -euxo pipefail
WORK_DIR=$(pwd)
cd $(dirname "$0")

PROJECT_DIR="${CPU_ARCH}-${GLIBC_VERSION}"
SOURCE_DIR="${WORK_DIR}/${PROJECT_DIR}/source"
BUILD_DIR="${WORK_DIR}/${PROJECT_DIR}/build"
INSTALL_DIR="${WORK_DIR}/${PROJECT_DIR}/install"
BUILD_SCRIPT="build.sh"

# Prepare
mkdir -p ${SOURCE_DIR} ${BUILD_DIR} ${INSTALL_DIR}
touch ${BUILD_SCRIPT}

# Downlaod
source "${WORK_DIR}/download.sh" ${GLIBC_VERSION} ${SOURCE_DIR}

# Show info
echo "version:  ${GLIBC_VERSION}"
echo "CPU arch: ${CPU_ARCH}"
echo "source:   ${SOURCE_DIR}"
echo "build:    ${BUILD_DIR}"
echo "install:  ${INSTALL_DIR}"

# Build a script
echo "#!/bin/bash" > ${BUILD_SCRIPT}
echo "set -euox pipefail" >> ${BUILD_SCRIPT}
echo "cd \$(dirname \"\$0\")" >> ${BUILD_SCRIPT}
echo "CPU_ARCH=${CPU_ARCH} \\" >> ${BUILD_SCRIPT}
echo "SOURCE_DIR=${SOURCE_DIR}/glibc-${GLIBC_VERSION} \\" >> ${BUILD_SCRIPT}
echo "INSTALL_DIR=${INSTALL_DIR} \\" >> ${BUILD_SCRIPT}
echo "./conf_build.sh" >> ${BUILD_SCRIPT}

chmod +x ${BUILD_SCRIPT}
cp "${WORK_DIR}/conf_build.sh" ${BUILD_DIR}
mv ${BUILD_SCRIPT} ${BUILD_DIR}

