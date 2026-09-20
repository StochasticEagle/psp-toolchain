#!/bin/bash
# extra.sh by Francisco Javier Trujillo Mata (fjtrujy@gmail.com)

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "${ROOT}/install-permissions.sh"

pspdev_run_install mkdir -p "${PSPDEV}/bin"

# Install psp-pkg-config
pspdev_run_install install -m755 "${ROOT}/patches/psp-pkg-config" "${PSPDEV}/bin" || exit 1
pspdev_run_install ln -sf "psp-pkg-config" "${PSPDEV}/bin/psp-pkgconf" || exit 1
echo "psp-pkg-config installation finished"

# Install psp-cmake
pspdev_run_install install -m755 "${ROOT}/patches/psp-cmake" "${PSPDEV}/bin" || exit 1
echo "psp-cmake installation finished"
