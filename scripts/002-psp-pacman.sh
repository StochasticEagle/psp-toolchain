#!/bin/bash
# psp-pacman.sh

set -e

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE="${ROOT}/components/psp-pacman"

# TODO: Fix PACMAN compilation issues for Windows
OSVER=$(uname)
if [ "${OSVER:0:5}" == "MINGW" ]; then
    exit 0
fi

if [ ! -f "${SOURCE}/pacman.sh" ]; then
    echo "ERROR: psp-pacman submodule is not initialized."
    echo "Run: git submodule update --init --recursive --depth=1"
    exit 1
fi

cd "${SOURCE}"
./pacman.sh
