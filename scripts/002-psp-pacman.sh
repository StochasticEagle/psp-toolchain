#!/bin/bash
# psp-pacman.sh

set -e

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE="${ROOT}/components/psp-pacman"

if [ ! -f "${SOURCE}/build-and-install.sh" ]; then
    echo "ERROR: psp-pacman submodule is not initialized."
    echo "Run: git submodule update --init --recursive --depth=1"
    exit 1
fi

cd "${SOURCE}"
./build-and-install.sh
