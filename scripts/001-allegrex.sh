#!/bin/bash
# allegrex.sh

set -e

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE="${ROOT}/components/psp-toolchain-allegrex"

if [ ! -f "${SOURCE}/toolchain.sh" ]; then
    echo "ERROR: psp-toolchain-allegrex submodule is not initialized."
    echo "Run: git submodule update --init --recursive --depth=1"
    exit 1
fi

cd "${SOURCE}"
./toolchain.sh
