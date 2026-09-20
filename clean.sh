#!/bin/bash

set -e

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ALLEGREX="${ROOT}/components/psp-toolchain-allegrex"
PACMAN="${ROOT}/components/psp-pacman"

clean_build_dir() {
    local dir="$1"
    if [[ -d "${dir}" ]]; then
        find "${dir}" -mindepth 1 -delete
        rmdir "${dir}" 2>/dev/null || true
    fi
}

clean_build_dir "${ROOT}/build"
clean_build_dir "${ALLEGREX}/build"

PTHREAD="${ALLEGREX}/components/pthread/platform/psp"
if [[ -f "${PTHREAD}/Makefile" ]]; then
    make -C "${PTHREAD}" clean
fi

if [[ -x "${PACMAN}/clean.sh" ]]; then
    "${PACMAN}/clean.sh"
fi
