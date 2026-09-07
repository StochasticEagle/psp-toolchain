#!/bin/bash
# extra.sh by Francisco Javier Trujillo Mata (fjtrujy@gmail.com)

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p "${PSPDEV}/bin"

# Install psp-pkg-config
install -m755 "${ROOT}/patches/psp-pkg-config" "${PSPDEV}/bin" || exit 1
ln -sf "psp-pkg-config" "${PSPDEV}/bin/psp-pkgconf" || exit 1
echo "psp-pkg-config installation finished"

# Install psp-cmake
install -m755 "${ROOT}/patches/psp-cmake" "${PSPDEV}/bin" || exit 1
echo "psp-cmake installation finished"
