#!/bin/bash
# extra.sh by Francisco Javier Trujillo Mata (fjtrujy@gmail.com)

# install psp-pkg-config
mkdir -p "${PSPDEV}/bin"
install -m755 ../patches/psp-pkg-config "${PSPDEV}/bin" || { exit 1; }
cd "${PSPDEV}/bin"
ln -sf "psp-pkg-config" "psp-pkgconf" || { exit 1; }
echo "psp-pkg-config installation finished"

# Install psp-cmake patch
mkdir -p "${PSPDEV}/bin"
install -m755 ../patches/psp-cmake "${PSPDEV}/bin" || { exit 1; }
echo "psp-cmake installation finished"
